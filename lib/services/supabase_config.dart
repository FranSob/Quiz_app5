/// Dane dostępowe do Supabase podaje się przy budowaniu, a nie w kodzie:
///
///   flutter run --dart-define-from-file=supabase.json
///
/// gdzie supabase.json (plik spoza repozytorium) wygląda tak:
///   { "SUPABASE_URL": "https://xxx.supabase.co", "SUPABASE_KEY": "sb_publishable_..." }
///
/// Klucz „publishable” jest przeznaczony do umieszczania w aplikacji — dostępu
/// do danych pilnują reguły RLS po stronie bazy. Klucz „secret”/„service_role”
/// nie może się tu nigdy znaleźć.
const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const String supabaseKey = String.fromEnvironment('SUPABASE_KEY');

/// Bez kluczy aplikacja działa jak dotąd: wyłącznie lokalnie, bez kont.
bool get supabaseConfigured => supabaseUrl.isNotEmpty && supabaseKey.isNotEmpty;
