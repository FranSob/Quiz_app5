/// Zadania z materiałem źródłowym — wykresem, tabelą, rodowodem lub
/// elektroforegramem — do których odnoszą się pytania, jak na maturze.
library;

abstract class TaskVisual {
  const TaskVisual();
}

class TableVisual extends TaskVisual {
  final List<String> headers;
  final List<List<String>> rows;

  const TableVisual({required this.headers, required this.rows});
}

class ChartPoint {
  final double x;
  final double y;

  const ChartPoint(this.x, this.y);
}

class LineSeries {
  final String name;
  final List<ChartPoint> points;

  const LineSeries({required this.name, required this.points});
}

class LineChartVisual extends TaskVisual {
  final String xLabel;
  final String yLabel;
  final List<LineSeries> series;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final double xInterval;
  final double yInterval;

  /// Odcinki proste zamiast wygładzonej krzywej — dla danych skokowych.
  final bool straight;

  const LineChartVisual({
    required this.xLabel,
    required this.yLabel,
    required this.series,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    required this.xInterval,
    required this.yInterval,
    this.straight = false,
  });
}

class BarItem {
  /// Krótki opis pod słupkiem, np. „A".
  final String label;

  /// Pełny opis w legendzie pod wykresem.
  final String description;
  final double value;

  const BarItem({required this.label, required this.description, required this.value});
}

class BarChartVisual extends TaskVisual {
  final String yLabel;
  final List<BarItem> bars;
  final double maxY;
  final double yInterval;

  const BarChartVisual({required this.yLabel, required this.bars, required this.maxY, required this.yInterval});
}

class PedigreePerson {
  /// Oznaczenie osoby, np. „II-2" (pokolenie rzymskie, numer osoby).
  final String id;
  final int generation;

  /// Pozycja w poziomie, w jednostkach szerokości kolumny (może być ułamkowa).
  final double slot;
  final bool male;
  final bool affected;

  const PedigreePerson({
    required this.id,
    required this.generation,
    required this.slot,
    required this.male,
    required this.affected,
  });
}

class PedigreeFamily {
  final String parentA;
  final String parentB;
  final List<String> children;

  const PedigreeFamily({required this.parentA, required this.parentB, required this.children});
}

class PedigreeVisual extends TaskVisual {
  final List<PedigreePerson> people;
  final List<PedigreeFamily> families;

  /// Liczba kolumn, na które dzielona jest szerokość rysunku.
  final int slots;

  const PedigreeVisual({required this.people, required this.families, required this.slots});
}

class GelLane {
  final String label;

  /// Długości fragmentów DNA w parach zasad.
  final List<int> bands;

  const GelLane({required this.label, required this.bands});
}

class GelVisual extends TaskVisual {
  final List<GelLane> lanes;

  const GelVisual({required this.lanes});
}

class DataTaskQuestion {
  final String id;
  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const DataTaskQuestion({
    required this.id,
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

class DataTask {
  final String id;
  final String title;

  /// Temat programu, do którego wliczają się odpowiedzi (statystyki, luki).
  final String topicId;
  final String intro;
  final TaskVisual visual;
  final String caption;
  final List<DataTaskQuestion> questions;

  const DataTask({
    required this.id,
    required this.title,
    required this.topicId,
    required this.intro,
    required this.visual,
    required this.caption,
    required this.questions,
  });

  /// Klasa wynika z prefiksu tematu, np. „k3_…" → 3.
  int get classLevel => int.parse(topicId.substring(1, 2));
}
