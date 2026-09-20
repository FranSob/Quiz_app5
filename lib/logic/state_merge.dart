import 'dart:math';

/// Scalanie postępu z dwóch urządzeń.
///
/// Zasada: nic, co uczeń już zrobił, nie może zniknąć. Liczniki i najlepsze
/// wyniki biorę więc większe, zbiory sumuję, a ustawienia (imię, motyw, plan
/// na dziś) biorę z zapisu nowszego — tam ostatnia decyzja ucznia jest świeższa.
Map<String, dynamic> mergeStates(Map<String, dynamic> a, Map<String, dynamic> b) {
  final aTime = _int(a['updatedAt']);
  final bTime = _int(b['updatedAt']);
  final newer = aTime >= bTime ? a : b;
  final older = identical(newer, a) ? b : a;

  return {
    // Ustawienia i bieżący kontekst — z nowszego zapisu.
    'themeMode': newer['themeMode'] ?? older['themeMode'],
    'selectedClassLevel': newer['selectedClassLevel'] ?? older['selectedClassLevel'],
    'userName': newer['userName'] ?? older['userName'],
    'leagueNickname': newer['leagueNickname'] ?? older['leagueNickname'],
    'lastActiveTopicId': newer['lastActiveTopicId'] ?? older['lastActiveTopicId'],
    'examDate': newer['examDate'] ?? older['examDate'],
    'plan': newer['plan'] ?? older['plan'],
    'wrongQuestions': newer['wrongQuestions'] ?? older['wrongQuestions'] ?? const [],

    // Dorobek ucznia — nigdy w dół.
    'totalXp': _maxInt(a['totalXp'], b['totalXp']),
    'flashcardReviews': _maxInt(a['flashcardReviews'], b['flashcardReviews']),
    'testsCompleted': _maxInt(a['testsCompleted'], b['testsCompleted']),
    'totalQuestionsAnswered': _maxInt(a['totalQuestionsAnswered'], b['totalQuestionsAnswered']),
    'totalQuestionsCorrect': _maxInt(a['totalQuestionsCorrect'], b['totalQuestionsCorrect']),
    'anyPerfectTest': a['anyPerfectTest'] == true || b['anyPerfectTest'] == true,
    'isPremium': a['isPremium'] == true || b['isPremium'] == true,
    'topicAnswered': _maxByKey(a['topicAnswered'], b['topicAnswered']),
    'topicCorrect': _maxByKey(a['topicCorrect'], b['topicCorrect']),
    'chapterAnswered': _maxByKey(a['chapterAnswered'], b['chapterAnswered']),
    'chapterCorrect': _maxByKey(a['chapterCorrect'], b['chapterCorrect']),
    'dataTaskBest': _maxByKey(a['dataTaskBest'], b['dataTaskBest']),
    'openBest': _maxByKey(a['openBest'], b['openBest']),
    'readinessHistory': _maxByKey(a['readinessHistory'], b['readinessHistory']),
    'readTopics': _union(a['readTopics'], b['readTopics']),
    'unlockedBadges': _union(a['unlockedBadges'], b['unlockedBadges']),
    'srs': _mergeSrs(a['srs'], b['srs']),
    'dailyStats': _mergeDailyStats(a['dailyStats'], b['dailyStats']),
    'customFolders': _mergeById(a['customFolders'], b['customFolders'], newer['customFolders']),
    'plannedTests': _mergeById(a['plannedTests'], b['plannedTests'], newer['plannedTests']),
    'examHistory': _mergeExamHistory(a['examHistory'], b['examHistory']),
    'updatedAt': max(aTime, bTime),
  };
}

int _int(dynamic v) => v is int ? v : (v is num ? v.toInt() : 0);

int _maxInt(dynamic a, dynamic b) => max(_int(a), _int(b));

Map<String, dynamic> _map(dynamic v) => v is Map ? Map<String, dynamic>.from(v) : <String, dynamic>{};

List<dynamic> _list(dynamic v) => v is List ? List<dynamic>.from(v) : const [];

Map<String, int> _maxByKey(dynamic a, dynamic b) {
  final result = <String, int>{};
  for (final source in [_map(a), _map(b)]) {
    source.forEach((key, value) {
      final n = _int(value);
      if (!result.containsKey(key) || n > result[key]!) result[key] = n;
    });
  }
  return result;
}

List<String> _union(dynamic a, dynamic b) => {
      ..._list(a).map((e) => e.toString()),
      ..._list(b).map((e) => e.toString()),
    }.toList();

/// Dla każdej fiszki wygrywa zapis z większą liczbą powtórek, a przy remisie
/// ten z późniejszym terminem — czyli dalej posunięta powtórka.
Map<String, dynamic> _mergeSrs(dynamic a, dynamic b) {
  final result = <String, dynamic>{};
  for (final source in [_map(a), _map(b)]) {
    source.forEach((key, value) {
      final card = _map(value);
      final current = result[key];
      if (current == null) {
        result[key] = card;
        return;
      }
      final currentMap = _map(current);
      final reviews = _int(card['r']);
      final currentReviews = _int(currentMap['r']);
      if (reviews > currentReviews || (reviews == currentReviews && _int(card['d']) > _int(currentMap['d']))) {
        result[key] = card;
      }
    });
  }
  return result;
}

/// Statystyki dnia: dla każdego dnia biorę większą wartość każdego licznika,
/// a przeczytane tematy sumuję.
Map<String, dynamic> _mergeDailyStats(dynamic a, dynamic b) {
  final result = <String, dynamic>{};
  for (final source in [_map(a), _map(b)]) {
    source.forEach((day, value) {
      final stat = _map(value);
      final current = _map(result[day]);
      result[day] = {
        'a': _maxInt(stat['a'], current['a']),
        'c': _maxInt(stat['c'], current['c']),
        'f': _maxInt(stat['f'], current['f']),
        't': _maxInt(stat['t'], current['t']),
        'd': _maxInt(stat['d'], current['d']),
        'o': _maxInt(stat['o'], current['o']),
        'r': _union(stat['r'], current['r']),
      };
    });
  }
  return result;
}

/// Listy obiektów z własnym „id": suma obu, a przy tym samym id wygrywa wersja
/// z nowszego zapisu (np. zmieniona nazwa zestawu fiszek).
List<dynamic> _mergeById(dynamic a, dynamic b, dynamic preferred) {
  final preferredById = {
    for (final item in _list(preferred))
      if (_map(item)['id'] != null) _map(item)['id'].toString(): item,
  };
  final result = <String, dynamic>{};
  for (final source in [_list(a), _list(b)]) {
    for (final item in source) {
      final id = _map(item)['id']?.toString();
      if (id == null) continue;
      result[id] = preferredById[id] ?? result[id] ?? item;
    }
  }
  return result.values.toList();
}

/// Próbne matury nie mają id — ten sam wynik z tego samego dnia to ten sam arkusz.
List<dynamic> _mergeExamHistory(dynamic a, dynamic b) {
  final result = <String, dynamic>{};
  for (final source in [_list(a), _list(b)]) {
    for (final item in source) {
      final e = _map(item);
      final key = '${e['date']}|${e['variant']}|${e['points']}|${e['max']}|${e['seconds']}';
      result.putIfAbsent(key, () => item);
    }
  }
  final merged = result.values.toList()
    ..sort((x, y) => (_map(x)['date'] ?? '').toString().compareTo((_map(y)['date'] ?? '').toString()));
  return merged;
}
