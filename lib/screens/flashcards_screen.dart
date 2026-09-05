import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';

class FlashcardsScreen extends StatefulWidget {
  final List<Flashcard> cards;
  final String title;
  const FlashcardsScreen({super.key, required this.cards, required this.title});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  int _index = 0;
  bool _flipped = false;
  int _known = 0;
  int _unknown = 0;

  void _answer(bool knew) {
    final card = widget.cards[_index];
    context.read<AppState>().reviewFlashcard(card.id, knew);
    setState(() {
      if (knew) {
        _known++;
      } else {
        _unknown++;
      }
      _flipped = false;
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cards.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: Text('Brak fiszek do powtórki.', style: TextStyle(color: AppColors.textMuted))),
      );
    }

    if (_index >= widget.cards.length) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle_rounded, color: AppColors.green, size: 64),
                const SizedBox(height: 16),
                const Text('Powtórka ukończona!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Umiem: $_known · Nie umiem: $_unknown', style: const TextStyle(color: AppColors.textMuted)),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('Zakończ'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final card = widget.cards[_index];
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: _index / widget.cards.length,
              backgroundColor: AppColors.darkBorder,
              color: AppColors.green,
              minHeight: 6,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${_index + 1} / ${widget.cards.length}', style: const TextStyle(color: AppColors.textMuted)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _flipped = !_flipped),
                child: AppCard(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _flipped ? 'ODPOWIEDŹ' : 'PYTANIE',
                          style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 12),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Center(
                            child: SingleChildScrollView(
                              child: Text(
                                _flipped ? card.back : card.front,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.4),
                              ),
                            ),
                          ),
                        ),
                        if (!_flipped)
                          const Text('Dotknij, aby odwrócić', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_flipped)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _answer(false),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.red,
                        side: const BorderSide(color: AppColors.red),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Nie umiem'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _answer(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Umiem'),
                    ),
                  ),
                ],
              )
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => setState(() => _flipped = true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkCardAlt,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Pokaż odpowiedź'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
