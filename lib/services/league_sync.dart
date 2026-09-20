import 'dart:math';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../logic/league.dart';
import 'cloud_sync.dart';

/// Klasa (grupa) do rankingu XP. Działa wyłącznie dla zalogowanych uczniów —
/// ranking z natury wymaga wspólnego serwera, tak jak CloudSync.
///
/// Dołączanie i odświeżanie wyniku idzie przez funkcje w bazie, bo:
/// * kod klasy jest hasłem wstępu i nie wolno pozwolić odczytać listy kodów,
/// * XP do rankingu bierze się z zapisanego postępu, a nie z tego, co przyśle
///   telefon — inaczej wystarczyłaby podmiana jednej liczby, żeby wygrać ligę.
class LeagueSync {
  static SupabaseClient get _client => Supabase.instance.client;

  /// Klasa, do której należy zalogowany uczeń, albo null, gdy do żadnej nie dołączył.
  static Future<LeagueGroup?> myGroup() async {
    final user = CloudSync.currentUser;
    if (user == null) return null;
    final row = await _client
        .from('group_members')
        .select('group_id, groups(name)')
        .eq('user_id', user.id)
        .maybeSingle();
    if (row == null) return null;
    final groupData = row['groups'];
    final name = groupData is Map ? groupData['name'] as String? : null;
    return LeagueGroup(id: row['group_id'] as String, name: name);
  }

  static Future<List<LeagueMember>> fetchMembers(String groupId) async {
    final rows = await _client.from('group_members').select('user_id, nickname, xp').eq('group_id', groupId);
    return [
      for (final row in rows as List)
        LeagueMember(
          userId: row['user_id'] as String,
          nickname: row['nickname'] as String,
          xp: (row['xp'] as num).toInt(),
        ),
    ];
  }

  /// Zakłada nową klasę i od razu do niej dołącza. Zwraca wylosowany kod.
  static Future<String> createGroup({String? name, required String nickname}) async {
    final user = CloudSync.currentUser;
    if (user == null) throw StateError('Trzeba być zalogowanym.');
    final random = Random.secure();
    for (var attempt = 0; attempt < 5; attempt++) {
      final code = generateGroupCode(random);
      try {
        await _client.from('groups').insert({'id': code, 'name': name, 'created_by': user.id});
      } on PostgrestException catch (e) {
        // Kod już zajęty przez inną klasę — losujemy kolejny, chyba że to
        // ostatnia próba, wtedy przekazujemy błąd dalej.
        if (e.code == '23505' && attempt < 4) continue;
        throw StateError(_friendlyError(e));
      }
      await joinGroup(code, nickname: nickname);
      return code;
    }
    throw StateError('Nie udało się wylosować wolnego kodu klasy.');
  }

  /// Dołącza do istniejącej klasy po kodzie podanym przez kolegę lub nauczyciela.
  static Future<void> joinGroup(String code, {required String nickname}) async {
    if (CloudSync.currentUser == null) throw StateError('Trzeba być zalogowanym.');
    try {
      await _client.rpc<void>('join_group', params: {
        'p_code': normalizeGroupCode(code),
        'p_nickname': normalizeNickname(nickname),
      });
    } on PostgrestException catch (e) {
      throw StateError(_friendlyError(e));
    }
  }

  static Future<void> leaveGroup() async {
    final user = CloudSync.currentUser;
    if (user == null) return;
    await _client.from('group_members').delete().eq('user_id', user.id);
  }

  /// Odświeża widoczny w rankingu pseudonim i przelicza XP z zapisanego postępu.
  static Future<void> updateMyScore({required String nickname}) async {
    if (CloudSync.currentUser == null) return;
    await _client.rpc<void>('refresh_my_league_score', params: {'p_nickname': normalizeNickname(nickname)});
  }
}

/// Komunikaty z bazy są po polsku, ale pozostałe błędy tłumaczymy na ludzki język.
String _friendlyError(PostgrestException error) {
  final message = error.message;
  if (message.contains('Nie ma klasy')) return 'Nie ma klasy o takim kodzie.';
  if (message.contains('zalogowan')) return 'Trzeba być zalogowanym.';
  return 'Nie udało się połączyć z klasą. Sprawdź internet i spróbuj ponownie.';
}
