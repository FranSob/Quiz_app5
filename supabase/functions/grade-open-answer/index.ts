// Ocena odpowiedzi ucznia na zadanie otwarte — według tego samego klucza,
// który widzi uczeń.
//
// Dlaczego na serwerze: klucz do API Anthropic nie może znaleźć się
// w aplikacji, bo każdy mógłby go wyciągnąć z pliku i używać na nasz koszt.
// Tutaj sprawdzamy też, czy uczeń ma Premium i czy nie przekroczył limitu.
//
// Konfiguracja (jednorazowo):
//   supabase secrets set ANTHROPIC_API_KEY="sk-ant-..."
//   supabase functions deploy grade-open-answer

import { createClient } from 'jsr:@supabase/supabase-js@2';

const ANTHROPIC_URL = 'https://api.anthropic.com/v1/messages';
const MODEL = 'claude-haiku-4-5-20251001';
const DAILY_LIMIT = 20;

// Zabezpieczenie przed używaniem naszego klucza jako darmowego czatu.
const MAX_ANSWER_CHARS = 4000;
const MAX_CRITERIA = 10;

const SYSTEM_PROMPT = `Jesteś egzaminatorem maturalnym z biologii. Oceniasz odpowiedź ucznia
wyłącznie według podanego klucza punktowania — tak jak robi to egzaminator CKE.

Zasady:
- Punkt przyznajesz tylko wtedy, gdy odpowiedź zawiera dany element w pełni i bez błędu merytorycznego.
- Nie wymagaj dosłownego brzmienia klucza; liczy się sens. Synonimy i własne sformułowania są w porządku.
- Błąd merytoryczny w danym elemencie oznacza brak punktu za ten element, nawet jeśli reszta jest poprawna.
- Nie przyznawaj punktów za treści, których w odpowiedzi nie ma.
- Komentarze piszesz po polsku, krótko (jedno zdanie), zwracając się do ucznia per „Ty".
- Jeśli odpowiedź jest pusta albo nie na temat, nie przyznajesz punktów.

Odpowiadasz wyłącznie obiektem JSON, bez komentarza przed ani po:
{"criteria":[{"index":0,"awarded":true,"comment":"..."}],"feedback":"..."}
gdzie index to numer kryterium z klucza (liczony od zera), awarded to przyznanie punktu,
comment to uzasadnienie dla tego kryterium, a feedback to jedno–dwa zdania podsumowania
z konkretną wskazówką, co dopisać, żeby zdobyć brakujące punkty.`;

Deno.serve(async (req) => {
  if (req.method !== 'POST') return json({ error: 'method not allowed' }, 405);

  const token = (req.headers.get('Authorization') ?? '').replace('Bearer ', '').trim();
  if (!token) return json({ error: 'unauthorized' }, 401);

  const url = Deno.env.get('SUPABASE_URL')!;
  const asUser = createClient(url, Deno.env.get('SUPABASE_ANON_KEY')!, {
    global: { headers: { Authorization: `Bearer ${token}` } },
  });
  const { data: userData, error: userError } = await asUser.auth.getUser();
  if (userError || !userData.user) return json({ error: 'unauthorized' }, 401);
  const userId = userData.user.id;

  const apiKey = Deno.env.get('ANTHROPIC_API_KEY');
  if (!apiKey) return json({ error: 'not_configured' }, 503);

  const body = await req.json().catch(() => null);
  const prompt = typeof body?.prompt === 'string' ? body.prompt : '';
  const modelAnswer = typeof body?.modelAnswer === 'string' ? body.modelAnswer : '';
  const answer = typeof body?.answer === 'string' ? body.answer.slice(0, MAX_ANSWER_CHARS).trim() : '';
  const criteria = Array.isArray(body?.criteria) ? body.criteria.slice(0, MAX_CRITERIA) : [];
  if (!prompt || !answer || criteria.length === 0) return json({ error: 'bad_request' }, 400);

  const admin = createClient(url, Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!);

  // Premium sprawdzamy po stronie serwera — telefon mógłby skłamać.
  const { data: subscription } = await admin
    .from('subscriptions')
    .select('status, expires_at')
    .eq('user_id', userId)
    .maybeSingle();
  const expiresAt = subscription?.expires_at ? Date.parse(subscription.expires_at) : null;
  const premium = subscription?.status === 'active' && (expiresAt === null || expiresAt > Date.now());
  if (!premium) return json({ error: 'not_premium' }, 403);

  const { data: allowed, error: creditError } = await admin.rpc('consume_ai_credit', {
    p_user: userId,
    p_limit: DAILY_LIMIT,
  });
  if (creditError) return json({ error: 'server_error', details: creditError.message }, 500);
  if (allowed !== true) return json({ error: 'limit_reached' }, 429);

  const criteriaText = criteria
    .map((c: { text?: string; points?: number }, i: number) => `${i}. (${c?.points ?? 1} pkt) ${c?.text ?? ''}`)
    .join('\n');

  const userMessage = `ZADANIE:\n${prompt}\n\nKLUCZ PUNKTOWANIA:\n${criteriaText}\n\n` +
    `ODPOWIEDŹ WZORCOWA:\n${modelAnswer}\n\nODPOWIEDŹ UCZNIA:\n${answer}`;

  let response: Response;
  try {
    response = await fetch(ANTHROPIC_URL, {
      method: 'POST',
      headers: {
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
        'content-type': 'application/json',
      },
      body: JSON.stringify({
        model: MODEL,
        max_tokens: 700,
        temperature: 0,
        system: SYSTEM_PROMPT,
        messages: [{ role: 'user', content: userMessage }],
      }),
    });
  } catch (error) {
    return json({ error: 'upstream_error', details: String(error) }, 502);
  }

  if (!response.ok) {
    return json({ error: 'upstream_error', details: await response.text() }, 502);
  }

  const payload = await response.json();
  const text = (payload?.content ?? [])
    .filter((part: { type?: string }) => part?.type === 'text')
    .map((part: { text?: string }) => part.text ?? '')
    .join('')
    .trim();

  const parsed = extractJson(text);
  if (!parsed) return json({ error: 'bad_model_output', raw: text.slice(0, 500) }, 502);

  return json(parsed);
});

/// Model bywa rozmowny — wyciągamy pierwszy obiekt JSON z odpowiedzi.
function extractJson(text: string): unknown | null {
  const start = text.indexOf('{');
  const end = text.lastIndexOf('}');
  if (start === -1 || end <= start) return null;
  try {
    return JSON.parse(text.slice(start, end + 1));
  } catch {
    return null;
  }
}

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}
