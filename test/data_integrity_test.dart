import 'package:flutter_test/flutter_test.dart';

import 'package:biomatura/data/biology_data.dart';

void main() {
  final chapters = [for (final c in biologyData) ...c.chapters];
  final topics = [for (final ch in chapters) ...ch.topics];

  test('there are four classes with levels 1-4', () {
    expect(biologyData.map((c) => c.level).toList(), [1, 2, 3, 4]);
    for (final c in biologyData) {
      expect(c.chapters, isNotEmpty, reason: 'class ${c.level} has no chapters');
    }
  });

  test('chapter, topic, flashcard and question ids are globally unique', () {
    void expectUnique(Iterable<String> ids, String kind) {
      final seen = <String>{};
      final duplicates = <String>{};
      for (final id in ids) {
        if (!seen.add(id)) duplicates.add(id);
      }
      expect(duplicates, isEmpty, reason: 'duplicate $kind ids: $duplicates');
    }

    expectUnique(chapters.map((c) => c.id), 'chapter');
    expectUnique(topics.map((t) => t.id), 'topic');
    expectUnique([for (final t in topics) ...t.flashcards.map((f) => f.id)], 'flashcard');
    expectUnique([for (final t in topics) ...t.questions.map((q) => q.id)], 'question');
  });

  test('every topic has theory, flashcards and questions', () {
    for (final t in topics) {
      expect(t.theory.trim(), isNotEmpty, reason: '${t.id} has no theory');
      expect(t.flashcards, isNotEmpty, reason: '${t.id} has no flashcards');
      expect(t.questions, isNotEmpty, reason: '${t.id} has no questions');
    }
  });

  test('every question has four distinct options and a valid answer', () {
    for (final t in topics) {
      for (final q in t.questions) {
        expect(q.options.length, 4, reason: '${q.id} does not have 4 options');
        expect(q.options.toSet().length, 4, reason: '${q.id} has repeated options');
        expect(q.correctIndex, inInclusiveRange(0, 3), reason: '${q.id} has invalid correctIndex');
        expect(q.question.trim(), isNotEmpty, reason: '${q.id} has an empty question');
        expect(q.explanation.trim(), isNotEmpty, reason: '${q.id} has no explanation');
      }
    }
  });

  test('flashcards have both sides filled in', () {
    for (final t in topics) {
      for (final f in t.flashcards) {
        expect(f.front.trim(), isNotEmpty, reason: '${f.id} has an empty front');
        expect(f.back.trim(), isNotEmpty, reason: '${f.id} has an empty back');
      }
    }
  });

  test('ids carry the prefix of their class', () {
    for (final c in biologyData) {
      for (final ch in c.chapters) {
        expect(ch.id, startsWith('k${c.level}_'), reason: 'chapter ${ch.id} in class ${c.level}');
        for (final t in ch.topics) {
          expect(t.id, startsWith('k${c.level}_'), reason: 'topic ${t.id} in class ${c.level}');
        }
      }
    }
  });

  test('genetics badge chapters exist in class 4', () {
    final k4Ids = classByLevel(4).chapters.map((c) => c.id).toSet();
    for (final id in ['k4_ekspresja', 'k4_dziedziczenie', 'k4_zmiennosc']) {
      expect(k4Ids, contains(id));
    }
    expect(classByLevel(1).chapters.map((c) => c.id), contains('k1_chemizm'));
  });
}
