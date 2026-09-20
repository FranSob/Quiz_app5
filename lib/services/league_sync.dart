import 'dart:math';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../logic/league.dart';
import 'cloud_sync.dart';

/// Klasa (grupa) do rankingu XP. Działa wyłącznie dla zalogowanych uczniów —
/// ranking z natury wymaga wspólnego serwera, tak jak CloudSync.
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
  static Future<String> createGroup({String? name, required String nickname, required int xp}) async {
    if (CloudSync.currentUser == null) throw StateError('Trzeba być zalogowanym.');
    final random = Random.secure();
    for (var attempt = 0; attempt < 5; attempt++) {
      final code = generateGroupCode(random);
      try {
        await _client.from('groups').insert({'id': code, 'name': name});
        await _joinExisting(code, nickname: nickname, xp: xp);
        return code;
      } on PostgrestException catch (e) {
        // Kod już zajęty przez inną klasę — losujemy kolejny, chyba że to
        // ostatnia próba, wtedy przekazujemy błąd dalej.
        if (e.code == '23505' && attempt < 4) continue;
        rethrow;
      }
    }
    throw StateError('Nie udało się wylosować wolnego kodu klasy.');
  }

  /// Dołącza do istniejącej klasy po kodzie podanym przez kolegę lub nauczyciela.
  static Future<void> joinGroup(String code, {required String nickname, required int xp}) async {
    final normalized = normalizeGroupCode(code);
    final exists = await _client.from('groups').select('id').eq('id', normalized).maybeSingle();
    if (exists == null) throw StateError('Nie ma klasy o takim kodzie.');
    await _joinExisting(normalized, nickname: nickname, xp: xp);
  }

  static Future<void> _joinExisting(String groupId, {required String nickname, required int xp}) async {
    final user = CloudSync.currentUser!;
    // Jedna osoba należy naraz tylko do jednej klasy — najpierw opuszcza poprzednią.
    await _client.from('group_members').delete().eq('user_id', user.id);
    await _client.from('group_members').insert({
      'group_id': groupId,
      'user_id': user.id,
      'nickname': nickname,
      'xp': xp,
    });
  }

  static Future<void> leaveGroup() async {
    final user = CloudSync.currentUser;
    if (user == null) return;
    await _client.from('group_members').delete().eq('user_id', user.id);
  }

  /// Odświeża widoczne w rankingu imię i XP — wołane przy otwarciu ekranu ligi,
  /// żeby koledzy z klasy widzieli aktualny wynik bez osobnej synchronizacji.
  static Future<void> updateMyScore({required String nickname, required int xp}) async {
    final user = CloudSync.currentUser;
    if (user == null) return;
    await _client.from('group_members').update({
      'nickname': nickname,
      'xp': xp,
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    }).eq('user_id', user.id);
  }
}
