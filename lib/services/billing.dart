import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../logic/premium.dart';

/// Zakupy subskrypcji przez Google Play.
///
/// Działa wyłącznie na Androidzie — w przeglądarce i na komputerze sklepu Google
/// po prostu nie ma, więc tam Premium pozostaje przełącznikiem podglądowym.
///
/// Sam zakup nie wystarcza do włączenia Premium: token zakupu sprawdza serwer
/// w Google Play Developer API i dopiero on zapisuje status. Dzięki temu nie da
/// się odblokować Premium, grzebiąc w telefonie.
class BillingService extends ChangeNotifier {
  BillingService({InAppPurchase? iap}) : _iap = iap ?? InAppPurchase.instance;

  final InAppPurchase _iap;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  /// Weryfikacja zakupu po stronie serwera; zwraca, czy Premium jest aktywne.
  Future<bool> Function(String productId, String purchaseToken)? verifier;

  /// Wołane, gdy zmienia się wynik weryfikacji.
  void Function(bool premium)? onPremiumChanged;

  List<ProductDetails> products = const [];
  bool storeAvailable = false;
  bool busy = false;
  String? lastError;

  static bool get supported => !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  Future<void> init() async {
    if (!supported) return;
    try {
      storeAvailable = await _iap.isAvailable();
    } catch (_) {
      storeAvailable = false;
    }
    if (!storeAvailable) {
      notifyListeners();
      return;
    }
    _subscription = _iap.purchaseStream.listen(
      handlePurchases,
      onError: (Object error) {
        lastError = 'Sklep Google Play zgłosił błąd. Spróbuj ponownie później.';
        busy = false;
        notifyListeners();
      },
    );
    try {
      final response = await _iap.queryProductDetails(subscriptionIds);
      products = response.productDetails;
    } catch (_) {
      lastError = 'Nie udało się pobrać cen ze sklepu.';
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  ProductDetails? productFor(String id) {
    for (final product in products) {
      if (product.id == id) return product;
    }
    return null;
  }

  /// Cena ze sklepu, a gdy jeszcze jej nie znamy — ta z cennika w aplikacji.
  String priceFor(String id) => productFor(id)?.price ?? fallbackSubscriptionPrices[id] ?? '';

  Future<void> buy(String productId) async {
    final product = productFor(productId);
    if (product == null) {
      lastError = 'Ten plan jest chwilowo niedostępny w sklepie.';
      notifyListeners();
      return;
    }
    busy = true;
    lastError = null;
    notifyListeners();
    try {
      await _iap.buyNonConsumable(purchaseParam: PurchaseParam(productDetails: product));
    } catch (_) {
      busy = false;
      lastError = 'Nie udało się rozpocząć zakupu.';
      notifyListeners();
    }
  }

  /// Przywraca zakup na nowym telefonie albo po ponownej instalacji.
  Future<void> restore() async {
    busy = true;
    lastError = null;
    notifyListeners();
    try {
      await _iap.restorePurchases();
    } catch (_) {
      lastError = 'Nie udało się przywrócić zakupów.';
    }
    busy = false;
    notifyListeners();
  }

  /// Obsługa zdarzeń ze sklepu. Wydzielona, żeby dało się ją przetestować.
  Future<void> handlePurchases(List<PurchaseDetails> purchases) async {
    for (final purchase in purchases) {
      switch (purchase.status) {
        case PurchaseStatus.pending:
          busy = true;
          notifyListeners();
        case PurchaseStatus.error:
          lastError = 'Zakup nie doszedł do skutku.';
          busy = false;
        case PurchaseStatus.canceled:
          lastError = null;
          busy = false;
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          final active = await verifier?.call(
                purchase.productID,
                purchase.verificationData.serverVerificationData,
              ) ??
              false;
          if (!active) {
            lastError = 'Zakup zapisany, ale nie udało się go jeszcze potwierdzić. '
                'Zaloguj się i spróbuj „Przywróć zakupy".';
          }
          onPremiumChanged?.call(active);
          busy = false;
      }
      if (purchase.pendingCompletePurchase) {
        try {
          await _iap.completePurchase(purchase);
        } catch (_) {
          // Sklep spróbuje ponownie przy następnym uruchomieniu.
        }
      }
    }
    notifyListeners();
  }
}

/// Jedna instancja na całą aplikację.
final BillingService billing = BillingService();
