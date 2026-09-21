import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';
import 'app_card.dart';

/// Oficjalne arkusze maturalne są darmowe na stronie CKE. Nie kopiujemy ich do
/// aplikacji (prawa do materiałów źródłowych w zadaniach należą do wydawców),
/// tylko kierujemy ucznia do źródła.
const String ckeArkuszeUrl = 'https://cke.gov.pl/arkusze/egzamin-maturalny/';

class CkeLinkCard extends StatelessWidget {
  const CkeLinkCard({super.key});

  Future<void> _open(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final opened = await launchUrl(Uri.parse(ckeArkuszeUrl), mode: LaunchMode.externalApplication);
    if (!opened) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Nie udało się otworzyć strony. Wejdź na cke.gov.pl/arkusze')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => _open(context),
      child: Row(
        children: [
          const Icon(Icons.open_in_new_rounded, color: AppColors.green),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Oficjalne arkusze CKE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 2),
                Text(
                  'Prawdziwe arkusze z poprzednich lat pobierzesz za darmo ze strony CKE. '
                  'Nasze zadania są przygotowane w ich stylu, ale to nie są arkusze CKE.',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12.5, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
