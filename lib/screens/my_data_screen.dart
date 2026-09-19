import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../services/cloud_sync.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';

/// Realizacja prawa dostępu do danych (RODO): uczeń widzi dokładnie to,
/// co aplikacja o nim zapisuje, i może to skopiować.
class MyDataScreen extends StatelessWidget {
  const MyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final data = const JsonEncoder.withIndent('  ').convert(state.exportState());

    return Scaffold(
      appBar: AppBar(title: const Text('Moje dane')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CloudSync.signedIn
                      ? 'Konto: ${CloudSync.email}'
                      : 'Nie jesteś zalogowany — te dane są wyłącznie na tym urządzeniu.',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Poniżej jest komplet danych, które aplikacja o Tobie zapisuje: postęp nauki, '
                  'wyniki, plan i ustawienia. Nie zbieramy niczego poza tym i adresem e-mail konta.',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.45),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: data));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Skopiowano dane do schowka.'), backgroundColor: AppColors.green),
                );
              }
            },
            icon: const Icon(Icons.copy_rounded, size: 18),
            label: const Text('Kopiuj wszystko'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          const SizedBox(height: 12),
          AppCard(
            child: SelectableText(data, style: const TextStyle(fontSize: 11, height: 1.4, fontFamily: 'monospace')),
          ),
        ],
      ),
    );
  }
}
