/// Polska odmiana rzeczowników przez liczebniki.
///
/// Polski ma trzy formy, nie dwie: 1 temat, 2-4 tematy, 5+ tematów —
/// z wyjątkiem nastek (12, 13, 14 tematów) i z powrotem 22, 23, 24 tematy.
String plural(int n, String one, String few, String many) {
  if (n == 1) return one;
  final lastTwo = n % 100;
  if (lastTwo >= 12 && lastTwo <= 14) return many;
  final last = n % 10;
  if (last >= 2 && last <= 4) return few;
  return many;
}

/// „1 temat", „2 tematy", „8 tematów"
String topicsLabel(int n) => '$n ${plural(n, 'temat', 'tematy', 'tematów')}';
