import 'package:flutter_test/flutter_test.dart';

import 'package:biomatura/data/open_questions.dart';
import 'package:biomatura/logic/ai_grading.dart';
import 'package:biomatura/logic/premium.dart';

void main() {
  final question = openQuestionById('oq_k1_denaturacja')!;

  group('odczyt oceny z AI', () {
    test('reads awarded criteria and counts the points', () {
      final grade = parseAiGrade({
        'criteria': [
          {'index': 0, 'awarded': true, 'comment': 'Napisałeś o utracie struktury przestrzennej.'},
          {'index': 1, 'awarded': false, 'comment': 'Brakuje wzmianki o centrum aktywnym.'},
        ],
        'feedback': 'Dopisz, co dzieje się z centrum aktywnym.',
      }, question);

      expect(grade, isNotNull);
      expect(grade!.awardedIndexes, {0});
      expect(grade.points(question), 1);
      expect(grade.feedback, 'Dopisz, co dzieje się z centrum aktywnym.');
      expect(grade.criteria, hasLength(question.criteria.length));
    });

    test('missing criteria count as not awarded', () {
      final grade = parseAiGrade({
        'criteria': [
          {'index': 1, 'awarded': true, 'comment': 'Jest o centrum aktywnym.'},
        ],
      }, question)!;
      expect(grade.awardedIndexes, {1});
      expect(grade.criteria.map((c) => c.index), [0, 1]);
      expect(grade.points(question), 1);
    });

    test('criteria outside the key and duplicates are ignored', () {
      final grade = parseAiGrade({
        'criteria': [
          {'index': 0, 'awarded': true, 'comment': 'ok'},
          {'index': 0, 'awarded': false, 'comment': 'druga ocena tego samego'},
          {'index': 7, 'awarded': true, 'comment': 'kryterium, którego nie ma'},
          'nonsens',
        ],
      }, question)!;
      expect(grade.awardedIndexes, {0});
      expect(grade.points(question), 1);
    });

    test('an answer that is not an object is rejected', () {
      expect(parseAiGrade('coś poszło nie tak', question), isNull);
      expect(parseAiGrade({'feedback': 'brak kryteriów'}, question), isNull);
      expect(parseAiGrade(null, question), isNull);
    });
  });

  group('błędy oceniania', () {
    test('server codes map to messages the student understands', () {
      expect(aiErrorFromCode('not_premium'), AiGradingError.notPremium);
      expect(aiErrorFromCode('limit_reached'), AiGradingError.limitReached);
      expect(aiErrorFromCode('not_configured'), AiGradingError.notConfigured);
      expect(aiErrorFromCode('bad_request'), AiGradingError.emptyAnswer);
      expect(aiErrorFromCode('cokolwiek innego'), AiGradingError.network);
    });

    test('the daily limit is named in the message', () {
      expect(aiGradingErrorMessage(AiGradingError.limitReached), contains('$aiGradingDailyLimit'));
      expect(aiGradingErrorMessage(AiGradingError.notPremium), contains('Premium'));
    });
  });

  test('AI grading is a paid feature', () {
    expect(paidFeatures, contains(PremiumFeature.aiGrading));
    expect(isFeatureLocked(PremiumFeature.aiGrading, isPremium: false), isTrue);
    expect(isFeatureLocked(PremiumFeature.aiGrading, isPremium: true), isFalse);
    expect(premiumFeatureName(PremiumFeature.aiGrading), 'Ocenianie odpowiedzi przez AI');
  });
}
