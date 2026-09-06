import 'package:flutter/material.dart';
import '../theme.dart';
import 'home_screen.dart';
import 'stats_screen.dart';
import 'profile_screen.dart';
import 'premium_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
    StatsScreen(),
    ProfileScreen(),
    PremiumScreen(),
  ];

  void goToTab(int i) => setState(() => _index = i);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: IndexedStack(index: _index, children: _screens),
          ),
        ),
      ),
      bottomNavigationBar: Align(
        alignment: Alignment.center,
        heightFactor: 1,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  _NavItem(icon: Icons.home_rounded, label: 'Nauka', selected: _index == 0, onTap: () => goToTab(0)),
                  _NavItem(icon: Icons.bar_chart_rounded, label: 'Statystyki', selected: _index == 1, onTap: () => goToTab(1)),
                  _NavItem(icon: Icons.person_rounded, label: 'Profil', selected: _index == 2, onTap: () => goToTab(2)),
                  _NavItem(
                    icon: Icons.workspace_premium_rounded,
                    label: 'Premium',
                    selected: _index == 3,
                    onTap: () => goToTab(3),
                    activeColor: AppColors.orange,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color? activeColor;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? (activeColor ?? AppColors.green) : AppColors.textMuted;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
