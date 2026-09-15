import 'package:flutter/material.dart';

import '../logic/premium.dart';
import '../screens/premium_screen.dart';
import '../theme.dart';
import 'app_card.dart';

/// Karta w miejscu funkcji Premium: mówi, co to jest, i prowadzi do zakupu.
class PremiumLockedCard extends StatelessWidget {
  final PremiumFeature feature;
  final String description;

  const PremiumLockedCard({super.key, required this.feature, required this.description});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(color: AppColors.orange, shape: BoxShape.circle),
                child: const Icon(Icons.lock_rounded, color: Colors.black, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(premiumFeatureName(feature),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(description, style: const TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.4)),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PremiumScreen())),
            icon: const Icon(Icons.workspace_premium_rounded, size: 18),
            label: const Text('Odblokuj w Premium'),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.orange, foregroundColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
