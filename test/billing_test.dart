import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'package:biomatura/logic/premium.dart';
import 'package:biomatura/services/billing.dart';

/// Sklep Google Play zastąpiony atrapą — w testach nie ma do czego się łączyć.
class _FakeStore implements InAppPurchase {
  final List<PurchaseDetails> completed = [];

  @override
  Future<void> completePurchase(PurchaseDetails purchase) async => completed.add(purchase);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

PurchaseDetails _purchase({
  required PurchaseStatus status,
  String productId = yearlySubscriptionId,
  bool pendingComplete = true,
}) {
  final details = PurchaseDetails(
    purchaseID: 'p1',
    productID: productId,
    verificationData: PurchaseVerificationData(
      localVerificationData: 'local',
      serverVerificationData: 'token-123',
      source: 'google_play',
    ),
    transactionDate: null,
    status: status,
  );
  details.pendingCompletePurchase = pendingComplete;
  return details;
}

void main() {
  group('status subskrypcji', () {
    final now = DateTime.utc(2026, 9, 21, 12);

    test('active subscription with a future expiry unlocks Premium', () {
      expect(
        premiumFromSubscription(status: 'active', expiresAt: now.add(const Duration(days: 1)), now: now),
        isTrue,
      );
    });

    test('expired or cancelled subscription does not unlock Premium', () {
      expect(premiumFromSubscription(status: 'active', expiresAt: now.subtract(const Duration(minutes: 1)), now: now), isFalse);
      expect(premiumFromSubscription(status: 'inactive', expiresAt: now.add(const Duration(days: 30)), now: now), isFalse);
      expect(premiumFromSubscription(status: null, expiresAt: null, now: now), isFalse);
    });

    test('active subscription without an expiry date counts as active', () {
      expect(premiumFromSubscription(status: 'active', expiresAt: null, now: now), isTrue);
    });
  });

  group('zakupy', () {
    test('a purchase confirmed by the server unlocks Premium and is completed', () async {
      final store = _FakeStore();
      final service = BillingService(iap: store);
      String? verifiedProduct;
      String? verifiedToken;
      bool? premium;
      service.verifier = (productId, token) async {
        verifiedProduct = productId;
        verifiedToken = token;
        return true;
      };
      service.onPremiumChanged = (value) => premium = value;

      await service.handlePurchases([_purchase(status: PurchaseStatus.purchased)]);

      expect(premium, isTrue);
      expect(verifiedProduct, yearlySubscriptionId);
      expect(verifiedToken, 'token-123');
      expect(service.lastError, isNull);
      expect(service.busy, isFalse);
      expect(store.completed, hasLength(1), reason: 'niedokończony zakup Google ponawia w kółko');
    });

    test('a purchase the server did not confirm does not unlock Premium', () async {
      final service = BillingService(iap: _FakeStore());
      bool? premium;
      service.verifier = (_, _) async => false;
      service.onPremiumChanged = (value) => premium = value;

      await service.handlePurchases([_purchase(status: PurchaseStatus.restored)]);

      expect(premium, isFalse);
      expect(service.lastError, contains('Przywróć zakupy'));
    });

    test('without a verifier nothing is unlocked', () async {
      final service = BillingService(iap: _FakeStore());
      bool? premium;
      service.onPremiumChanged = (value) => premium = value;

      await service.handlePurchases([_purchase(status: PurchaseStatus.purchased)]);

      expect(premium, isFalse);
    });

    test('a cancelled purchase is not an error', () async {
      final service = BillingService(iap: _FakeStore());
      await service.handlePurchases([_purchase(status: PurchaseStatus.canceled, pendingComplete: false)]);
      expect(service.lastError, isNull);
      expect(service.busy, isFalse);
    });

    test('prices fall back to the price list until the store answers', () {
      final service = BillingService(iap: _FakeStore());
      expect(service.priceFor(monthlySubscriptionId), '19,99 zł');
      expect(service.priceFor(yearlySubscriptionId), '149 zł');
    });
  });
}
