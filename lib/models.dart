class Flashcard {
  final String id;
  final String front;
  final String back;

  const Flashcard({required this.id, required this.front, required this.back});

  Map<String, dynamic> toJson() => {'id': id, 'front': front, 'back': back};

  factory Flashcard.fromJson(Map<String, dynamic> j) =>
      Flashcard(id: j['id'], front: j['front'], back: j['back']);
}

class FlashcardFolder {
  final String id;
  String name;
  final List<Flashcard> cards;

  FlashcardFolder({required this.id, required this.name, List<Flashcard>? cards})
      : cards = cards ?? [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cards': cards.map((c) => c.toJson()).toList(),
      };

  factory FlashcardFolder.fromJson(Map<String, dynamic> j) => FlashcardFolder(
        id: j['id'],
        name: j['name'],
        cards: (j['cards'] as List<dynamic>? ?? [])
            .map((c) => Flashcard.fromJson(Map<String, dynamic>.from(c)))
            .toList(),
      );
}

class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

/// Pytanie testowe razem z tematem, do którego należy — potrzebne przy
/// testach mieszanych (luki, sprawdziany), obejmujących wiele tematów.
class QuizItem {
  final QuizQuestion question;
  final String topicId;
  const QuizItem({required this.question, required this.topicId});
}

/// Sprawdzian szkolny zaplanowany przez ucznia na konkretny dzień.
class PlannedTest {
  final String id;
  final String dateKey;
  final int classLevel;
  final List<String> chapterIds;

  const PlannedTest({
    required this.id,
    required this.dateKey,
    required this.classLevel,
    required this.chapterIds,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': dateKey,
        'class': classLevel,
        'chapters': chapterIds,
      };

  factory PlannedTest.fromJson(Map<String, dynamic> j) => PlannedTest(
        id: j['id'],
        dateKey: j['date'],
        classLevel: j['class'] ?? 1,
        chapterIds: List<String>.from(j['chapters'] ?? []),
      );
}

/// Wynik próbnej matury.
class ExamRecord {
  final String dateKey;
  final String variant;
  final int points;
  final int maxPoints;
  final int seconds;

  const ExamRecord({
    required this.dateKey,
    required this.variant,
    required this.points,
    required this.maxPoints,
    required this.seconds,
  });

  double get percent => maxPoints > 0 ? points / maxPoints * 100 : 0;

  Map<String, dynamic> toJson() => {
        'date': dateKey,
        'variant': variant,
        'points': points,
        'max': maxPoints,
        'seconds': seconds,
      };

  factory ExamRecord.fromJson(Map<String, dynamic> j) => ExamRecord(
        dateKey: j['date'],
        variant: j['variant'] ?? 'mini',
        points: j['points'] ?? 0,
        maxPoints: j['max'] ?? 0,
        seconds: j['seconds'] ?? 0,
      );
}

class Topic {
  final String id;
  final String name;
  final String theory;
  final List<Flashcard> flashcards;
  final List<QuizQuestion> questions;

  const Topic({
    required this.id,
    required this.name,
    required this.theory,
    required this.flashcards,
    required this.questions,
  });
}

class Chapter {
  final String id;
  final String name;
  final List<Topic> topics;

  const Chapter({required this.id, required this.name, required this.topics});

  int get topicCount => topics.length;

  List<Flashcard> get allFlashcards =>
      topics.expand((t) => t.flashcards).toList();

  List<QuizQuestion> get allQuestions =>
      topics.expand((t) => t.questions).toList();
}

class ClassData {
  final int level;
  final String label;
  final List<Chapter> chapters;

  const ClassData({
    required this.level,
    required this.label,
    required this.chapters,
  });
}

class Badge {
  final String id;
  final String title;
  final String description;

  const Badge({required this.id, required this.title, required this.description});
}

const List<Badge> allBadges = [
  Badge(id: 'first_test', title: 'Pierwszy test', description: 'Ukończ jeden test'),
  Badge(id: 'flashcards_100', title: '100 fiszek', description: '100 powtórek fiszek'),
  Badge(id: 'perfect_test', title: 'Bezbłędny test', description: 'Test na 100%'),
  Badge(id: 'genetics_master', title: 'Mistrz genetyki', description: '80% w genetyce'),
  Badge(id: 'level_5', title: 'Poziom 5', description: 'Osiągnij poziom 5'),
  Badge(id: 'questions_500', title: '500 pytań', description: '500 pytań w testach'),
  Badge(id: 'chemist', title: 'Chemik', description: '80% z chemizmu życia'),
  Badge(id: 'theorist', title: 'Teoretyk', description: 'Przeczytaj 10 tematów'),
  Badge(id: 'marathoner', title: 'Maratończyk', description: '10 ukończonych testów'),
];
