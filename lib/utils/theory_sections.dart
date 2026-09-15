class TheorySection {
  final String? heading;
  final String body;

  const TheorySection({this.heading, required this.body});
}

/// Dzieli teorię tematu na sekcje — tak samo na ekranie i w notatkach PDF.
///
/// Sekcje oddziela pusta linia. Jeśli pierwsza linia sekcji jest zapisana
/// wielkimi literami i pod nią jest tekst, staje się nagłówkiem sekcji.
List<TheorySection> parseTheorySections(String theory) {
  final result = <TheorySection>[];
  for (final raw in theory.trim().split('\n\n')) {
    final section = raw.trim();
    if (section.isEmpty) continue;
    final lines = section.split('\n');
    final first = lines.first;
    final isHeading = first == first.toUpperCase() && first.length > 3 && lines.length > 1;
    result.add(isHeading
        ? TheorySection(heading: first, body: lines.skip(1).join('\n'))
        : TheorySection(body: section));
  }
  return result;
}
