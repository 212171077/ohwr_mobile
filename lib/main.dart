import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/models/navigation_tab.dart';
import 'shared/widgets/main_app_shell.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/monitoring/monitoring_screen.dart';
import 'features/optimization/optimization_screen.dart';
import 'features/alerts/alerts_screen.dart';
import 'features/reports/reports_screen.dart';
import 'features/profile/profile_screen.dart';
import 'features/auth/login_screen.dart';

void main() {
  runApp(const OhwrMobileApp());
}

class OhwrMobileApp extends StatefulWidget {
  const OhwrMobileApp({super.key});

  @override
  State<OhwrMobileApp> createState() => _OhwrMobileAppState();
}

class _OhwrMobileAppState extends State<OhwrMobileApp> {
  bool _isLoggedIn = false;

  void _handleLogin() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _handleLogout() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OHWR Mobile',
      theme: AppTheme.theme,
      home: _isLoggedIn 
          ? MainAppShell(
              onLogout: _handleLogout,
              screenBuilder: (tab) => _buildScreen(tab, _handleLogout),
            )
          : LoginScreen(onLoginSuccess: _handleLogin),
      debugShowCheckedModeBanner: false,
    );
  }

  static Widget _buildScreen(NavigationTab tab, VoidCallback onLogout) {
    return switch (tab) {
      NavigationTab.overview => const DashboardScreen(),
      NavigationTab.monitoring => const MonitoringScreen(),
      NavigationTab.optimization => const OptimizationScreen(),
      NavigationTab.alerts => const AlertsScreen(),
      NavigationTab.reports => const ReportsScreen(),
      NavigationTab.profile => ProfileScreen(onLogout: onLogout),
    };
  }
}
