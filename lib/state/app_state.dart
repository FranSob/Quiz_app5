import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/biology_data.dart';
import '../models.dart';

class DailyStat {
  int answered;
  int correct;
  DailyStat({this.answered = 0, this.correct = 0});

  Map<String, dynamic> toJson() => {'a': answered, 'c': correct};
  factory DailyStat.fromJson(Map<String, dynamic> j) =>
      DailyStat(answered: j['a'] ?? 0, correct: j['c'] ?? 0);
}

class _Srs {
  int box;
  int dueMillis;
  _Srs({required this.box, required this.dueMillis});

  Map<String, dynamic> toJson() => {'b': box, 'd': dueMillis};
  factory _Srs.fromJson(Map<String, dynamic> j) =>
      _Srs(box: j['b'] ?? 0, dueMillis: j['d'] ?? 0);
}

// Leitner-style spaced repetition intervals, in days.
const List<int> _srsIntervalsDays = [0, 1, 3, 7, 14, 30];

class AppState extends ChangeNotifier {
  static const _prefsKey = 'biomatura_state_v1';
  SharedPreferences? _prefs;
  bool _loaded = false;
  bool get loaded => _loaded;

  ThemeMode themeMode = ThemeMode.dark;
  int selectedClassLevel = 4;
  String userName = 'Uczeń';
  int totalXp = 0;
  bool isPremium = false;
  String? lastActiveTopicId;

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

  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    final raw = _prefs!.getString(_prefsKey);
    if (raw != null) {
      try {
        final j = jsonDecode(raw) as Map<String, dynamic>;
        themeMode = (j['themeMode'] == 'light') ? ThemeMode.light : ThemeMode.dark;
        selectedClassLevel = j['selectedClassLevel'] ?? 4;
        userName = j['userName'] ?? 'Uczeń';
        totalXp = j['totalXp'] ?? 0;
        isPremium = j['isPremium'] ?? false;
        lastActiveTopicId = j['lastActiveTopicId'];
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
        customFolders.addAll(
          foldersJson.map((f) => FlashcardFolder.fromJson(Map<String, dynamic>.from(f))),
        );
      } catch (_) {
        // Corrupt data — start fresh.
      }
    }
    _ensureAllFlashcardsTracked();
    _loaded = true;
    notifyListeners();
  }

  void _ensureAllFlashcardsTracked() {
    final now = DateTime.now().millisecondsSinceEpoch;
    for (final c in biologyData) {
      for (final ch in c.chapters) {
        for (final t in ch.topics) {
          for (final f in t.flashcards) {
            _srs.putIfAbsent(f.id, () => _Srs(box: 0, dueMillis: now));
          }
        }
      }
    }
  }

  Future<void> _save() async {
    if (_prefs == null) return;
    final j = <String, dynamic>{
      'themeMode': themeMode == ThemeMode.light ? 'light' : 'dark',
      'selectedClassLevel': selectedClassLevel,
      'userName': userName,
      'totalXp': totalXp,
      'isPremium': isPremium,
      'lastActiveTopicId': lastActiveTopicId,
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
    };
    await _prefs!.setString(_prefsKey, jsonEncode(j));
  }

  // ---- Derived values ----

  int get level => (totalXp ~/ 100) + 1;
  int get xpIntoLevel => totalXp % 100;
  int get xpForNextLevel => 100;

  double get overallAccuracy => totalQuestionsAnswered > 0
      ? (totalQuestionsCorrect / totalQuestionsAnswered) * 100
      : 0;

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

  bool _isDue(String cardId, int now) {
    final srs = _srs[cardId];
    return srs == null || srs.dueMillis <= now;
  }

  List<Flashcard> dueFlashcards({int? classLevel}) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final scope = classLevel != null ? classByLevel(classLevel).chapters : allChapters;
    final cards = scope.expand((ch) => ch.allFlashcards).toList();
    return cards.where((f) => _isDue(f.id, now)).toList();
  }

  int dueFlashcardsCount({int? classLevel}) => dueFlashcards(classLevel: classLevel).length;

  List<Flashcard> dueCardsFrom(List<Flashcard> cards) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return cards.where((f) => _isDue(f.id, now)).toList();
  }

  int dueCountFrom(List<Flashcard> cards) => dueCardsFrom(cards).length;

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
    customFolders.add(FlashcardFolder(
      id: 'folder_${DateTime.now().microsecondsSinceEpoch}',
      name: trimmed,
    ));
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
    folder.cards.add(Flashcard(
      id: 'card_${DateTime.now().microsecondsSinceEpoch}',
      front: trimmedFront,
      back: trimmedBack,
    ));
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
    final now = DateTime.now();
    for (int i = 6; i >= 0; i--) {
      final day = now.subtract(Duration(days: i));
      final key = _dateKey(day);
      final stat = dailyStats[key];
      final acc = (stat != null && stat.answered > 0) ? (stat.correct / stat.answered) * 100 : 0.0;
      result.add(MapEntry(labels[day.weekday % 7], acc));
    }
    return result;
  }

  String _dateKey(DateTime d) => '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  void _recordDaily(bool correct) {
    final key = _dateKey(DateTime.now());
    final stat = dailyStats.putIfAbsent(key, () => DailyStat());
    stat.answered += 1;
    if (correct) stat.correct += 1;
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

  void setUserName(String name) {
    userName = name.trim().isEmpty ? 'Uczeń' : name.trim();
    _save();
    notifyListeners();
  }

  void addXp(int amount) {
    totalXp += amount;
    _checkBadges();
  }

  void recordTestAnswer({required String topicId, required String chapterId, required bool correct}) {
    _topicAnswered[topicId] = (_topicAnswered[topicId] ?? 0) + 1;
    _chapterAnswered[chapterId] = (_chapterAnswered[chapterId] ?? 0) + 1;
    if (correct) {
      _topicCorrect[topicId] = (_topicCorrect[topicId] ?? 0) + 1;
      _chapterCorrect[chapterId] = (_chapterCorrect[chapterId] ?? 0) + 1;
    }
    totalQuestionsAnswered += 1;
    if (correct) totalQuestionsCorrect += 1;
    _recordDaily(correct);
    totalXp += correct ? 10 : 2;
    lastActiveTopicId = topicId;
    _checkBadges();
    _save();
    notifyListeners();
  }

  void completeTest({required bool perfect}) {
    testsCompleted += 1;
    if (perfect) anyPerfectTest = true;
    totalXp += 30;
    _checkBadges();
    _save();
    notifyListeners();
  }

  void reviewFlashcard(String cardId, bool knew) {
    final srs = _srs[cardId] ?? _Srs(box: 0, dueMillis: DateTime.now().millisecondsSinceEpoch);
    int box = knew ? (srs.box + 1).clamp(0, _srsIntervalsDays.length - 1) : 0;
    final due = DateTime.now().add(Duration(days: _srsIntervalsDays[box]));
    _srs[cardId] = _Srs(box: box, dueMillis: due.millisecondsSinceEpoch);
    flashcardReviews += 1;
    totalXp += knew ? 3 : 1;
    _checkBadges();
    _save();
    notifyListeners();
  }

  void markTopicRead(String topicId) {
    lastActiveTopicId = topicId;
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
