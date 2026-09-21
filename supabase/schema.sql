-- Schemat bazy dla BioMatury. Wklej całość w Supabase → SQL Editor → Run.
-- Można uruchamiać wielokrotnie.

-- Postęp nauki jednego ucznia: cały stan aplikacji jako JSON.
create table if not exists public.progress (
  user_id uuid primary key references auth.users (id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.progress enable row level security;

-- Każdy widzi i zmienia wyłącznie swój własny wiersz.
drop policy if exists "progress_select_own" on public.progress;
create policy "progress_select_own" on public.progress
  for select using (auth.uid() = user_id);

drop policy if exists "progress_insert_own" on public.progress;
create policy "progress_insert_own" on public.progress
  for insert with check (auth.uid() = user_id);

drop policy if exists "progress_update_own" on public.progress;
create policy "progress_update_own" on public.progress
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "progress_delete_own" on public.progress;
create policy "progress_delete_own" on public.progress
  for delete using (auth.uid() = user_id);

-- Stan subskrypcji. Wypełnia go wyłącznie funkcja serwerowa weryfikująca
-- zakup w Google Play (działa z kluczem service_role, więc omija RLS).
-- Aplikacja może ten wiersz tylko czytać — dzięki temu Premium nie da się
-- włączyć, podmieniając dane w telefonie.
create table if not exists public.subscriptions (
  user_id uuid primary key references auth.users (id) on delete cascade,
  product_id text,
  purchase_token text,
  status text not null default 'none',
  expires_at timestamptz,
  updated_at timestamptz not null default now()
);

alter table public.subscriptions enable row level security;

drop policy if exists "subscriptions_select_own" on public.subscriptions;
create policy "subscriptions_select_own" on public.subscriptions
  for select using (auth.uid() = user_id);

-- Liga i ranking klasowy. Klasa to po prostu krótki kod, po którym dołączają
-- do niej koledzy z klasy — bez kont nauczycielskich ani rabatów (to osobna,
-- jeszcze nie zrobiona funkcja z planu).
create table if not exists public.groups (
  id text primary key,
  name text,
  created_by uuid references auth.users (id) on delete set null,
  created_at timestamptz not null default now()
);

alter table public.groups enable row level security;

-- Członkostwo w klasie: pseudonim i XP widoczne dla współklasowiczów, żeby
-- zbudować ranking, bez ujawniania e-maila ani reszty postępu ucznia.
create table if not exists public.group_members (
  group_id text not null references public.groups (id) on delete cascade,
  user_id uuid not null references auth.users (id) on delete cascade,
  nickname text not null,
  xp integer not null default 0,
  updated_at timestamptz not null default now(),
  primary key (group_id, user_id)
);

-- Jedno konto należy naraz tylko do jednej klasy.
create unique index if not exists group_members_one_group_per_user on public.group_members (user_id);

alter table public.group_members enable row level security;

-- Pomocnicza funkcja z ominięciem RLS — bezpieczny sposób, żeby polityki
-- poniżej mogły sprawdzić „moje klasy" bez rekurencyjnego odpytywania tej
-- samej, chronionej przez RLS tabeli.
-- Musi powstać przed politykami, które jej używają.
create or replace function public.my_group_ids()
returns setof text
language sql
security definer
stable
set search_path = public
as $$
  select group_id from public.group_members where user_id = auth.uid();
$$;

-- Kod klasy jest hasłem wstępu, więc tabeli klas nie wolno dać odczytać w całości:
-- inaczej każdy zalogowany pobrałby listę wszystkich kodów i dołączył, gdzie chce.
-- Widać więc tylko klasy, do których się należy, a dołączanie idzie przez
-- funkcję join_group, która sprawdza konkretny kod.
drop policy if exists "groups_select_authenticated" on public.groups;
drop policy if exists "groups_select_own" on public.groups;
create policy "groups_select_own" on public.groups
  for select using (id in (select public.my_group_ids()));

drop policy if exists "groups_insert_authenticated" on public.groups;
create policy "groups_insert_authenticated" on public.groups
  for insert with check (auth.role() = 'authenticated');

-- Widzisz tylko członków klas, do których sam należysz.
drop policy if exists "group_members_select_same_group" on public.group_members;
create policy "group_members_select_same_group" on public.group_members
  for select using (group_id in (select public.my_group_ids()));

drop policy if exists "group_members_insert_own" on public.group_members;
create policy "group_members_insert_own" on public.group_members
  for insert with check (auth.uid() = user_id);

drop policy if exists "group_members_update_own" on public.group_members;
create policy "group_members_update_own" on public.group_members
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "group_members_delete_own" on public.group_members;
create policy "group_members_delete_own" on public.group_members
  for delete using (auth.uid() = user_id);

-- XP do rankingu bierzemy z zapisanego postępu, a nie z tego, co przyśle telefon.
-- Inaczej wystarczyłoby podmienić jedną liczbę w żądaniu, żeby wygrać ligę.
create or replace function public.my_saved_xp()
returns integer
language sql
security definer
stable
set search_path = public
as $$
  select coalesce((data ->> 'totalXp')::integer, 0)
  from public.progress
  where user_id = auth.uid();
$$;

-- Dołączenie do klasy po kodzie. Funkcja sprawdza kod, więc uczeń nie musi
-- (i nie może) czytać całej tabeli klas.
create or replace function public.join_group(p_code text, p_nickname text)
returns table (group_id text, group_name text)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_code text := upper(regexp_replace(coalesce(p_code, ''), '\s', '', 'g'));
  v_name text;
  v_nickname text := left(nullif(btrim(coalesce(p_nickname, '')), ''), 24);
begin
  if auth.uid() is null then
    raise exception 'Trzeba być zalogowanym.';
  end if;
  select g.name into v_name from public.groups g where g.id = v_code;
  if not found then
    raise exception 'Nie ma klasy o takim kodzie.';
  end if;
  delete from public.group_members where user_id = auth.uid();
  insert into public.group_members (group_id, user_id, nickname, xp)
  values (v_code, auth.uid(), coalesce(v_nickname, 'Uczeń'), coalesce(public.my_saved_xp(), 0));
  return query select v_code, v_name;
end;
$$;

-- Odświeżenie własnego wyniku w rankingu: pseudonim od ucznia, XP z postępu.
create or replace function public.refresh_my_league_score(p_nickname text)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_nickname text := left(nullif(btrim(coalesce(p_nickname, '')), ''), 24);
begin
  if auth.uid() is null then
    return;
  end if;
  update public.group_members
  set nickname = coalesce(v_nickname, nickname),
      xp = coalesce(public.my_saved_xp(), 0),
      updated_at = now()
  where user_id = auth.uid();
end;
$$;

revoke all on function public.join_group(text, text) from public;
revoke all on function public.refresh_my_league_score(text) from public;
revoke all on function public.my_saved_xp() from public;
grant execute on function public.join_group(text, text) to authenticated;
grant execute on function public.refresh_my_league_score(text) to authenticated;
