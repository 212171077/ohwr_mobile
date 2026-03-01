class Recommendation {
  final String title;
  final String description;
  final String impact;
  final String priority; // 'high', 'medium', 'low'
  final String category; // 'battery', 'solar', 'grid', 'efficiency'

  const Recommendation({
    required this.title,
    required this.description,
    required this.impact,
    required this.priority,
    required this.category,
  });

  static List<Recommendation> getMockRecommendations() {
    return [
      const Recommendation(
        title: 'Adjust Battery Charge Strategy',
        description:
            'Based on tomorrow\'s low solar forecast, reduce charge limit to 80% to preserve cycles.',
        impact: '+R45 estimated savings',
        priority: 'high',
        category: 'battery',
      ),
      const Recommendation(
        title: 'Panel Maintenance Needed',
        description:
            'Northwest panel array detected with 15% efficiency loss. Likely soiling or shading.',
        impact: '+R540/month revenue recovery',
        priority: 'high',
        category: 'solar',
      ),
      const Recommendation(
        title: 'Peak Load Optimization',
        description:
            'Shift high-consumption activities to peak solar hours (10 AM - 2 PM) for maximum efficiency.',
        impact: '-8% peak demand charges',
        priority: 'medium',
        category: 'efficiency',
      ),
      const Recommendation(
        title: 'Grid Tie Opportunity',
        description:
            'Excess solar production can be exported to grid during low-consumption periods.',
        impact: '+R120/month grid sales',
        priority: 'medium',
        category: 'grid',
      ),
    ];
  }
}

