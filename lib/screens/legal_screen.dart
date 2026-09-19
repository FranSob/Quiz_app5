import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../data/legal_config.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import '../widgets/document_view.dart';

/// Dokumenty prawne aplikacji — te same pliki publikujemy pod adresem www.
class LegalDocument {
  final String title;
  final String asset;

  const LegalDocument(this.title, this.asset);
}

const List<LegalDocument> legalDocuments = [
  LegalDocument('Polityka prywatności', 'docs/polityka-prywatnosci.md'),
  LegalDocument('Regulamin', 'docs/regulamin.md'),
  LegalDocument('Dane i zgodność', 'docs/dane-i-zgodnosc.md'),
  LegalDocument('Usuwanie konta', 'docs/usuwanie-konta.md'),
];

class LegalScreen extends StatelessWidget {
  final LegalDocument document;

  const LegalScreen({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(document.title)),
      body: FutureBuilder<String>(
        future: rootBundle.loadString(document.asset),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Nie udało się wczytać dokumentu.'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return LegalContent(text: snapshot.data!);
        },
      ),
    );
  }
}

/// Treść dokumentu z ostrzeżeniem o nieuzupełnionych danych sprzedawcy.
class LegalContent extends StatelessWidget {
  final String text;

  const LegalContent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final missing = missingLegalDetails();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (missing.isNotEmpty) ...[
          AppCard(
            borderColor: AppColors.orange,
            child: Text(
              'Dokument nie jest gotowy do publikacji — brakuje danych: ${missing.join(', ')}. '
              'Uzupełnij je w pliku lib/data/legal_config.dart.',
              style: const TextStyle(fontSize: 13, height: 1.4),
            ),
          ),
          const SizedBox(height: 16),
        ],
        DocumentView(text: fillLegalPlaceholders(text)),
        const SizedBox(height: 24),
      ],
    );
  }
}
