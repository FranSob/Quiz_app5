/// Funkcje, które mogą wymagać Premium.
enum PremiumFeature { mockExam, readiness }

/// Podział według punktu 24 planu: cała nauka — teoria, fiszki, testy,
/// sprawdziany, luki, plan nauki, zadania z danymi i otwarte, notatki PDF —
/// jest darmowa. Płatne są narzędzia oceniające przygotowanie do matury.
/// Żeby zmienić podział, wystarczy zmienić ten zbiór.
const Set<PremiumFeature> paidFeatures = {PremiumFeature.mockExam, PremiumFeature.readiness};

bool isFeatureLocked(PremiumFeature feature, {required bool isPremium}) =>
    !isPremium && paidFeatures.contains(feature);

String premiumFeatureName(PremiumFeature feature) {
  switch (feature) {
    case PremiumFeature.mockExam:
      return 'Próbna matura z timerem';
    case PremiumFeature.readiness:
      return 'Wskaźnik gotowości do matury';
  }
}
