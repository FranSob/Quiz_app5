import '../task_models.dart';

/// Ile ocen dziennie przysługuje uczniowi z Premium. Limit pilnuje serwer —
/// tutaj trzymamy go po to, żeby pokazać liczbę w aplikacji.
const int aiGradingDailyLimit = 20;

/// Ocena jednego kryterium z klucza.
class AiCriterionResult {
  final int index;
  final bool awarded;
  final String comment;

  const AiCriterionResult({required this.index, required this.awarded, required this.comment});
}

/// Wynik sprawdzenia odpowiedzi przez AI.
class AiGrade {
  final List<AiCriterionResult> criteria;
  final String feedback;

  const AiGrade({required this.criteria, required this.feedback});

  Set<int> get awardedIndexes => {
        for (final criterion in criteria)
          if (criterion.awarded) criterion.index,
      };

  int points(OpenQuestion question) => awardedIndexes.fold(
        0,
        (sum, index) => sum + question.criteria[index].points,
      );
}

/// Powody, dla których ocena mogła się nie udać — każdy ma własny komunikat.
enum AiGradingError { notPremium, limitReached, notConfigured, emptyAnswer, network }

String aiGradingErrorMessage(AiGradingError error) {
  switch (error) {
    case AiGradingError.notPremium:
      return 'Ocenianie przez AI jest częścią Premium. Odpowiedź możesz też ocenić sam według klucza.';
    case AiGradingError.limitReached:
      return 'Dzienny limit $aiGradingDailyLimit ocen został wykorzystany. Wróć jutro albo oceń odpowiedź według klucza.';
    case AiGradingError.notConfigured:
      return 'Ocenianie przez AI jest chwilowo niedostępne.';
    case AiGradingError.emptyAnswer:
      return 'Najpierw napisz odpowiedź.';
    case AiGradingError.network:
      return 'Nie udało się połączyć z serwerem. Sprawdź internet i spróbuj ponownie.';
  }
}

/// Kody błędów z funkcji serwerowej na powody zrozumiałe w aplikacji.
AiGradingError aiErrorFromCode(String code) {
  switch (code) {
    case 'not_premium':
    case 'unauthorized':
      return AiGradingError.notPremium;
    case 'limit_reached':
      return AiGradingError.limitReached;
    case 'not_configured':
      return AiGradingError.notConfigured;
    case 'bad_request':
      return AiGradingError.emptyAnswer;
    default:
      return AiGradingError.network;
  }
}

/// Zamienia odpowiedź serwera na [AiGrade].
///
/// Model bywa nieprzewidywalny, więc czytamy defensywnie: pomijamy kryteria
/// spoza klucza, a brakujące traktujemy jako niezaliczone. Lepiej zaniżyć
/// ocenę niż pokazać uczniowi punkty, których na maturze by nie dostał.
AiGrade? parseAiGrade(Object? data, OpenQuestion question) {
  if (data is! Map) return null;
  final rawCriteria = data['criteria'];
  if (rawCriteria is! List) return null;

  final seen = <int>{};
  final results = <AiCriterionResult>[];
  for (final item in rawCriteria) {
    if (item is! Map) continue;
    final index = _asInt(item['index']);
    if (index == null || index < 0 || index >= question.criteria.length) continue;
    if (!seen.add(index)) continue;
    results.add(AiCriterionResult(
      index: index,
      awarded: item['awarded'] == true,
      comment: '${item['comment'] ?? ''}'.trim(),
    ));
  }
  for (var i = 0; i < question.criteria.length; i++) {
    if (seen.contains(i)) continue;
    results.add(AiCriterionResult(index: i, awarded: false, comment: ''));
  }
  results.sort((a, b) => a.index.compareTo(b.index));

  return AiGrade(criteria: results, feedback: '${data['feedback'] ?? ''}'.trim());
}

int? _asInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
