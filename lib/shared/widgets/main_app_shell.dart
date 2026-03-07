import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/models/navigation_tab.dart';
import '../widgets/bottom_navigation.dart';

class MainAppShell extends StatefulWidget {
  final Widget Function(NavigationTab) screenBuilder;
  final VoidCallback onLogout;

  const MainAppShell({
    super.key,
    required this.screenBuilder,
    required this.onLogout,
  });

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  NavigationTab _activeTab = NavigationTab.overview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      body: widget.screenBuilder(_activeTab),
      bottomNavigationBar: BottomNavigation(
        activeTab: _activeTab,
        onTabChanged: (tab) {
          setState(() => _activeTab = tab);
        },
      ),
    );
  }
}
