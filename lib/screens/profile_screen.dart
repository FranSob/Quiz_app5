import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models.dart';
import '../services/cloud_sync.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import 'account_screen.dart';
import 'legal_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _editName(BuildContext context, AppState state) async {
    final controller = TextEditingController(text: state.userName);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCard,
        title: const Text('Zmień imię'),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Anuluj')),
          TextButton(onPressed: () => Navigator.of(context).pop(controller.text), child: const Text('Zapisz')),
        ],
      ),
    );
    if (result != null) state.setUserName(result);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final unlockedCount = state.unlockedBadges.length;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        Row(
          children: [
            const Expanded(child: Text('Profil', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
            IconButton(
              onPressed: () => state.toggleTheme(),
              icon: Icon(state.themeMode == ThemeMode.dark ? Icons.dark_mode_rounded : Icons.light_mode_rounded),
              style: IconButton.styleFrom(backgroundColor: AppColors.darkCardAlt, shape: const CircleBorder()),
            ),
          ],
        ),
        const SizedBox(height: 16),
        AppCard(
          onTap: () => _editName(context, state),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.green,
                child: Text(
                  state.userName.isNotEmpty ? state.userName[0].toUpperCase() : 'U',
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.userName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    Text('Klasa ${state.selectedClassLevel} liceum', style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                  ],
                ),
              ),
              const Icon(Icons.edit_outlined, color: AppColors.textMuted, size: 18),
            ],
          ),
        ),
        if (CloudSync.available) ...[
          const SizedBox(height: 10),
          AppCard(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AccountScreen())),
            child: Row(
              children: [
                Icon(
                  CloudSync.signedIn ? Icons.cloud_done_rounded : Icons.cloud_off_rounded,
                  color: CloudSync.signedIn ? AppColors.green : AppColors.textMuted,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(CloudSync.signedIn ? 'Postęp zapisywany w chmurze' : 'Zaloguj się',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(
                        CloudSync.email ?? 'Postęp jest tylko na tym urządzeniu',
                        style: const TextStyle(color: AppColors.textMuted, fontSize: 12.5),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
              ],
            ),
          ),
        ],
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Poziom ${state.level}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const Spacer(),
                  Text('${state.xpForNextLevel - state.xpIntoLevel} XP do poziomu ${state.level + 1}',
                      style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: state.xpIntoLevel / state.xpForNextLevel,
                  minHeight: 8,
                  backgroundColor: AppColors.darkBorder,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text('ODZNAKI · $unlockedCount / ${allBadges.length}',
            style: const TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.85,
          children: allBadges.map((b) {
            final unlocked = state.unlockedBadges.contains(b.id);
            return AppCard(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: unlocked ? AppColors.green.withValues(alpha: 0.2) : AppColors.darkCardAlt,
                    child: Icon(
                      unlocked ? _iconForBadge(b.id) : Icons.lock_outline_rounded,
                      color: unlocked ? AppColors.green : AppColors.textMuted,
                      size: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    b.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: unlocked ? Colors.white : AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    b.description,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 9, color: AppColors.textMuted),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        const Text('DOKUMENTY',
            style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
        const SizedBox(height: 10),
        for (final document in legalDocuments)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AppCard(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => LegalScreen(document: document)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.article_outlined, color: AppColors.textMuted, size: 20),
                  const SizedBox(width: 12),
                  Expanded(child: Text(document.title, style: const TextStyle(fontSize: 14))),
                  const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
                ],
              ),
            ),
          ),
      ],
    );
  }

  IconData _iconForBadge(String id) {
    switch (id) {
      case 'first_test':
        return Icons.check_rounded;
      case 'flashcards_100':
        return Icons.style_rounded;
      case 'perfect_test':
        return Icons.auto_awesome_rounded;
      case 'genetics_master':
        return Icons.close_rounded;
      case 'level_5':
        return Icons.bar_chart_rounded;
      case 'questions_500':
        return Icons.circle_outlined;
      case 'chemist':
        return Icons.science_outlined;
      case 'theorist':
        return Icons.crop_square_rounded;
      case 'marathoner':
        return Icons.bar_chart_rounded;
      default:
        return Icons.emoji_events_rounded;
    }
  }
}
