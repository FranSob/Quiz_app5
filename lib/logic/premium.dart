/// Funkcje, które mogą wymagać Premium.
enum PremiumFeature { mockExam, readiness, aiGrading }

/// Podział według punktu 24 planu: cała nauka — teoria, fiszki, testy,
/// sprawdziany, luki, plan nauki, zadania z danymi i otwarte, notatki PDF —
/// jest darmowa. Płatne są narzędzia oceniające przygotowanie do matury.
/// Żeby zmienić podział, wystarczy zmienić ten zbiór.
const Set<PremiumFeature> paidFeatures = {
  PremiumFeature.mockExam,
  PremiumFeature.readiness,
  PremiumFeature.aiGrading,
};

bool isFeatureLocked(PremiumFeature feature, {required bool isPremium}) =>
    !isPremium && paidFeatures.contains(feature);

/// Włącza przełącznik podglądowy Premium także na Androidzie — wyłącznie
/// w naszych wersjach testowych, budowanych z:
///   flutter build apk --release --dart-define=PREVIEW_PREMIUM=true
/// Wersja wysyłana do Google Play budowana jest bez tej flagi, więc Premium
/// można tam włączyć jedynie prawdziwym zakupem.
const bool previewPremiumUnlock = bool.fromEnvironment('PREVIEW_PREMIUM');

/// Identyfikatory subskrypcji — muszą być dokładnie takie same w Konsoli Google Play.
const String monthlySubscriptionId = 'premium_monthly';
const String yearlySubscriptionId = 'premium_yearly';
const Set<String> subscriptionIds = {monthlySubscriptionId, yearlySubscriptionId};

/// Ceny pokazywane, zanim sklep zdąży podać własne (i w podglądzie w przeglądarce).
const Map<String, String> fallbackSubscriptionPrices = {
  monthlySubscriptionId: '19,99 zł',
  yearlySubscriptionId: '149 zł',
};

/// Czy zapis subskrypcji z serwera oznacza aktywne Premium.
/// Wygasłą subskrypcję traktujemy jak brak — nawet jeśli serwer nie zdążył
/// jeszcze zmienić jej statusu.
bool premiumFromSubscription({
  required String? status,
  required DateTime? expiresAt,
  required DateTime now,
}) {
  if (status != 'active') return false;
  if (expiresAt == null) return true;
  return expiresAt.isAfter(now);
}

String premiumFeatureName(PremiumFeature feature) {
  switch (feature) {
    case PremiumFeature.mockExam:
      return 'Próbna matura z timerem';
    case PremiumFeature.readiness:
      return 'Wskaźnik gotowości do matury';
    case PremiumFeature.aiGrading:
      return 'Ocenianie odpowiedzi przez AI';
  }
}
