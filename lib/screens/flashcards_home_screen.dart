import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/biology_data.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import 'flashcards_screen.dart';
import 'folder_detail_screen.dart';

/// Anki-style deck picker: choose what to study before starting a review.
class FlashcardsHomeScreen extends StatelessWidget {
  const FlashcardsHomeScreen({super.key});

  Future<void> _createFolder(BuildContext context, AppState state) async {
    final controller = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCard,
        title: const Text('Nowy folder fiszek'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'np. Angielski — słówka'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Anuluj')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(controller.text),
            child: const Text('Utwórz'),
          ),
        ],
      ),
    );
    if (name != null && name.trim().isNotEmpty) {
      state.createFolder(name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final classData = classByLevel(state.selectedClassLevel);

    return Scaffold(
      appBar: AppBar(title: const Text('Fiszki')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _createFolder(context, state),
        backgroundColor: AppColors.green,
        foregroundColor: Colors.black,
        icon: const Icon(Icons.create_new_folder_rounded),
        label: const Text('Nowy folder'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
        children: [
          const Text('TWOJE FOLDERY',
              style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
          const SizedBox(height: 10),
          if (state.customFolders.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Nie masz jeszcze własnych folderów. Stwórz pierwszy i dodaj do niego swoje fiszki.',
                style: TextStyle(color: AppColors.textMuted),
              ),
            )
          else
            ...state.customFolders.map((folder) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _FolderTile(folder: folder, state: state),
                )),
          const SizedBox(height: 20),
          const Text('Z MATERIAŁU',
              style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold, letterSpacing: 0.8, fontSize: 13)),
          const SizedBox(height: 10),
          ...classData.chapters.map((chapter) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AppCard(
                  onTap: () {
                    final cards = chapter.allFlashcards;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => FlashcardsScreen(cards: cards, title: chapter.name),
                    ));
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.green.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.style_outlined, color: AppColors.green, size: 20),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(chapter.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${chapter.allFlashcards.length} fiszek',
                                style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class _FolderTile extends StatelessWidget {
  final FlashcardFolder folder;
  final AppState state;
  const _FolderTile({required this.folder, required this.state});

  Future<void> _rename(BuildContext context) async {
    final controller = TextEditingController(text: folder.name);
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCard,
        title: const Text('Zmień nazwę folderu'),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Anuluj')),
          TextButton(onPressed: () => Navigator.of(context).pop(controller.text), child: const Text('Zapisz')),
        ],
      ),
    );
    if (name != null && name.trim().isNotEmpty) {
      state.renameFolder(folder.id, name);
    }
  }

  Future<void> _delete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCard,
        title: const Text('Usunąć folder?'),
        content: Text('Folder "${folder.name}" i wszystkie jego fiszki zostaną usunięte.'),
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
      state.deleteFolder(folder.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dueCount = state.dueCountFrom(folder.cards);
    return AppCard(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => FolderDetailScreen(folderId: folder.id),
      )),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.orange.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.folder_rounded, color: AppColors.orange, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(folder.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(
                  folder.cards.isEmpty
                      ? 'Brak fiszek'
                      : '${folder.cards.length} fiszek · $dueCount do powtórki',
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, color: AppColors.textMuted),
            color: AppColors.darkCardAlt,
            onSelected: (value) {
              if (value == 'rename') _rename(context);
              if (value == 'delete') _delete(context);
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'rename', child: Text('Zmień nazwę')),
              PopupMenuItem(value: 'delete', child: Text('Usuń folder')),
            ],
          ),
        ],
      ),
    );
  }
}
