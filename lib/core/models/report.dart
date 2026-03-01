class Report {
  final String month;
  final String totalProduction;
  final String totalSavings;
  final String efficiency;
  final String peakProduction;
  final String status; // 'completed', 'pending'

  const Report({
    required this.month,
    required this.totalProduction,
    required this.totalSavings,
    required this.efficiency,
    required this.peakProduction,
    required this.status,
  });

  static List<Report> getMockReports() {
    return [
      const Report(
        month: 'February 2026',
        totalProduction: '1,245 kWh',
        totalSavings: 'R4,580',
        efficiency: '94.2%',
        peakProduction: '8.5 kW',
        status: 'completed',
      ),
      const Report(
        month: 'January 2026',
        totalProduction: '1,128 kWh',
        totalSavings: 'R4,125',
        efficiency: '91.8%',
        peakProduction: '8.2 kW',
        status: 'completed',
      ),
      const Report(
        month: 'December 2025',
        totalProduction: '1,456 kWh',
        totalSavings: 'R5,342',
        efficiency: '95.1%',
        peakProduction: '8.8 kW',
        status: 'completed',
      ),
      const Report(
        month: 'November 2025',
        totalProduction: '1,089 kWh',
        totalSavings: 'R3,998',
        efficiency: '90.5%',
        peakProduction: '7.9 kW',
        status: 'completed',
      ),
    ];
  }
}

