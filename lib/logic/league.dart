import 'dart:math';

/// Znaki bez tych łatwych do pomylenia przy przepisywaniu kodu: bez 0/O i 1/I/L.
const String _codeAlphabet = 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';

/// Losuje kod klasy do podania kolegom (np. na tablicy albo w grupie na czacie).
String generateGroupCode(Random random) =>
    List.generate(6, (_) => _codeAlphabet[random.nextInt(_codeAlphabet.length)]).join();

/// Sprowadza kod wpisany przez ucznia do jednej postaci — bez spacji, wielkimi literami.
String normalizeGroupCode(String input) => input.trim().toUpperCase().replaceAll(RegExp(r'\s+'), '');

bool isValidGroupCode(String code) => RegExp(r'^[A-Z0-9]{4,10}$').hasMatch(code);

/// Nazwa widoczna w rankingu klasy — nigdy pusta ani bardzo długa.
String normalizeNickname(String input) {
  final trimmed = input.trim();
  if (trimmed.isEmpty) return 'Uczeń';
  return trimmed.length > 24 ? trimmed.substring(0, 24) : trimmed;
}

class LeagueGroup {
  final String id;
  final String? name;

  const LeagueGroup({required this.id, this.name});
}

class LeagueMember {
  final String userId;
  final String nickname;
  final int xp;

  const LeagueMember({required this.userId, required this.nickname, required this.xp});
}

class LeagueEntry {
  final LeagueMember member;
  final int rank;
  final bool isMe;

  const LeagueEntry({required this.member, required this.rank, required this.isMe});
}

/// Sortuje malejąco po XP. Remis dostaje ten sam numer miejsca (1, 1, 3 — a nie
/// 1, 1, 2), żeby remis nikomu sztucznie nie poprawiał ani nie psuł pozycji.
List<LeagueEntry> rankMembers(List<LeagueMember> members, {required String myUserId}) {
  final sorted = [...members]..sort((a, b) => b.xp.compareTo(a.xp));
  final result = <LeagueEntry>[];
  var rank = 0;
  var previousXp = -1;
  for (var i = 0; i < sorted.length; i++) {
    final member = sorted[i];
    if (member.xp != previousXp) {
      rank = i + 1;
      previousXp = member.xp;
    }
    result.add(LeagueEntry(member: member, rank: rank, isMe: member.userId == myUserId));
  }
  return result;
}
