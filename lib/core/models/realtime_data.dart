class SystemMetric {
  final String label;
  final String value;
  final String unit;
  final double percentage;
  final String status; // 'optimal', 'warning', 'critical'

  const SystemMetric({
    required this.label,
    required this.value,
    required this.unit,
    required this.percentage,
    required this.status,
  });
}

class RealtimeData {
  final List<SystemMetric> metrics;
  final String timestamp;
  final bool isLive;

  const RealtimeData({
    required this.metrics,
    required this.timestamp,
    required this.isLive,
  });

  // Mock data
  static RealtimeData getMockData() {
    return RealtimeData(
      timestamp: DateTime.now().toString(),
      isLive: true,
      metrics: [
        const SystemMetric(
          label: 'Solar Production',
          value: '8.2',
          unit: 'kW',
          percentage: 82,
          status: 'optimal',
        ),
        const SystemMetric(
          label: 'Battery Charge',
          value: '85',
          unit: '%',
          percentage: 85,
          status: 'optimal',
        ),
        const SystemMetric(
          label: 'Grid Supply',
          value: '240',
          unit: 'V',
          percentage: 100,
          status: 'optimal',
        ),
        const SystemMetric(
          label: 'Inverter Temp',
          value: '58',
          unit: '°C',
          percentage: 65,
          status: 'optimal',
        ),
        const SystemMetric(
          label: 'System Load',
          value: '3.5',
          unit: 'kW',
          percentage: 45,
          status: 'optimal',
        ),
        const SystemMetric(
          label: 'Energy Output',
          value: '156.4',
          unit: 'kWh',
          percentage: 92,
          status: 'optimal',
        ),
      ],
    );
  }
}

