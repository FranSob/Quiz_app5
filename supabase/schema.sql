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
