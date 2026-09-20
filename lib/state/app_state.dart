import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/biology_data.dart';
import '../data/data_tasks.dart';
import '../data/open_questions.dart';
import '../logic/readiness.dart';
import '../logic/state_merge.dart';
import '../logic/study_plan.dart';
import '../models.dart';
import '../utils/dates.dart';

/// Co zrobiła ostatnia synchronizacja — komunikat dla ucznia.
enum SyncOutcome { uploaded, downloaded, merged, upToDate, failed }

class DailyStat {
  int answered;
  int correct;
  int cards;
  int tests;
  int dataTasks;
  int openAnswers;
  final Set<String> topicsRead;

  DailyStat({
    this.answered = 0,
    this.correct = 0,
    this.cards = 0,
    this.tests = 0,
    this.dataTasks = 0,
    this.openAnswers = 0,
    Set<String>? topicsRead,
  }) : topicsRead = topicsRead ?? {};

  Map<String, dynamic> toJson() => {
    'a': answered,
    'c': correct,
    'f': cards,
    't': tests,
    'd': dataTasks,
    'o': openAnswers,
    'r': topicsRead.toList(),
  };

  factory DailyStat.fromJson(Map<String, dynamic> j) => DailyStat(
    answered: j['a'] ?? 0,
    correct: j['c'] ?? 0,
    cards: j['f'] ?? 0,
    tests: j['t'] ?? 0,
    dataTasks: j['d'] ?? 0,
    openAnswers: j['o'] ?? 0,
    topicsRead: Set<String>.from(j['r'] ?? const []),
  );
}

class _Srs {
  int box;
  int dueMillis;
  int reviews;
  int lapses;

  _Srs({required this.box, required this.dueMillis, this.reviews = 0, this.lapses = 0});

  Map<String, dynamic> toJson() => {'b': box, 'd': dueMillis, 'r': reviews, 'l': lapses};
  factory _Srs.fromJson(Map<String, dynamic> j) =>
      _Srs(box: j['b'] ?? 0, dueMillis: j['d'] ?? 0, reviews: j['r'] ?? 0, lapses: j['l'] ?? 0);
}

// Leitner-style spaced repetition intervals, in days.
const List<int> _srsIntervalsDays = [0, 1, 3, 7, 14, 30];

/// Temat uznajemy za lukę, gdy w testach padło co najmniej [gapMinAnswered]
/// odpowiedzi, a skuteczność jest niższa niż [gapAccuracyThreshold]%…
const int gapMinAnswered = 3;
const double gapAccuracyThreshold = 70;

/// …albo gdy co najmniej [gapMinLapsedCards] fiszek z tematu ostatnio oznaczono „Nie umiem".
const int gapMinLapsedCards = 3;

/// Temat jest przerobiony w planie nauki, gdy teoria została przeczytana,
/// a test z tematu zaliczony na co najmniej tyle procent.
const double topicDoneAccuracy = 70;

class TopicGap {
  final Topic topic;
  final Chapter chapter;
  final int answered;
  final int correct;
  final int lapsedCards;
  final int wrongQuestions;
  final double score;

  const TopicGap({
    required this.topic,
    required this.chapter,
    required this.answered,
    required this.correct,
    required this.lapsedCards,
    required this.wrongQuestions,
    required this.score,
  });

  double get accuracy => answered > 0 ? correct / answered * 100 : 0;

  bool get weakInTests => answered >= gapMinAnswered && accuracy < gapAccuracyThreshold;

  bool get weakInFlashcards => lapsedCards >= gapMinLapsedCards;
}

class AppState extends ChangeNotifier {
  static const _prefsKey = 'biomatura_state_v1';
  SharedPreferences? _prefs;
  bool _loaded = false;
  bool get loaded => _loaded;

  /// Źródło bieżącej daty — w testach można podmienić.
  DateTime Function() clock = DateTime.now;
  final Random _random = Random();

  ThemeMode themeMode = ThemeMode.dark;
  int selectedClassLevel = 4;
  String userName = 'Uczeń';
  int totalXp = 0;
  bool isPremium = false;
  String? lastActiveTopicId;

  /// Pseudonim widoczny w rankingu klasy. Celowo osobny od imienia w profilu —
  /// imię zostaje na telefonie, a do klasy trafia tylko to, co uczeń sam poda.
  String? leagueNickname;

  final Map<String, int> _topicAnswered = {};
  final Map<String, int> _topicCorrect = {};
  final Map<String, int> _chapterAnswered = {};
  final Map<String, int> _chapterCorrect = {};
  final Map<String, _Srs> _srs = {};
  int flashcardReviews = 0;
  final Set<String> readTopics = {};
  int testsCompleted = 0;
  int totalQuestionsAnswered = 0;
  int totalQuestionsCorrect = 0;
  bool anyPerfectTest = false;
  final Map<String, DailyStat> dailyStats = {};
  final Set<String> unlockedBadges = {};
  final List<String> newlyUnlockedQueue = [];
  final List<FlashcardFolder> customFolders = [];

  /// Pytania, na które ostatnia odpowiedź była błędna.
  final Set<String> wrongQuestionIds = {};

  /// Data matury w formacie „rrrr-mm-dd".
  String? examDateKey;

  /// Najlepszy wynik (liczba poprawnych odpowiedzi) w zadaniach z danymi.
  final Map<String, int> dataTaskBest = {};

  /// Najlepszy wynik (punkty) w zadaniach otwartych.
  final Map<String, int> openBest = {};
  final List<PlannedTest> plannedTests = [];
  final List<ExamRecord> examHistory = [];

  /// Wskaźnik gotowości zapisany na koniec każdego dnia nauki (klucz: data).
  final Map<String, int> readinessHistory = {};

  // Plan na dziś jest ustalany raz dziennie, żeby lista zadań nie zmieniała
  // się w trakcie dnia, gdy uczeń odhacza kolejne punkty.
  String? _planDayKey;
  String? _planExamKey;
  List<String> _planTopicIds = [];
  int _planCardsTarget = 0;
  String? _planTestTopicId;
  bool _planTestFromGaps = false;
  String? _planDataTaskId;
  String? _planOpenQuestionId;

  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    final raw = _prefs!.getString(_prefsKey);
    if (raw != null) {
      try {
        _applyJson(jsonDecode(raw) as Map<String, dynamic>);
      } catch (_) {
        // Corrupt data — start fresh.
      }
    }
    _ensureAllFlashcardsTracked();
    _loaded = true;
    notifyListeners();
  }

  /// Czyści cały postęp w pamięci — przed wczytaniem innego zapisu.
  void _clearAll() {
    _topicAnswered.clear();
    _topicCorrect.clear();
    _chapterAnswered.clear();
    _chapterCorrect.clear();
    _srs.clear();
    readTopics.clear();
    dailyStats.clear();
    unlockedBadges.clear();
    customFolders.clear();
    wrongQuestionIds.clear();
    dataTaskBest.clear();
    openBest.clear();
    plannedTests.clear();
    examHistory.clear();
    readinessHistory.clear();
  }

  void _applyJson(Map<String, dynamic> j) {
    _clearAll();
    themeMode = (j['themeMode'] == 'light') ? ThemeMode.light : ThemeMode.dark;
    selectedClassLevel = j['selectedClassLevel'] ?? 4;
    userName = j['userName'] ?? 'Uczeń';
    totalXp = j['totalXp'] ?? 0;
    isPremium = j['isPremium'] ?? false;
    lastActiveTopicId = j['lastActiveTopicId'];
    leagueNickname = j['leagueNickname'];
    flashcardReviews = j['flashcardReviews'] ?? 0;
    testsCompleted = j['testsCompleted'] ?? 0;
    totalQuestionsAnswered = j['totalQuestionsAnswered'] ?? 0;
    totalQuestionsCorrect = j['totalQuestionsCorrect'] ?? 0;
    anyPerfectTest = j['anyPerfectTest'] ?? false;
    _topicAnswered.addAll(Map<String, int>.from(j['topicAnswered'] ?? {}));
    _topicCorrect.addAll(Map<String, int>.from(j['topicCorrect'] ?? {}));
    _chapterAnswered.addAll(Map<String, int>.from(j['chapterAnswered'] ?? {}));
    _chapterCorrect.addAll(Map<String, int>.from(j['chapterCorrect'] ?? {}));
    readTopics.addAll(List<String>.from(j['readTopics'] ?? []));
    unlockedBadges.addAll(List<String>.from(j['unlockedBadges'] ?? []));
    final srsJson = Map<String, dynamic>.from(j['srs'] ?? {});
    srsJson.forEach((k, v) {
      _srs[k] = _Srs.fromJson(Map<String, dynamic>.from(v));
    });
    final dailyJson = Map<String, dynamic>.from(j['dailyStats'] ?? {});
    dailyJson.forEach((k, v) {
      dailyStats[k] = DailyStat.fromJson(Map<String, dynamic>.from(v));
    });
    final foldersJson = List<dynamic>.from(j['customFolders'] ?? []);
    customFolders.addAll(foldersJson.map((f) => FlashcardFolder.fromJson(Map<String, dynamic>.from(f))));
    wrongQuestionIds.addAll(List<String>.from(j['wrongQuestions'] ?? []));
    examDateKey = parseDateKey(j['examDate']) != null ? j['examDate'] : null;
    dataTaskBest.addAll(Map<String, int>.from(j['dataTaskBest'] ?? {}));
    openBest.addAll(Map<String, int>.from(j['openBest'] ?? {}));
    plannedTests.addAll(
      List<dynamic>.from(
        j['plannedTests'] ?? [],
      ).map((t) => PlannedTest.fromJson(Map<String, dynamic>.from(t))).where((t) => parseDateKey(t.dateKey) != null),
    );
    examHistory.addAll(
      List<dynamic>.from(
        j['examHistory'] ?? [],
      ).map((e) => ExamRecord.fromJson(Map<String, dynamic>.from(e))).where((e) => parseDateKey(e.dateKey) != null),
    );
    readinessHistory.addAll(Map<String, int>.from(j['readinessHistory'] ?? {}));
    final plan = Map<String, dynamic>.from(j['plan'] ?? {});
    _planDayKey = plan['day'];
    _planExamKey = plan['exam'];
    _planTopicIds = List<String>.from(plan['topics'] ?? []);
    _planCardsTarget = plan['cards'] ?? 0;
    _planTestTopicId = plan['test'];
    _planTestFromGaps = plan['testGaps'] ?? false;
    _planDataTaskId = plan['dataTask'];
    _planOpenQuestionId = plan['open'];
    _stateUpdatedAt = j['updatedAt'] is int ? j['updatedAt'] : 0;
  }

  /// Synchronizacja z chmurą: pobiera zdalny zapis, scala go z lokalnym
  /// (nic nie ginie — patrz [mergeStates]) i odsyła wynik, jeśli się zmienił.
  Future<SyncOutcome> syncWith({
    required Future<Map<String, dynamic>?> Function() fetch,
    required Future<void> Function(Map<String, dynamic> state) push,
  }) async {
    final local = exportState();
    Map<String, dynamic>? remote;
    try {
      remote = await fetch();
    } catch (_) {
      return SyncOutcome.failed;
    }
    try {
      if (remote == null) {
        await push(local);
        return SyncOutcome.uploaded;
      }
      final merged = mergeStates(local, remote);
      final mergedJson = _canonical(merged);
      final localChanged = mergedJson != _canonical(local);
      final remoteChanged = mergedJson != _canonical(remote);
      if (localChanged) await applyState(merged);
      if (remoteChanged) await push(merged);
      if (localChanged && remoteChanged) return SyncOutcome.merged;
      if (localChanged) return SyncOutcome.downloaded;
      if (remoteChanged) return SyncOutcome.uploaded;
      return SyncOutcome.upToDate;
    } catch (_) {
      return SyncOutcome.failed;
    }
  }

  /// Porównanie zapisów niezależne od kolejności kluczy.
  static String _canonical(Object? value) {
    if (value is Map) {
      final keys = value.keys.map((k) => k.toString()).toList()..sort();
      return '{${keys.map((k) => '$k:${_canonical(value[k])}').join(',')}}';
    }
    if (value is List) return '[${value.map(_canonical).join(',')}]';
    return '$value';
  }

  /// Podmienia cały stan na scalony zapis z chmury.
  Future<void> applyState(Map<String, dynamic> json) async {
    _applyJson(json);
    _ensureAllFlashcardsTracked();
    await _save(touch: false);
    notifyListeners();
  }

  // Nowe fiszki są od razu do powtórki, niezależnie od godziny wczytania stanu.
  void _ensureAllFlashcardsTracked() {
    for (final c in biologyData) {
      for (final ch in c.chapters) {
        for (final t in ch.topics) {
          for (final f in t.flashcards) {
            _srs.putIfAbsent(f.id, () => _Srs(box: 0, dueMillis: 0));
          }
        }
      }
    }
  }

  /// Kiedy ostatnio zmienił się postęp — po tym poznaję, który zapis
  /// (ten w telefonie czy ten w chmurze) jest świeższy.
  int _stateUpdatedAt = 0;

  int get stateUpdatedAt => _stateUpdatedAt;

  Future<void> _save({bool touch = true}) async {
    if (touch) _stateUpdatedAt = clock().millisecondsSinceEpoch;
    if (_prefs == null) return;
    await _prefs!.setString(_prefsKey, jsonEncode(exportState()));
  }

  /// Cały postęp jako JSON — do zapisu lokalnego i do wysyłki do chmury.
  Map<String, dynamic> exportState() {
    return <String, dynamic>{
      'themeMode': themeMode == ThemeMode.light ? 'light' : 'dark',
      'selectedClassLevel': selectedClassLevel,
      'userName': userName,
      'totalXp': totalXp,
      'isPremium': isPremium,
      'lastActiveTopicId': lastActiveTopicId,
      'leagueNickname': leagueNickname,
      'flashcardReviews': flashcardReviews,
      'testsCompleted': testsCompleted,
      'totalQuestionsAnswered': totalQuestionsAnswered,
      'totalQuestionsCorrect': totalQuestionsCorrect,
      'anyPerfectTest': anyPerfectTest,
      'topicAnswered': _topicAnswered,
      'topicCorrect': _topicCorrect,
      'chapterAnswered': _chapterAnswered,
      'chapterCorrect': _chapterCorrect,
      'readTopics': readTopics.toList(),
      'unlockedBadges': unlockedBadges.toList(),
      'srs': _srs.map((k, v) => MapEntry(k, v.toJson())),
      'dailyStats': dailyStats.map((k, v) => MapEntry(k, v.toJson())),
      'customFolders': customFolders.map((f) => f.toJson()).toList(),
      'wrongQuestions': wrongQuestionIds.toList(),
      'examDate': examDateKey,
      'dataTaskBest': dataTaskBest,
      'openBest': openBest,
      'plannedTests': plannedTests.map((t) => t.toJson()).toList(),
      'examHistory': examHistory.map((e) => e.toJson()).toList(),
      'readinessHistory': readinessHistory,
      'plan': {
        'day': _planDayKey,
        'exam': _planExamKey,
        'topics': _planTopicIds,
        'cards': _planCardsTarget,
        'test': _planTestTopicId,
        'testGaps': _planTestFromGaps,
        'dataTask': _planDataTaskId,
        'open': _planOpenQuestionId,
      },
      'updatedAt': _stateUpdatedAt,
    };
  }

  // ---- Derived values ----

  int get level => (totalXp ~/ 100) + 1;
  int get xpIntoLevel => totalXp % 100;
  int get xpForNextLevel => 100;

  double get overallAccuracy => totalQuestionsAnswered > 0 ? (totalQuestionsCorrect / totalQuestionsAnswered) * 100 : 0;

  double chapterAccuracy(String chapterId) {
    final a = _chapterAnswered[chapterId] ?? 0;
    final c = _chapterCorrect[chapterId] ?? 0;
    return a > 0 ? (c / a) * 100 : 0;
  }

  int chapterAnsweredCount(String chapterId) => _chapterAnswered[chapterId] ?? 0;

  double topicAccuracy(String topicId) {
    final a = _topicAnswered[topicId] ?? 0;
    final c = _topicCorrect[topicId] ?? 0;
    return a > 0 ? (c / a) * 100 : 0;
  }

  int topicAnsweredCount(String topicId) => _topicAnswered[topicId] ?? 0;

  double chapterProgressPercent(Chapter chapter) {
    if (chapter.topics.isEmpty) return 0;
    final sum = chapter.topics.fold<double>(0, (s, t) => s + topicAccuracy(t.id));
    return sum / chapter.topics.length;
  }

  double get masteredMaterialPercent {
    final topics = biologyData.expand((c) => c.chapters).expand((ch) => ch.topics).toList();
    if (topics.isEmpty) return 0;
    final mastered = topics.where((t) => topicAccuracy(t.id) >= 80 && topicAnsweredCount(t.id) > 0).length;
    return (mastered / topics.length) * 100;
  }

  ReadinessReport get readinessReport =>
      buildReadinessReport(classes: biologyData, answered: topicAnsweredCount, accuracy: topicAccuracy);

  void _recordReadinessSnapshot() {
    readinessHistory[dateKey(clock())] = readinessReport.overall.round();
  }

  bool _isDue(String cardId, int now) {
    final srs = _srs[cardId];
    return srs == null || srs.dueMillis <= now;
  }

  List<Flashcard> dueFlashcards({int? classLevel}) {
    final now = clock().millisecondsSinceEpoch;
    final scope = classLevel != null ? classByLevel(classLevel).chapters : allChapters;
    final cards = scope.expand((ch) => ch.allFlashcards).toList();
    return cards.where((f) => _isDue(f.id, now)).toList();
  }

  int dueFlashcardsCount({int? classLevel}) => dueFlashcards(classLevel: classLevel).length;

  List<Flashcard> dueCardsFrom(List<Flashcard> cards) {
    final now = clock().millisecondsSinceEpoch;
    return cards.where((f) => _isDue(f.id, now)).toList();
  }

  int dueCountFrom(List<Flashcard> cards) => dueCardsFrom(cards).length;

  DailyStat get todayStat => dailyStats[dateKey(clock())] ?? DailyStat();

  DailyStat _todayStatForWrite() => dailyStats.putIfAbsent(dateKey(clock()), () => DailyStat());

  // ---- Custom flashcard folders ----

  FlashcardFolder? folderById(String folderId) {
    for (final f in customFolders) {
      if (f.id == folderId) return f;
    }
    return null;
  }

  void createFolder(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return;
    customFolders.add(FlashcardFolder(id: 'folder_${DateTime.now().microsecondsSinceEpoch}', name: trimmed));
    _save();
    notifyListeners();
  }

  void renameFolder(String folderId, String newName) {
    final trimmed = newName.trim();
    if (trimmed.isEmpty) return;
    folderById(folderId)?.name = trimmed;
    _save();
    notifyListeners();
  }

  void deleteFolder(String folderId) {
    final folder = folderById(folderId);
    if (folder != null) {
      for (final c in folder.cards) {
        _srs.remove(c.id);
      }
    }
    customFolders.removeWhere((f) => f.id == folderId);
    _save();
    notifyListeners();
  }

  void addCardToFolder(String folderId, String front, String back) {
    final folder = folderById(folderId);
    if (folder == null) return;
    final trimmedFront = front.trim();
    final trimmedBack = back.trim();
    if (trimmedFront.isEmpty || trimmedBack.isEmpty) return;
    folder.cards.add(
      Flashcard(id: 'card_${DateTime.now().microsecondsSinceEpoch}', front: trimmedFront, back: trimmedBack),
    );
    _save();
    notifyListeners();
  }

  void updateCardInFolder(String folderId, String cardId, String front, String back) {
    final folder = folderById(folderId);
    if (folder == null) return;
    final idx = folder.cards.indexWhere((c) => c.id == cardId);
    if (idx == -1) return;
    final trimmedFront = front.trim();
    final trimmedBack = back.trim();
    if (trimmedFront.isEmpty || trimmedBack.isEmpty) return;
    folder.cards[idx] = Flashcard(id: cardId, front: trimmedFront, back: trimmedBack);
    _save();
    notifyListeners();
  }

  void deleteCardFromFolder(String folderId, String cardId) {
    final folder = folderById(folderId);
    if (folder == null) return;
    folder.cards.removeWhere((c) => c.id == cardId);
    _srs.remove(cardId);
    _save();
    notifyListeners();
  }

  List<Chapter> weakestChapters({int count = 3}) {
    final chapters = allChapters.where((c) => chapterAnsweredCount(c.id) > 0).toList();
    chapters.sort((a, b) => chapterAccuracy(a.id).compareTo(chapterAccuracy(b.id)));
    return chapters.take(count).toList();
  }

  List<MapEntry<String, double>> last7DaysAccuracy() {
    final result = <MapEntry<String, double>>[];
    const labels = ['Nd', 'Pn', 'Wt', 'Śr', 'Cz', 'Pt', 'So'];
    final now = clock();
    for (int i = 6; i >= 0; i--) {
      final day = DateTime(now.year, now.month, now.day - i);
      final stat = dailyStats[dateKey(day)];
      final acc = (stat != null && stat.answered > 0) ? (stat.correct / stat.answered) * 100 : 0.0;
      result.add(MapEntry(labels[day.weekday % 7], acc));
    }
    return result;
  }

  Topic? get continueTopic {
    if (lastActiveTopicId != null) {
      final t = findTopicById(lastActiveTopicId!);
      if (t != null) return t;
    }
    final chapters = classByLevel(selectedClassLevel).chapters;
    if (chapters.isEmpty) return null;
    return chapters.first.topics.isNotEmpty ? chapters.first.topics.first : null;
  }

  // ---- Wykrywanie luk ----

  bool _isLapsed(String cardId) {
    final s = _srs[cardId];
    return s != null && s.reviews > 0 && s.box == 0;
  }

  /// Tematy, w których uczeń traci najwięcej punktów, od największej luki.
  List<TopicGap> topicGaps({int? classLevel, int? limit}) {
    final chapters = classLevel != null ? classByLevel(classLevel).chapters : allChapters;
    final gaps = <TopicGap>[];
    for (final chapter in chapters) {
      for (final topic in chapter.topics) {
        final answered = topicAnsweredCount(topic.id);
        final correct = _topicCorrect[topic.id] ?? 0;
        final lapsed = topic.flashcards.where((f) => _isLapsed(f.id)).length;
        var score = 0.0;
        if (answered >= gapMinAnswered) {
          final accuracy = correct / answered * 100;
          if (accuracy < gapAccuracyThreshold) {
            score += (gapAccuracyThreshold - accuracy) / gapAccuracyThreshold * (min(answered, 10) / 10);
          }
        }
        if (lapsed >= gapMinLapsedCards) {
          score += 0.5 * lapsed / topic.flashcards.length;
        }
        if (score <= 0) continue;
        gaps.add(
          TopicGap(
            topic: topic,
            chapter: chapter,
            answered: answered,
            correct: correct,
            lapsedCards: lapsed,
            wrongQuestions: topic.questions.where((q) => wrongQuestionIds.contains(q.id)).length,
            score: score,
          ),
        );
      }
    }
    gaps.sort((a, b) => b.score.compareTo(a.score));
    return limit == null || gaps.length <= limit ? gaps : gaps.sublist(0, limit);
  }

  /// Pytania do ćwiczenia luk: najpierw te, na które uczeń odpowiedział źle,
  /// potem pozostałe z tych samych tematów — po kolei z każdej luki.
  List<QuizItem> gapPracticeItems(List<TopicGap> gaps, {int maxQuestions = 10}) {
    final pools = <List<QuizItem>>[];
    for (final gap in gaps.take(3)) {
      final shuffled = [...gap.topic.questions]..shuffle(_random);
      final ordered = [
        ...shuffled.where((q) => wrongQuestionIds.contains(q.id)),
        ...shuffled.where((q) => !wrongQuestionIds.contains(q.id)),
      ];
      if (ordered.isNotEmpty) {
        pools.add([for (final q in ordered) QuizItem(question: q, topicId: gap.topic.id)]);
      }
    }
    final result = <QuizItem>[];
    for (var round = 0; result.length < maxQuestions; round++) {
      var added = false;
      for (final pool in pools) {
        if (result.length >= maxQuestions) break;
        if (round < pool.length) {
          result.add(pool[round]);
          added = true;
        }
      }
      if (!added) break;
    }
    return result;
  }

  /// Fiszki z tematów-luk, które uczeń ostatnio oznaczył „Nie umiem".
  List<Flashcard> lapsedCardsFor(List<TopicGap> gaps) => [
    for (final gap in gaps)
      for (final card in gap.topic.flashcards)
        if (_isLapsed(card.id)) card,
  ];

  // ---- Plan nauki ----

  DateTime? get examDate => parseDateKey(examDateKey);

  bool isTopicDone(Topic topic) {
    if (!readTopics.contains(topic.id)) return false;
    if (topic.questions.isEmpty) return true;
    final needed = min(5, topic.questions.length);
    return topicAnsweredCount(topic.id) >= needed && topicAccuracy(topic.id) >= topicDoneAccuracy;
  }

  void setExamDate(DateTime? date) {
    examDateKey = date == null ? null : dateKey(date);
    _planDayKey = null;
    _save();
    notifyListeners();
  }

  Topic? _weakestAnsweredTopic() {
    Topic? best;
    var bestAccuracy = double.infinity;
    for (final chapter in allChapters) {
      for (final topic in chapter.topics) {
        if (topicAnsweredCount(topic.id) == 0 || topic.questions.isEmpty) continue;
        final accuracy = topicAccuracy(topic.id);
        if (accuracy < bestAccuracy) {
          bestAccuracy = accuracy;
          best = topic;
        }
      }
    }
    return best;
  }

  DailyPlan todayPlan() {
    final now = clock();
    final todayKey = dateKey(now);
    final ordered = allChapters.expand((c) => c.topics).toList();
    final remaining = ordered.where((t) => !isTopicDone(t)).length;
    final summary = summarizePlan(today: now, examDate: examDate, remainingTopics: remaining);
    if (summary.phase != PlanPhase.learning && summary.phase != PlanPhase.revision) {
      return DailyPlan(summary: summary);
    }

    if (_planDayKey != todayKey || _planExamKey != examDateKey) {
      final topics =
          summary.phase == PlanPhase.learning ? pickNext(ordered, isTopicDone, summary.topicsPerDay) : <Topic>[];
      final gaps = topicGaps(limit: 1);
      _planTopicIds = [for (final t in topics) t.id];
      _planCardsTarget = min(dueFlashcardsCount(), summary.phase == PlanPhase.revision ? 50 : 30);
      _planTestFromGaps = gaps.isNotEmpty;
      _planTestTopicId =
          gaps.isNotEmpty ? gaps.first.topic.id : (topics.isNotEmpty ? topics.first.id : _weakestAnsweredTopic()?.id);
      _planDataTaskId = null;
      for (final task in dataTasks) {
        if (!dataTaskBest.containsKey(task.id) && readTopics.contains(task.topicId)) {
          _planDataTaskId = task.id;
          break;
        }
      }
      _planOpenQuestionId = null;
      for (final question in openQuestions) {
        if (!openBest.containsKey(question.id) && readTopics.contains(question.topicId)) {
          _planOpenQuestionId = question.id;
          break;
        }
      }
      _planDayKey = todayKey;
      _planExamKey = examDateKey;
      _save();
    }

    final stat = dailyStats[todayKey];
    return DailyPlan(
      summary: summary,
      topics: [
        for (final id in _planTopicIds)
          if (findTopicById(id) != null) findTopicById(id)!,
      ],
      topicsReadToday: stat?.topicsRead ?? const {},
      cardsTarget: _planCardsTarget,
      cardsReviewedToday: stat?.cards ?? 0,
      testTopic: _planTestTopicId == null ? null : findTopicById(_planTestTopicId!),
      testFromGaps: _planTestFromGaps,
      testDoneToday: (stat?.tests ?? 0) > 0,
      dataTask: _planDataTaskId == null ? null : dataTaskById(_planDataTaskId!),
      dataTaskDoneToday: (stat?.dataTasks ?? 0) > 0,
      openQuestion: _planOpenQuestionId == null ? null : openQuestionById(_planOpenQuestionId!),
      openDoneToday: (stat?.openAnswers ?? 0) > 0,
    );
  }

  // ---- Sprawdziany ----

  /// Nadchodzące sprawdziany (od dziś), od najbliższego.
  List<PlannedTest> get upcomingPlannedTests {
    final today = clock();
    final upcoming =
        plannedTests.where((t) => daysBetween(today, parseDateKey(t.dateKey)!) >= 0).toList()
          ..sort((a, b) => a.dateKey.compareTo(b.dateKey));
    return upcoming;
  }

  void addPlannedTest({required DateTime date, required int classLevel, required List<String> chapterIds}) {
    if (chapterIds.isEmpty) return;
    plannedTests.add(
      PlannedTest(
        id: 'test_${DateTime.now().microsecondsSinceEpoch}',
        dateKey: dateKey(date),
        classLevel: classLevel,
        chapterIds: List.unmodifiable(chapterIds),
      ),
    );
    _save();
    notifyListeners();
  }

  void removePlannedTest(String id) {
    plannedTests.removeWhere((t) => t.id == id);
    _save();
    notifyListeners();
  }

  // ---- Zadania z danymi, zadania otwarte, próbna matura ----

  void completeDataTask(String taskId, int correct) {
    final previous = dataTaskBest[taskId];
    if (previous == null || correct > previous) dataTaskBest[taskId] = correct;
    _todayStatForWrite().dataTasks += 1;
    totalXp += 15;
    _checkBadges();
    _save();
    notifyListeners();
  }

  /// Wynik zadania otwartego wlicza się do statystyk tematu punktowo:
  /// każdy możliwy punkt to jedna „odpowiedź", a zdobyty punkt — poprawna.
  void recordOpenAnswer({
    required String topicId,
    required String questionId,
    required int points,
    required int maxPoints,
  }) {
    if (maxPoints <= 0) return;
    final earned = points.clamp(0, maxPoints);
    final chapterId = chapterOfTopic(topicId)?.id ?? topicId;
    _topicAnswered[topicId] = (_topicAnswered[topicId] ?? 0) + maxPoints;
    _topicCorrect[topicId] = (_topicCorrect[topicId] ?? 0) + earned;
    _chapterAnswered[chapterId] = (_chapterAnswered[chapterId] ?? 0) + maxPoints;
    _chapterCorrect[chapterId] = (_chapterCorrect[chapterId] ?? 0) + earned;
    final previous = openBest[questionId];
    if (previous == null || earned > previous) openBest[questionId] = earned;
    final stat = _todayStatForWrite();
    stat.openAnswers += 1;
    stat.answered += maxPoints;
    stat.correct += earned;
    totalXp += earned * 10 + 2;
    lastActiveTopicId = topicId;
    _checkBadges();
    _recordReadinessSnapshot();
    _save();
    notifyListeners();
  }

  void completeExam(ExamRecord record) {
    examHistory.add(record);
    _todayStatForWrite().tests += 1;
    totalXp += 50;
    _checkBadges();
    _recordReadinessSnapshot();
    _save();
    notifyListeners();
  }

  // ---- Mutations ----

  void setSelectedClassLevel(int level) {
    selectedClassLevel = level;
    _save();
    notifyListeners();
  }

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _save();
    notifyListeners();
  }

  void setLeagueNickname(String value) {
    final trimmed = value.trim();
    leagueNickname = trimmed.isEmpty ? null : trimmed;
    _save();
    notifyListeners();
  }

  void setUserName(String name) {
    userName = name.trim().isEmpty ? 'Uczeń' : name.trim();
    _save();
    notifyListeners();
  }

  void addXp(int amount) {
    totalXp += amount;
    _checkBadges();
  }

  void recordTestAnswer({
    required String topicId,
    required String chapterId,
    required String questionId,
    required bool correct,
  }) {
    _topicAnswered[topicId] = (_topicAnswered[topicId] ?? 0) + 1;
    _chapterAnswered[chapterId] = (_chapterAnswered[chapterId] ?? 0) + 1;
    if (correct) {
      _topicCorrect[topicId] = (_topicCorrect[topicId] ?? 0) + 1;
      _chapterCorrect[chapterId] = (_chapterCorrect[chapterId] ?? 0) + 1;
      wrongQuestionIds.remove(questionId);
    } else {
      wrongQuestionIds.add(questionId);
    }
    totalQuestionsAnswered += 1;
    if (correct) totalQuestionsCorrect += 1;
    final stat = _todayStatForWrite();
    stat.answered += 1;
    if (correct) stat.correct += 1;
    totalXp += correct ? 10 : 2;
    lastActiveTopicId = topicId;
    _checkBadges();
    _recordReadinessSnapshot();
    _save();
    notifyListeners();
  }

  void completeTest({required bool perfect}) {
    testsCompleted += 1;
    if (perfect) anyPerfectTest = true;
    _todayStatForWrite().tests += 1;
    totalXp += 30;
    _checkBadges();
    _save();
    notifyListeners();
  }

  void reviewFlashcard(String cardId, bool knew) {
    final now = clock();
    final srs = _srs[cardId] ?? _Srs(box: 0, dueMillis: now.millisecondsSinceEpoch);
    final box = knew ? (srs.box + 1).clamp(0, _srsIntervalsDays.length - 1) : 0;
    final due = now.add(Duration(days: _srsIntervalsDays[box]));
    _srs[cardId] = _Srs(
      box: box,
      dueMillis: due.millisecondsSinceEpoch,
      reviews: srs.reviews + 1,
      lapses: srs.lapses + (knew ? 0 : 1),
    );
    flashcardReviews += 1;
    _todayStatForWrite().cards += 1;
    totalXp += knew ? 3 : 1;
    _checkBadges();
    _save();
    notifyListeners();
  }

  void markTopicRead(String topicId) {
    lastActiveTopicId = topicId;
    _todayStatForWrite().topicsRead.add(topicId);
    if (readTopics.add(topicId)) {
      totalXp += 5;
      _checkBadges();
    }
    _save();
    notifyListeners();
  }

  void setPremium(bool value) {
    isPremium = value;
    _save();
    notifyListeners();
  }

  String? popNewlyUnlockedBadge() {
    if (newlyUnlockedQueue.isEmpty) return null;
    return newlyUnlockedQueue.removeAt(0);
  }

  // Genetics spans two curriculum sections (XIII gene expression, XIV inheritance
  // and variation), so the badge counts accuracy across all three chapters.
  static const _geneticsChapterIds = ['k4_ekspresja', 'k4_dziedziczenie', 'k4_zmiennosc'];

  int _groupAnsweredCount(List<String> chapterIds) =>
      chapterIds.fold<int>(0, (sum, id) => sum + (_chapterAnswered[id] ?? 0));

  double _groupAccuracy(List<String> chapterIds) {
    final answered = _groupAnsweredCount(chapterIds);
    if (answered == 0) return 0;
    final correct = chapterIds.fold<int>(0, (sum, id) => sum + (_chapterCorrect[id] ?? 0));
    return correct / answered * 100;
  }

  void _checkBadges() {
    void unlock(String id) {
      if (unlockedBadges.add(id)) newlyUnlockedQueue.add(id);
    }

    if (testsCompleted >= 1) unlock('first_test');
    if (flashcardReviews >= 100) unlock('flashcards_100');
    if (anyPerfectTest) unlock('perfect_test');
    if (_groupAnsweredCount(_geneticsChapterIds) > 0 && _groupAccuracy(_geneticsChapterIds) >= 80) {
      unlock('genetics_master');
    }
    if (level >= 5) unlock('level_5');
    if (totalQuestionsAnswered >= 500) unlock('questions_500');
    if (chapterAnsweredCount('k1_chemizm') > 0 && chapterAccuracy('k1_chemizm') >= 80) {
      unlock('chemist');
    }
    if (readTopics.length >= 10) unlock('theorist');
    if (testsCompleted >= 10) unlock('marathoner');
  }
}
