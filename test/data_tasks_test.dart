import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:biomatura/data/biology_data.dart';
import 'package:biomatura/data/data_tasks.dart';
import 'package:biomatura/task_models.dart';

void main() {
  test('task and question ids are unique and do not clash with topic questions', () {
    final taskIds = dataTasks.map((t) => t.id).toList();
    expect(taskIds.toSet(), hasLength(taskIds.length));
    final questionIds = dataTasks.expand((t) => t.questions).map((q) => q.id).toList();
    expect(questionIds.toSet(), hasLength(questionIds.length));
    final topicQuestionIds = allChapters.expand((c) => c.allQuestions).map((q) => q.id).toSet();
    expect(questionIds.where(topicQuestionIds.contains), isEmpty);
  });

  test('every task belongs to an existing topic of its class and has tasks in every class', () {
    for (final task in dataTasks) {
      expect(findTopicById(task.topicId), isNotNull, reason: task.id);
      expect(chapterOfTopic(task.topicId)!.id, startsWith('k${task.classLevel}_'), reason: task.id);
    }
    for (var level = 1; level <= 4; level++) {
      expect(dataTasks.where((t) => t.classLevel == level), isNotEmpty, reason: 'class $level');
    }
  });

  test('questions are well formed', () {
    for (final task in dataTasks) {
      expect(task.questions, isNotEmpty, reason: task.id);
      expect(task.intro.trim(), isNotEmpty);
      expect(task.caption.trim(), isNotEmpty);
      for (final q in task.questions) {
        expect(q.options.length, inInclusiveRange(2, 4), reason: q.id);
        expect(q.options.toSet(), hasLength(q.options.length), reason: q.id);
        expect(q.correctIndex, inInclusiveRange(0, q.options.length - 1), reason: q.id);
        expect(q.explanation.trim(), isNotEmpty, reason: q.id);
        if (q.options.length == 2) {
          expect(q.options, ['Prawda', 'Fałsz'], reason: q.id);
          expect(q.prompt, startsWith('Prawda czy fałsz'), reason: q.id);
        }
      }
    }
  });

  test('visual data fits the declared axes and structures are consistent', () {
    for (final task in dataTasks) {
      final v = task.visual;
      if (v is LineChartVisual) {
        expect(v.series, isNotEmpty);
        for (final s in v.series) {
          for (var i = 0; i < s.points.length; i++) {
            final p = s.points[i];
            expect(p.x, inInclusiveRange(v.minX, v.maxX), reason: '${task.id} ${s.name}');
            expect(p.y, inInclusiveRange(v.minY, v.maxY), reason: '${task.id} ${s.name}');
            if (i > 0) expect(p.x, greaterThan(s.points[i - 1].x), reason: '${task.id} x must increase');
          }
        }
      } else if (v is BarChartVisual) {
        for (final bar in v.bars) {
          expect(bar.value, inInclusiveRange(0, v.maxY), reason: task.id);
        }
        expect(v.bars.map((b) => b.label).toSet(), hasLength(v.bars.length));
      } else if (v is TableVisual) {
        for (final row in v.rows) {
          expect(row, hasLength(v.headers.length), reason: task.id);
        }
      } else if (v is PedigreeVisual) {
        final byId = {for (final p in v.people) p.id: p};
        expect(byId, hasLength(v.people.length));
        for (final p in v.people) {
          expect(p.slot, inInclusiveRange(0, v.slots - 1), reason: p.id);
          expect(p.id, startsWith('${['I', 'II', 'III', 'IV'][p.generation]}-'), reason: p.id);
        }
        for (final f in v.families) {
          final a = byId[f.parentA]!;
          final b = byId[f.parentB]!;
          expect(a.generation, b.generation);
          expect(a.male != b.male, isTrue, reason: 'parents must be a couple');
          for (final c in f.children) {
            expect(byId[c]!.generation, a.generation + 1, reason: c);
          }
        }
      } else if (v is GelVisual) {
        for (final lane in v.lanes) {
          expect(lane.bands, isNotEmpty);
          expect(lane.bands.every((b) => b > 0), isTrue);
        }
      } else {
        fail('Unknown visual type in ${task.id}');
      }
    }
  });

  test('answers that depend on calculations match the data', () {
    // Hardy–Weinberg: 90 recessive out of 1000.
    final q = sqrt(90 / 1000);
    expect(q, closeTo(0.3, 1e-9));
    expect(2 * (1 - q) * q * 1000, closeTo(420, 1e-6));

    // Energy transfer efficiency 2000 → 180.
    expect(180 / 2000 * 100, 9);

    // Paternity: every band of the child comes from the mother or man A, but not from man B.
    final gel = dataTaskById('dt_k4_elektroforeza')!.visual as GelVisual;
    final lanes = {for (final l in gel.lanes) l.label: l.bands.toSet()};
    final child = lanes['Dziecko']!;
    final fromMother = child.intersection(lanes['Matka']!);
    final paternal = child.difference(fromMother);
    expect(paternal, isNotEmpty);
    expect(lanes['Mężczyzna A']!.containsAll(paternal), isTrue);
    expect(lanes['Mężczyzna B']!.containsAll(paternal), isFalse);

    // Population growth: the largest increase is between days 6 and 8.
    final pop = dataTaskById('dt_k4_wzrost_populacji')!.visual as LineChartVisual;
    final points = pop.series.single.points;
    var bestIndex = 0;
    for (var i = 1; i < points.length; i++) {
      if (points[i].y - points[i - 1].y > points[bestIndex + 1].y - points[bestIndex].y) bestIndex = i - 1;
    }
    expect(points[bestIndex].x, 6);

    // Osmosis: the sign of the mass change flips between 0,2 and 0,3 mol/dm³.
    final osmosis = dataTaskById('dt_k1_osmoza')!.visual as TableVisual;
    final changes = osmosis.rows.map((r) => r[1]).toList();
    expect(changes[2].startsWith('+'), isTrue);
    expect(changes[3].startsWith('−'), isTrue);
  });
}
