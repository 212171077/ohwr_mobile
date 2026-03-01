import 'package:flutter/material.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/gauge_indicator.dart';
import '../../core/models/realtime_data.dart';
import '../../core/theme/app_theme.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  late RealtimeData _data;

  @override
  void initState() {
    super.initState();
    _data = RealtimeData.getMockData();
    // In a real app, this would be a stream from the backend
    _simulateDataUpdates();
  }

  void _simulateDataUpdates() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _data = RealtimeData.getMockData();
        });
        _simulateDataUpdates();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ScreenHeader(
          title: 'System Monitoring',
          subtitle: 'Real-time system metrics & status',
          leadingIcon: Icons.trending_up_outlined,
          backgroundColor: const Color(0xFF1E40AF),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Live Status Banner
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  border: Border.all(color: const Color(0xFFA7F3D0)),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppTheme.emeraldGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'All Systems Operational',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF047857),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Updated now',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Metrics Grid
              Text(
                'System Metrics',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: _data.metrics.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final metric = _data.metrics[index];
                  return GaugeIndicator(
                    label: metric.label,
                    value: metric.value,
                    unit: metric.unit,
                    percentage: metric.percentage,
                    status: metric.status,
                  );
                },
              ),
              const SizedBox(height: 24),
              // Energy Flow Section
              Text(
                'Energy Flow',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.bgWhite,
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _EnergyFlowItem(
                      label: 'Solar Panels → Battery',
                      value: '6.2 kW',
                      direction: 'down',
                    ),
                    const SizedBox(height: 12),
                    const Divider(height: 1),
                    const SizedBox(height: 12),
                    _EnergyFlowItem(
                      label: 'Battery → Load',
                      value: '3.5 kW',
                      direction: 'down',
                    ),
                    const SizedBox(height: 12),
                    const Divider(height: 1),
                    const SizedBox(height: 12),
                    _EnergyFlowItem(
                      label: 'Grid Tie',
                      value: '1.2 kW',
                      direction: 'up',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}

class _EnergyFlowItem extends StatelessWidget {
  final String label;
  final String value;
  final String direction; // 'up' or 'down'

  const _EnergyFlowItem({
    required this.label,
    required this.value,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    final arrowIcon =
        direction == 'down' ? Icons.arrow_downward : Icons.arrow_upward;
    final color =
        direction == 'down' ? AppTheme.emeraldGreen : AppTheme.amberOrange;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(arrowIcon, color: color, size: 18),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppTheme.textMedium,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}

