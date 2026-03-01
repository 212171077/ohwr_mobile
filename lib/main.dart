import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/models/navigation_tab.dart';
import 'shared/widgets/main_app_shell.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/monitoring/monitoring_screen.dart';
import 'features/optimization/optimization_screen.dart';
import 'features/alerts/alerts_screen.dart';
import 'features/reports/reports_screen.dart';

void main() {
  runApp(const OhwrMobileApp());
}

class OhwrMobileApp extends StatelessWidget {
  const OhwrMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OHWR Mobile',
      theme: AppTheme.theme,
      home: MainAppShell(
        screenBuilder: (tab) => _buildScreen(tab),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  static Widget _buildScreen(NavigationTab tab) {
    switch (tab) {
      case NavigationTab.overview:
        return const DashboardScreen();
      case NavigationTab.monitoring:
        return const MonitoringScreen();
      case NavigationTab.optimization:
        return const OptimizationScreen();
      case NavigationTab.alerts:
        return const AlertsScreen();
      case NavigationTab.reports:
        return const ReportsScreen();
    }
  }
}
