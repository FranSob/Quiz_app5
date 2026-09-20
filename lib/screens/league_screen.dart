import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../logic/league.dart';
import '../services/cloud_sync.dart';
import '../services/league_sync.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';
import 'account_screen.dart';

/// Ranking klasy — widoczny wyłącznie dla zalogowanych uczniów, bo z natury
/// wymaga wspólnego serwera (patrz CloudSync i LeagueSync).
class LeagueScreen extends StatefulWidget {
  const LeagueScreen({super.key});

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  final _joinCode = TextEditingController();
  final _groupName = TextEditingController();

  bool _loading = true;
  bool _busy = false;
  String? _error;
  LeagueGroup? _group;
  List<LeagueEntry> _entries = const [];

  @override
  void initState() {
    super.initState();
    if (CloudSync.available && CloudSync.signedIn) _load();
    _loading = CloudSync.available && CloudSync.signedIn;
  }

  @override
  void dispose() {
    _joinCode.dispose();
    _groupName.dispose();
    super.dispose();
  }

  String get _myUserId => CloudSync.currentUser?.id ?? '';

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final state = context.read<AppState>();
      final group = await LeagueSync.myGroup();
      if (group != null) {
        await LeagueSync.updateMyScore(nickname: normalizeNickname(state.userName), xp: state.totalXp);
        final members = await LeagueSync.fetchMembers(group.id);
        setState(() {
          _group = group;
          _entries = rankMembers(members, myUserId: _myUserId);
        });
      } else {
        setState(() {
          _group = null;
          _entries = const [];
        });
      }
    } catch (_) {
      if (mounted) setState(() => _error = 'Nie udało się wczytać rankingu. Sprawdź internet.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await action();
      await _load();
    } catch (e) {
      if (mounted) setState(() => _error = e is StateError ? e.message : 'Nie udało się wykonać tej operacji. Spróbuj ponownie.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _join() async {
    final normalized = normalizeGroupCode(_joinCode.text);
    if (!isValidGroupCode(normalized)) {
      setState(() => _error = 'Wpisz poprawny kod klasy.');
      return;
    }
    final state = context.read<AppState>();
    await _run(() => LeagueSync.joinGroup(normalized, nickname: normalizeNickname(state.userName), xp: state.totalXp));
  }

  Future<void> _create() async {
    final state = context.read<AppState>();
    final name = _groupName.text.trim();
    await _run(() => LeagueSync.createGroup(
          name: name.isEmpty ? null : name,
          nickname: normalizeNickname(state.userName),
          xp: state.totalXp,
        ));
  }

  Future<void> _leave() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCard,
        title: const Text('Opuścić klasę?'),
        content: const Text('Znikniesz z tego rankingu. Możesz dołączyć ponownie w każdej chwili, podając ten sam kod.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Anuluj')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Opuść', style: TextStyle(color: AppColors.red)),
          ),
        ],
      ),
    );
    if (confirmed == true) await _run(LeagueSync.leaveGroup);
  }

  void _copyCode() {
    final code = _group?.id;
    if (code == null) return;
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Skopiowano kod klasy.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liga klasy')),
      body: _body(),
    );
  }

  Widget _body() {
    if (!CloudSync.available || !CloudSync.signedIn) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Ranking klasy wymaga konta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'Żeby bezpiecznie porównywać wyniki z klasą, musisz być zalogowany — bez konta nie mamy jak pokazać '
            'Twojego wyniku innym, a ich Tobie.',
            style: TextStyle(color: AppColors.textMuted, fontSize: 13.5, height: 1.45),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AccountScreen())),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.black),
            child: const Text('Przejdź do konta'),
          ),
        ],
      );
    }

    if (_loading) return const Center(child: CircularProgressIndicator());

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (_error != null) ...[
            Text(_error!, style: const TextStyle(color: AppColors.red, fontSize: 13)),
            const SizedBox(height: 12),
          ],
          if (_group == null) ..._noGroup() else ..._inGroup(),
        ],
      ),
    );
  }

  List<Widget> _noGroup() {
    return [
      const Text('Dołącz do klasy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      const Text(
        'Wpisz kod od nauczyciela albo kolegi z klasy, żeby zobaczyć wspólny ranking XP.',
        style: TextStyle(color: AppColors.textMuted, fontSize: 13.5, height: 1.4),
      ),
      const SizedBox(height: 12),
      TextField(
        controller: _joinCode,
        textCapitalization: TextCapitalization.characters,
        decoration: const InputDecoration(labelText: 'Kod klasy', border: OutlineInputBorder()),
      ),
      const SizedBox(height: 8),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _busy ? null : _join,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: const Text('Dołącz'),
        ),
      ),
      const SizedBox(height: 24),
      const Center(child: Text('albo', style: TextStyle(color: AppColors.textMuted, fontSize: 12))),
      const SizedBox(height: 16),
      const Text('Załóż nową klasę', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TextField(
        controller: _groupName,
        decoration: const InputDecoration(
          labelText: 'Nazwa klasy (opcjonalnie)',
          hintText: 'np. 3A Liceum XYZ',
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: _busy ? null : _create,
          style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
          child: const Text('Stwórz nową klasę'),
        ),
      ),
    ];
  }

  List<Widget> _inGroup() {
    final group = _group!;
    return [
      AppCard(
        color: AppColors.greenBanner,
        borderColor: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(group.name ?? 'Twoja klasa',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(
                    'Kod: ${group.id} · ${_entries.length} ${_entries.length == 1 ? 'osoba' : 'osób'}',
                    style: const TextStyle(color: Colors.white70, fontSize: 12.5),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: _copyCode,
              icon: const Icon(Icons.copy_rounded, color: Colors.white),
              tooltip: 'Skopiuj kod',
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      for (final entry in _entries)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AppCard(
            borderColor: entry.isMe ? AppColors.green : null,
            child: Row(
              children: [
                SizedBox(
                  width: 28,
                  child: Text(
                    '${entry.rank}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: _rankColor(entry.rank)),
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 20,
                  child: entry.rank <= 3 ? Icon(Icons.emoji_events_rounded, color: _rankColor(entry.rank), size: 18) : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    entry.member.nickname,
                    style: TextStyle(fontWeight: entry.isMe ? FontWeight.bold : FontWeight.normal, fontSize: 14.5),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('${entry.member.xp} XP', style: const TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 13.5)),
              ],
            ),
          ),
        ),
      const SizedBox(height: 12),
      Center(
        child: TextButton(
          onPressed: _busy ? null : _leave,
          child: const Text('Opuść klasę', style: TextStyle(color: AppColors.red)),
        ),
      ),
    ];
  }

  Color _rankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xFFFFD700);
      case 2:
        return const Color(0xFFC0C0C0);
      case 3:
        return const Color(0xFFCD7F32);
      default:
        return AppColors.textMuted;
    }
  }
}
