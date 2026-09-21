// Sprawdzenie zakupu subskrypcji w Google Play i zapisanie statusu Premium.
//
// Dlaczego na serwerze: telefon może skłamać. Tutaj pytamy Google, czy token
// zakupu jest prawdziwy i czy subskrypcja jest aktywna, a wynik zapisujemy
// w tabeli, do której aplikacja ma wyłącznie odczyt.
//
// Konfiguracja (jednorazowo):
//   1. W Konsoli Google Play: Ustawienia → Dostęp do API → połącz projekt Google
//      Cloud i utwórz konto usługi z uprawnieniem „Wyświetlanie danych finansowych"
//      oraz „Zarządzanie zamówieniami i subskrypcjami".
//   2. Pobierz plik JSON konta usługi.
//   3. supabase secrets set GOOGLE_SERVICE_ACCOUNT="$(cat konto-uslugi.json)"
//      supabase secrets set ANDROID_PACKAGE_NAME="pl.biomatura.app"
//   4. supabase functions deploy verify-purchase

import { createClient } from 'jsr:@supabase/supabase-js@2';
import { create as createJwt, getNumericDate } from 'https://deno.land/x/djwt@v3.0.2/mod.ts';

const GOOGLE_TOKEN_URL = 'https://oauth2.googleapis.com/token';
const PLAY_API = 'https://androidpublisher.googleapis.com/androidpublisher/v3';

// Stany, przy których uczeń ma prawo do Premium — łącznie z okresem karencji,
// gdy płatność się nie powiodła, ale Google jeszcze ponawia próbę.
const ACTIVE_STATES = ['SUBSCRIPTION_STATE_ACTIVE', 'SUBSCRIPTION_STATE_IN_GRACE_PERIOD'];

async function googleAccessToken(): Promise<string> {
  const serviceAccount = JSON.parse(Deno.env.get('GOOGLE_SERVICE_ACCOUNT') ?? '{}');
  if (!serviceAccount.client_email || !serviceAccount.private_key) {
    throw new Error('Brak konta usługi Google (GOOGLE_SERVICE_ACCOUNT).');
  }

  const pem = serviceAccount.private_key
    .replace(/-----BEGIN PRIVATE KEY-----/, '')
    .replace(/-----END PRIVATE KEY-----/, '')
    .replace(/\s/g, '');
  const der = Uint8Array.from(atob(pem), (c) => c.charCodeAt(0));
  const key = await crypto.subtle.importKey(
    'pkcs8',
    der,
    { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' },
    false,
    ['sign'],
  );

  const assertion = await createJwt({ alg: 'RS256', typ: 'JWT' }, {
    iss: serviceAccount.client_email,
    scope: 'https://www.googleapis.com/auth/androidpublisher',
    aud: GOOGLE_TOKEN_URL,
    iat: getNumericDate(0),
    exp: getNumericDate(3600),
  }, key);

  const response = await fetch(GOOGLE_TOKEN_URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
      assertion,
    }),
  });
  const data = await response.json();
  if (!response.ok) throw new Error(`Google nie wydał tokenu: ${JSON.stringify(data)}`);
  return data.access_token as string;
}

Deno.serve(async (req) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'method not allowed' }), { status: 405 });
  }

  const token = (req.headers.get('Authorization') ?? '').replace('Bearer ', '').trim();
  if (!token) return json({ error: 'missing token' }, 401);

  const url = Deno.env.get('SUPABASE_URL')!;
  const asUser = createClient(url, Deno.env.get('SUPABASE_ANON_KEY')!, {
    global: { headers: { Authorization: `Bearer ${token}` } },
  });
  const { data: userData, error: userError } = await asUser.auth.getUser();
  if (userError || !userData.user) return json({ error: 'invalid token' }, 401);
  const userId = userData.user.id;

  const { productId, purchaseToken } = await req.json().catch(() => ({}));
  if (typeof productId !== 'string' || typeof purchaseToken !== 'string') {
    return json({ error: 'missing productId or purchaseToken' }, 400);
  }

  const packageName = Deno.env.get('ANDROID_PACKAGE_NAME') ?? 'pl.biomatura.app';

  let active = false;
  let expiresAt: string | null = null;
  try {
    const accessToken = await googleAccessToken();
    const response = await fetch(
      `${PLAY_API}/applications/${packageName}/purchases/subscriptionsv2/tokens/${purchaseToken}`,
      { headers: { Authorization: `Bearer ${accessToken}` } },
    );
    const purchase = await response.json();
    if (!response.ok) return json({ error: 'Google odrzucił token zakupu.', details: purchase }, 400);

    const lineItem = (purchase.lineItems ?? [])[0];
    // Token musi dotyczyć tego produktu, o który prosi aplikacja.
    if (lineItem?.productId && lineItem.productId !== productId) {
      return json({ error: 'Token dotyczy innego produktu.' }, 400);
    }
    active = ACTIVE_STATES.includes(purchase.subscriptionState);
    expiresAt = lineItem?.expiryTime ?? null;
  } catch (error) {
    return json({ error: String(error) }, 500);
  }

  // Zapis kluczem serwerowym — aplikacja tej tabeli nie może zmieniać.
  const admin = createClient(url, Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!);
  const { error } = await admin.from('subscriptions').upsert({
    user_id: userId,
    product_id: productId,
    purchase_token: purchaseToken,
    status: active ? 'active' : 'inactive',
    expires_at: expiresAt,
    updated_at: new Date().toISOString(),
  });
  if (error) return json({ error: error.message }, 500);

  return json({ active, expiresAt });
});

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}
