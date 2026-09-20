import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:biomatura/logic/league.dart';

void main() {
  test('group codes are 6 characters using only unambiguous letters and digits', () {
    final random = Random(1);
    for (var i = 0; i < 50; i++) {
      final code = generateGroupCode(random);
      expect(code, hasLength(6));
      expect(RegExp(r'^[A-Z0-9]+$').hasMatch(code), isTrue);
      expect(code.contains(RegExp('[01IOL]')), isFalse);
    }
  });

  test('normalizeGroupCode strips spaces and uppercases', () {
    expect(normalizeGroupCode(' ab 12 '), 'AB12');
  });

  test('isValidGroupCode rejects malformed codes', () {
    expect(isValidGroupCode('AB12CD'), isTrue);
    expect(isValidGroupCode('ab12cd'), isFalse);
    expect(isValidGroupCode('AB'), isFalse);
    expect(isValidGroupCode('AB 12'), isFalse);
  });

  test('normalizeNickname falls back to a default and trims very long names', () {
    expect(normalizeNickname('   '), 'Uczeń');
    expect(normalizeNickname('Kasia'), 'Kasia');
    expect(normalizeNickname('A' * 40), hasLength(24));
  });

  test('rankMembers sorts by XP descending and gives ties the same rank', () {
    const members = [
      LeagueMember(userId: 'a', nickname: 'Ala', xp: 100),
      LeagueMember(userId: 'b', nickname: 'Bartek', xp: 300),
      LeagueMember(userId: 'c', nickname: 'Celina', xp: 300),
      LeagueMember(userId: 'd', nickname: 'Darek', xp: 50),
    ];
    final ranked = rankMembers(members, myUserId: 'c');
    expect(ranked.map((e) => e.member.userId).toList(), ['b', 'c', 'a', 'd']);
    expect(ranked.map((e) => e.rank).toList(), [1, 1, 3, 4]);
    expect(ranked.firstWhere((e) => e.member.userId == 'c').isMe, isTrue);
    expect(ranked.firstWhere((e) => e.member.userId == 'a').isMe, isFalse);
  });

  test('rankMembers handles an empty group', () {
    expect(rankMembers(const [], myUserId: 'x'), isEmpty);
  });
}
