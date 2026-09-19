import 'package:supabase_flutter/supabase_flutter.dart';

import '../state/app_state.dart';
import 'supabase_config.dart';

/// Konto ucznia i kopia postępu w chmurze (Supabase).
///
/// Bez kluczy w [supabaseConfigured] cała klasa jest nieaktywna, a aplikacja
/// działa wyłącznie lokalnie — tak samo jak przed dodaniem kont.
class CloudSync {
  static bool _initialized = false;

  static Future<void> init() async {
    if (!supabaseConfigured || _initialized) return;
    await Supabase.initialize(url: supabaseUrl, publishableKey: supabaseKey);
    _initialized = true;
  }

  static bool get available => supabaseConfigured && _initialized;

  static SupabaseClient get _client => Supabase.instance.client;

  static User? get currentUser => available ? _client.auth.currentUser : null;

  static bool get signedIn => currentUser != null;

  static String? get email => currentUser?.email;

  static Stream<AuthState> get authChanges =>
      available ? _client.auth.onAuthStateChange : const Stream<AuthState>.empty();

  static Future<void> signIn({required String email, required String password}) =>
      _client.auth.signInWithPassword(email: email.trim(), password: password);

  static Future<void> signUp({required String email, required String password}) =>
      _client.auth.signUp(email: email.trim(), password: password);

  static Future<void> signOut() => _client.auth.signOut();

  static Future<void> sendPasswordReset(String email) => _client.auth.resetPasswordForEmail(email.trim());

  /// Postęp zapisany w chmurze albo null, gdy uczeń jeszcze nic nie wysłał.
  static Future<Map<String, dynamic>?> fetchProgress() async {
    final user = currentUser;
    if (user == null) return null;
    final row = await _client.from('progress').select('data').eq('user_id', user.id).maybeSingle();
    final data = row?['data'];
    return data is Map ? Map<String, dynamic>.from(data) : null;
  }

  static Future<void> pushProgress(Map<String, dynamic> state) async {
    final user = currentUser;
    if (user == null) return;
    await _client.from('progress').upsert({
      'user_id': user.id,
      'data': state,
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    });
  }
}

/// Synchronizacja postępu zalogowanego ucznia.
Future<SyncOutcome> syncNow(AppState state) {
  if (!CloudSync.signedIn) return Future.value(SyncOutcome.failed);
  return state.syncWith(fetch: CloudSync.fetchProgress, push: CloudSync.pushProgress);
}

/// Komunikat po synchronizacji.
String syncMessage(SyncOutcome outcome) {
  switch (outcome) {
    case SyncOutcome.uploaded:
      return 'Postęp zapisany w chmurze.';
    case SyncOutcome.downloaded:
      return 'Pobrano postęp z chmury.';
    case SyncOutcome.merged:
      return 'Połączono postęp z tego urządzenia i z chmury.';
    case SyncOutcome.upToDate:
      return 'Wszystko jest już zsynchronizowane.';
    case SyncOutcome.failed:
      return 'Nie udało się zsynchronizować. Sprawdź internet.';
  }
}

/// Tłumaczenie komunikatów Supabase na polski — uczeń nie ma widzieć
/// angielskich komunikatów technicznych.
String authErrorMessage(Object error) {
  if (error is AuthException) {
    final message = error.message.toLowerCase();
    if (message.contains('invalid login credentials')) return 'Błędny e-mail lub hasło.';
    if (message.contains('email not confirmed')) return 'Najpierw potwierdź e-mail, klikając link, który wysłaliśmy.';
    if (message.contains('user already registered')) return 'Konto z tym e-mailem już istnieje — zaloguj się.';
    if (message.contains('password should be at least')) return 'Hasło musi mieć co najmniej 6 znaków.';
    if (message.contains('unable to validate email') || message.contains('invalid email')) {
      return 'Nieprawidłowy adres e-mail.';
    }
    if (message.contains('rate limit') || message.contains('too many')) {
      return 'Za dużo prób. Spróbuj ponownie za chwilę.';
    }
    return error.message;
  }
  return 'Brak połączenia z serwerem. Sprawdź internet i spróbuj ponownie.';
}
