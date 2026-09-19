/// Dane, które muszą trafić do regulaminu i polityki prywatności.
///
/// Dopóki któreś pole jest puste, aplikacja pokazuje nad dokumentem ostrzeżenie,
/// żeby nie dało się opublikować wersji z nieuzupełnionymi danymi sprzedawcy.
const Map<String, String> legalDetails = {
  'NAZWA_APLIKACJI': 'BioMatura',
  'IMIĘ_I_NAZWISKO_SPRZEDAWCY': '',
  'ADRES': '',
  'E-MAIL_KONTAKTOWY': '',
  'DOSTAWCA_POCZTY': '',
  'ADRES_STRONY_USUWANIA_KONTA': '',
};

/// Pola, których jeszcze nie uzupełniono.
List<String> missingLegalDetails() =>
    legalDetails.entries.where((e) => e.value.trim().isEmpty).map((e) => e.key).toList();

/// Podstawia dane sprzedawcy w miejsce znaczników [TAKICH_JAK_TEN].
String fillLegalPlaceholders(String text) {
  var result = text;
  legalDetails.forEach((key, value) {
    result = result.replaceAll('[$key]', value.trim().isEmpty ? '[$key — do uzupełnienia]' : value);
  });
  return result;
}
