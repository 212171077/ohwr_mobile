enum NavigationTab {
  overview,
  monitoring,
  optimization,
  alerts,
  reports,
}

extension NavigationTabExtension on NavigationTab {
  String get label {
    switch (this) {
      case NavigationTab.overview:
        return 'Overview';
      case NavigationTab.monitoring:
        return 'Monitor';
      case NavigationTab.optimization:
        return 'Optimize';
      case NavigationTab.alerts:
        return 'Alerts';
      case NavigationTab.reports:
        return 'Reports';
    }
  }
}

