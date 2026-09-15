/// Daty kalendarzowe bez godzin — plan nauki i sprawdziany liczą całe dni.
library;

/// Klucz dnia w formacie „rrrr-mm-dd".
String dateKey(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// Odczytuje klucz „rrrr-mm-dd"; zwraca null dla niepoprawnego zapisu.
DateTime? parseDateKey(String? key) {
  if (key == null) return null;
  final parts = key.split('-');
  if (parts.length != 3) return null;
  final y = int.tryParse(parts[0]);
  final m = int.tryParse(parts[1]);
  final d = int.tryParse(parts[2]);
  if (y == null || m == null || d == null) return null;
  final date = DateTime(y, m, d);
  if (date.year != y || date.month != m || date.day != d) return null;
  return date;
}

/// Liczba pełnych dni kalendarzowych od [from] do [to]. Liczone w UTC, żeby
/// zmiana czasu letniego nie gubiła ani nie dodawała dnia.
int daysBetween(DateTime from, DateTime to) => DateTime.utc(to.year, to.month, to.day)
    .difference(DateTime.utc(from.year, from.month, from.day))
    .inDays;

const _monthsGenitive = [
  'stycznia', 'lutego', 'marca', 'kwietnia', 'maja', 'czerwca',
  'lipca', 'sierpnia', 'września', 'października', 'listopada', 'grudnia',
];

/// „15 maja 2027"
String formatDatePl(DateTime d) => '${d.day} ${_monthsGenitive[d.month - 1]} ${d.year}';
