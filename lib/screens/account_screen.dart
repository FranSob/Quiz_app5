import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/cloud_sync.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/app_card.dart';

/// Logowanie, zakładanie konta i ręczna synchronizacja postępu.
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _newAccount = false;
  bool _busy = false;
  String? _error;
  String? _info;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _busy = true;
      _error = null;
      _info = null;
    });
    try {
      await action();
    } catch (e) {
      if (mounted) setState(() => _error = authErrorMessage(e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _submit() async {
    final email = _email.text.trim();
    final password = _password.text;
    if (email.isEmpty || !email.contains('@')) {
      setState(() => _error = 'Podaj poprawny adres e-mail.');
      return;
    }
    if (password.length < 6) {
      setState(() => _error = 'Hasło musi mieć co najmniej 6 znaków.');
      return;
    }
    await _run(() async {
      if (_newAccount) {
        await CloudSync.signUp(email: email, password: password);
      } else {
        await CloudSync.signIn(email: email, password: password);
      }
      if (!mounted) return;
      if (CloudSync.signedIn) {
        await _sync();
      } else {
        setState(() => _info = 'Sprawdź skrzynkę i potwierdź adres e-mail, a potem zaloguj się.');
      }
    });
  }

  Future<void> _sync() async {
    final state = context.read<AppState>();
    final outcome = await syncNow(state);
    if (!mounted) return;
    setState(() {
      if (outcome == SyncOutcome.failed) {
        _error = syncMessage(outcome);
      } else {
        _info = syncMessage(outcome);
      }
    });
  }

  Future<void> _resetPassword() async {
    final email = _email.text.trim();
    if (!email.contains('@')) {
      setState(() => _error = 'Wpisz najpierw swój adres e-mail.');
      return;
    }
    await _run(() async {
      await CloudSync.sendPasswordReset(email);
      if (mounted) setState(() => _info = 'Wysłaliśmy link do ustawienia nowego hasła na $email.');
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Konto')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (!CloudSync.available)
            const AppCard(
              child: Text(
                'Ta wersja aplikacji działa bez kont — postęp zapisuje się tylko na tym urządzeniu.',
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
            )
          else if (CloudSync.signedIn)
            ..._signedIn()
          else
            ..._signedOut(),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(_error!, style: const TextStyle(color: AppColors.red, fontSize: 13)),
          ],
          if (_info != null) ...[
            const SizedBox(height: 12),
            Text(_info!, style: const TextStyle(color: AppColors.green, fontSize: 13)),
          ],
        ],
      ),
    );
  }

  List<Widget> _signedIn() {
    return [
      AppCard(
        child: Row(
          children: [
            const Icon(Icons.cloud_done_rounded, color: AppColors.green),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Zalogowano', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(CloudSync.email ?? '', style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        'Postęp zapisuje się w chmurze, więc nie zniknie przy zmianie telefonu. '
        'Przy łączeniu dwóch urządzeń zachowuję z obu wszystko, co zrobiłeś.',
        style: TextStyle(color: AppColors.textMuted, fontSize: 12.5, height: 1.45),
      ),
      const SizedBox(height: 16),
      ElevatedButton.icon(
        onPressed: _busy ? null : () => _run(_sync),
        icon: const Icon(Icons.sync_rounded, size: 18),
        label: const Text('Synchronizuj teraz'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: _busy
            ? null
            : () => _run(() async {
                  await syncNow(context.read<AppState>());
                  await CloudSync.signOut();
                  if (mounted) setState(() => _info = 'Wylogowano. Postęp został wcześniej zapisany w chmurze.');
                }),
        child: const Text('Wyloguj'),
      ),
    ];
  }

  List<Widget> _signedOut() {
    return [
      Text(
        _newAccount ? 'Załóż konto' : 'Zaloguj się',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 6),
      const Text(
        'Konto służy do zapisania postępu w chmurze. Bez konta aplikacja działa normalnie, '
        'ale postęp zostaje tylko na tym telefonie.',
        style: TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.45),
      ),
      const SizedBox(height: 16),
      TextField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        decoration: const InputDecoration(labelText: 'E-mail', border: OutlineInputBorder()),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: _password,
        obscureText: true,
        autofillHints: const [AutofillHints.password],
        decoration: const InputDecoration(labelText: 'Hasło', border: OutlineInputBorder()),
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: _busy ? null : _submit,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(_busy ? 'Chwileczkę…' : (_newAccount ? 'Załóż konto' : 'Zaloguj się')),
      ),
      const SizedBox(height: 8),
      TextButton(
        onPressed: _busy ? null : () => setState(() => _newAccount = !_newAccount),
        child: Text(_newAccount ? 'Mam już konto — zaloguj się' : 'Nie mam konta — załóż nowe'),
      ),
      if (!_newAccount)
        TextButton(
          onPressed: _busy ? null : _resetPassword,
          child: const Text('Nie pamiętam hasła'),
        ),
    ];
  }
}
