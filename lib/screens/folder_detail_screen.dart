import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import 'flashcards_screen.dart';

class FolderDetailScreen extends StatelessWidget {
  final String folderId;
  const FolderDetailScreen({super.key, required this.folderId});

  Future<void> _editCard(BuildContext context, AppState state, {Flashcard? existing}) async {
    final frontController = TextEditingController(text: existing?.front ?? '');
    final backController = TextEditingController(text: existing?.back ?? '');
    final saved = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCard,
        title: Text(existing == null ? 'Nowa fiszka' : 'Edytuj fiszkę'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: frontController,
              autofocus: true,
              maxLines: 3,
              minLines: 1,
              decoration: const InputDecoration(labelText: 'Pytanie / przód'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: backController,
              maxLines: 4,
              minLines: 1,
              decoration: const InputDecoration(labelText: 'Odpowiedź / tył'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Anuluj')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Zapisz')),
        ],
      ),
    );
    if (saved != true) return;
    final front = frontController.text.trim();
    final back = backController.text.trim();
    if (front.isEmpty || back.isEmpty) return;
    if (existing == null) {
      state.addCardToFolder(folderId, front, back);
    } else {
      state.updateCardInFolder(folderId, existing.id, front, back);
    }
  }

  Future<void> _deleteCard(BuildContext context, AppState state, Flashcard card) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCard,
        title: const Text('Usunąć fiszkę?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Anuluj')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Usuń', style: TextStyle(color: AppColors.red)),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      state.deleteCardFromFolder(folderId, card.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final folder = state.folderById(folderId);

    if (folder == null) {
      return const Scaffold(body: Center(child: Text('Folder nie istnieje.')));
    }

    return Scaffold(
      appBar: AppBar(title: Text(folder.name)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _editCard(context, state),
        backgroundColor: AppColors.green,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add_rounded),
      ),
      body: Column(
        children: [
          if (folder.cards.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    final due = state.dueCardsFrom(folder.cards);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => FlashcardsScreen(
                        cards: due.isNotEmpty ? due : folder.cards,
                        title: folder.name,
                      ),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Ucz się'),
                ),
              ),
            ),
          Expanded(
            child: folder.cards.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Ten folder jest pusty. Dodaj swoją pierwszą fiszkę przyciskiem +.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.textMuted),
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
                    itemCount: folder.cards.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, i) {
                      final card = folder.cards[i];
                      return AppCard(
                        onTap: () => _editCard(context, state, existing: card),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(card.front,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  const SizedBox(height: 4),
                                  Text(card.back,
                                      style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => _deleteCard(context, state, card),
                              icon: const Icon(Icons.delete_outline_rounded, color: AppColors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
