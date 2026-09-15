import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:biomatura/data/biology_data.dart';
import 'package:biomatura/logic/school_test.dart';
import 'package:biomatura/screens/school_test_screen.dart';

void main() {
  test('grade thresholds', () {
    expect(gradeFor(30, 30).value, 6);
    expect(gradeFor(29, 30).value, 5); // 96,7%
    expect(gradeFor(27, 30).value, 5); // 90%
    expect(gradeFor(26, 30).value, 4); // 86,7%
    expect(gradeFor(15, 20).value, 4); // 75%
    expect(gradeFor(11, 20).value, 3); // 55%
    expect(gradeFor(4, 10).value, 2); // 40%
    expect(gradeFor(3, 10).value, 1);
    expect(gradeFor(0, 0).value, 1);
  });

  test('sampled test covers every topic without repeating questions', () {
    final chapter = allChapters.firstWhere((c) => c.id == 'k1_chemizm');
    final items = sampleTestQuestions(chapter.topics, 8, Random(1));
    expect(items, hasLength(8));
    expect(items.map((i) => i.question.id).toSet(), hasLength(8));
    expect(items.map((i) => i.topicId).toSet(), chapter.topics.map((t) => t.id).toSet());
    for (final item in items) {
      final topic = chapter.topics.firstWhere((t) => t.id == item.topicId);
      expect(topic.questions, contains(item.question));
    }
  });

  test('sampled test is limited to available questions', () {
    final topic = findTopicById('k1_chemizm_bialka')!;
    final items = sampleTestQuestions([topic], 100, Random(2));
    expect(items, hasLength(topic.questions.length));
  });

  test('labels for days until a test', () {
    expect(daysUntilLabel(0), 'dziś');
    expect(daysUntilLabel(1), 'jutro');
    expect(daysUntilLabel(3), 'za 3 dni');
    expect(daysUntilLabel(5), 'za 5 dni');
  });
}
