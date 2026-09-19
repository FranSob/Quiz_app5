// Usuwanie konta ucznia na jego własne żądanie.
//
// Wdrożenie (jednorazowo, w katalogu projektu):
//   supabase functions deploy delete-account
// Funkcja używa klucza service_role, który Supabase wstrzykuje automatycznie
// jako zmienną środowiskową — nie trzeba go nigdzie wklejać.
//
// Aplikacja wywołuje ją z tokenem zalogowanego ucznia, więc usunąć można
// wyłącznie własne konto.

import { createClient } from 'jsr:@supabase/supabase-js@2';

Deno.serve(async (req) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'method not allowed' }), { status: 405 });
  }

  const authHeader = req.headers.get('Authorization') ?? '';
  const token = authHeader.replace('Bearer ', '').trim();
  if (!token) {
    return new Response(JSON.stringify({ error: 'missing token' }), { status: 401 });
  }

  const url = Deno.env.get('SUPABASE_URL')!;
  const serviceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;

  // Kim jest proszący — sprawdzamy jego własnym tokenem.
  const asUser = createClient(url, Deno.env.get('SUPABASE_ANON_KEY')!, {
    global: { headers: { Authorization: `Bearer ${token}` } },
  });
  const { data: userData, error: userError } = await asUser.auth.getUser();
  if (userError || !userData.user) {
    return new Response(JSON.stringify({ error: 'invalid token' }), { status: 401 });
  }
  const userId = userData.user.id;

  // Usuwanie danych i konta — kluczem serwerowym.
  const admin = createClient(url, serviceKey);
  await admin.from('progress').delete().eq('user_id', userId);
  await admin.from('subscriptions').delete().eq('user_id', userId);
  const { error } = await admin.auth.admin.deleteUser(userId);
  if (error) {
    return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  }

  return new Response(JSON.stringify({ deleted: true }), {
    headers: { 'Content-Type': 'application/json' },
  });
});
