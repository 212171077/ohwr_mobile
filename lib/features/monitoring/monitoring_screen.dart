import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/theme/app_theme.dart';

// Chart data models
class ChartDataPoint {
  final String label;
  final double current;
  final double previous;
  final double aiOptimized;

  ChartDataPoint({
    required this.label,
    required this.current,
    required this.previous,
    required this.aiOptimized,
  });
}

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  String _selectedTimeRange = 'weekly'; // 'daily', 'weekly', or 'monthly'

  // Daily data
  static final List<ChartDataPoint> dailyData = [
    ChartDataPoint(label: 'Mon', current: 32.4, previous: 28.6, aiOptimized: 2.4),
    ChartDataPoint(label: 'Tue', current: 34.8, previous: 31.2, aiOptimized: 3.2),
    ChartDataPoint(label: 'Wed', current: 28.2, previous: 33.1, aiOptimized: 1.8),
    ChartDataPoint(label: 'Thu', current: 36.1, previous: 29.8, aiOptimized: 4.1),
    ChartDataPoint(label: 'Fri', current: 33.7, previous: 34.2, aiOptimized: 2.9),
    ChartDataPoint(label: 'Sat', current: 35.2, previous: 32.9, aiOptimized: 3.5),
    ChartDataPoint(label: 'Sun', current: 34.6, previous: 30.4, aiOptimized: 3.2),
  ];

  // Weekly data
  static final List<ChartDataPoint> weeklyData = [
    ChartDataPoint(label: 'Week 1', current: 218, previous: 195, aiOptimized: 18),
    ChartDataPoint(label: 'Week 2', current: 224, previous: 212, aiOptimized: 22),
    ChartDataPoint(label: 'Week 3', current: 198, previous: 218, aiOptimized: 14),
    ChartDataPoint(label: 'Week 4', current: 236, previous: 201, aiOptimized: 28),
  ];

  // Monthly data
  static final List<ChartDataPoint> monthlyData = [
    ChartDataPoint(label: 'Aug', current: 756, previous: 682, aiOptimized: 62),
    ChartDataPoint(label: 'Sep', current: 812, previous: 754, aiOptimized: 71),
    ChartDataPoint(label: 'Oct', current: 768, previous: 796, aiOptimized: 58),
    ChartDataPoint(label: 'Nov', current: 698, previous: 712, aiOptimized: 48),
    ChartDataPoint(label: 'Dec', current: 654, previous: 686, aiOptimized: 42),
    ChartDataPoint(label: 'Jan', current: 876, previous: 768, aiOptimized: 86),
  ];

  List<ChartDataPoint> get _currentData {
    switch (_selectedTimeRange) {
      case 'daily':
        return dailyData;
      case 'monthly':
        return monthlyData;
      case 'weekly':
      default:
        return weeklyData;
    }
  }

  double get _totalAIOptimized {
    switch (_selectedTimeRange) {
      case 'daily':
        return 21.1;
      case 'monthly':
        return 367;
      case 'weekly':
      default:
        return 82;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // Hero Header matching Dashboard design
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey.shade900,
                Colors.blue.shade900,
              ],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section with title and sun icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AI Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.emeraldGreen.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.smart_toy_outlined,
                                size: 14,
                                color: AppTheme.emeraldGreen,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'PERFORMANCE MONITORING',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.emeraldGreen,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'System Analytics',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Real-time monitoring & trend analysis',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFCBD5E1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade400.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.insights,
                      color: Colors.amber.shade400,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Current Performance Status
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.emeraldGreen,
                  Colors.green.shade700,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.emeraldGreen.withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Today's Status",
                          style: TextStyle(
                            color: Color(0xFFE0F2F1),
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              '34.6 kWh',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '↑ 8.2%',
                              style: TextStyle(
                                color: Colors.green.shade100,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.trending_up,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Exceeding AI forecast by 2.6 kWh — system performing above expectations',
                  style: TextStyle(
                    color: Color(0xFFE0F2F1),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Performance Comparison Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.bgWhite,
              border: Border.all(color: const Color(0xFFE2E8F0)),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Performance Comparison',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 16),
                // This Month vs Last Month
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'This Month vs Last Month',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.arrow_upward, color: AppTheme.emeraldGreen, size: 16),
                              const SizedBox(width: 4),
                              const Text(
                                '14.2%',
                                style: TextStyle(
                                  color: AppTheme.emeraldGreen,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'January 2026',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '876 kWh',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF0F172A),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 1,
                            height: 40,
                            color: const Color(0xFFE2E8F0),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'December 2025',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '768 kWh',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF64748B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Expected vs Actual (Today)
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFDBEAFE)),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Expected vs Actual (Today)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.arrow_upward, color: AppTheme.emeraldGreen, size: 16),
                              const SizedBox(width: 4),
                              const Text(
                                '8.2%',
                                style: TextStyle(
                                  color: AppTheme.emeraldGreen,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Actual Production',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '34.6 kWh',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF0F172A),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 1,
                            height: 40,
                            color: const Color(0xFFDBEAFE),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'AI Predicted',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '32.0 kWh',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF64748B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.only(top: 12),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Color(0xFFDBEAFE))),
                        ),
                        child: const Text(
                          'Deviation: +2.6 kWh above forecast — excellent conditions',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // With AI vs Standard Monitoring
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FDF4),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFA7F3D0)),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'With AI vs Standard Monitoring',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.arrow_upward, color: AppTheme.emeraldGreen, size: 16),
                              const SizedBox(width: 4),
                              const Text(
                                '17.9%',
                                style: TextStyle(
                                  color: AppTheme.emeraldGreen,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'AI Optimized',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'R212.80',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.emeraldGreen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 1,
                            height: 40,
                            color: const Color(0xFFA7F3D0),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Standard System',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'R180.40',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF64748B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.only(top: 12),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Color(0xFFA7F3D0))),
                        ),
                        child: const Text(
                          'Intelligence bonus: +R32.40 additional monthly revenue',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF047857),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Time Range Selector
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                _TimeRangeButton(
                  label: 'Daily',
                  isSelected: _selectedTimeRange == 'daily',
                  onTap: () => setState(() => _selectedTimeRange = 'daily'),
                ),
                _TimeRangeButton(
                  label: 'Weekly',
                  isSelected: _selectedTimeRange == 'weekly',
                  onTap: () => setState(() => _selectedTimeRange = 'weekly'),
                ),
                _TimeRangeButton(
                  label: 'Monthly',
                  isSelected: _selectedTimeRange == 'monthly',
                  onTap: () => setState(() => _selectedTimeRange = 'monthly'),
                ),
              ],
            ),
          ),
        ),
        // Performance Trends Chart
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.bgWhite,
              border: Border.all(color: const Color(0xFFE2E8F0)),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Performance Trends',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Current vs Previous + AI Impact',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.emoji_events, size: 14, color: AppTheme.emeraldGreen),
                          const SizedBox(width: 4),
                          Text(
                            '+${((_totalAIOptimized / (_selectedTimeRange == 'daily' ? 21.1 : _selectedTimeRange == 'weekly' ? 876 : 876)) * 100).toStringAsFixed(1)}%',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.emeraldGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Chart
                SizedBox(
                  height: 280,
                  child: _buildPerformanceChart(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Performance Deviations Alert
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFEF3C7),
                  Colors.amber.shade50,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFFCD34D)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEDC82),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        color: Color(0xFFB45309),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Deviation Detected',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF64748B),
                              ),
                              children: [
                                TextSpan(text: 'Northwest panel array performing '),
                                TextSpan(
                                  text: '12% below expected',
                                  style: TextStyle(
                                    color: Color(0xFFB45309),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(text: ' — AI flagged for attention'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.bgWhite,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFFCD34D)),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Expected Output:',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const Text(
                            '39.2 kWh',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF0F172A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Actual Output:',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const Text(
                            '34.6 kWh',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFFB45309),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Deviation:',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.arrow_downward, color: Colors.red.shade600, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                '-4.6 kWh (-11.7%)',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.red.shade600,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.only(top: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Color(0xFFE5E7EB), width: 0.5),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Likely Cause:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                Text(
                                  'Panel soiling',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFB45309),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Recommended Action:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                Text(
                                  'Schedule cleaning',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blue.shade600,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Potential Recovery:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                Text(
                                  '+R18/day',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppTheme.emeraldGreen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        // AI Insights
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFEFF6FF),
                  Colors.blue.shade50,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFDBEAFE)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.smart_toy_outlined, color: Colors.blue.shade600, size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      'AI Insights',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _InsightCard(
                  icon: Icons.emoji_events,
                  iconColor: AppTheme.emeraldGreen,
                  bgColor: const Color(0xFFF0FDF4),
                  title: 'Optimal Performance Window',
                  description:
                      'System consistently peaks between 11AM-2PM. AI scheduling recommendations could increase efficiency by 3-5%.',
                ),
                const SizedBox(height: 12),
                _InsightCard(
                  icon: Icons.trending_up,
                  iconColor: Colors.blue.shade600,
                  bgColor: const Color(0xFFEFF6FF),
                  title: 'Seasonal Trend Detected',
                  description:
                      'Performance improving 2.1% week-over-week as we approach autumn. Forecasting 12% uplift by March.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Performance vs Industry KPIs
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.bgWhite,
              border: Border.all(color: const Color(0xFFE2E8F0)),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Performance vs Industry',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Top 5% Nationally',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppTheme.emeraldGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _KPIRow(
                  label: 'Capacity Factor',
                  value: '18.6%',
                  benchmark: 'vs 15.2% avg',
                  percentage: 18.6,
                ),
                const SizedBox(height: 20),
                _KPIRow(
                  label: 'Energy Yield Efficiency',
                  value: '94.2%',
                  benchmark: 'vs 87.1% avg',
                  percentage: 94.2,
                ),
                const SizedBox(height: 20),
                _KPIRow(
                  label: 'System Availability',
                  value: '99.8%',
                  benchmark: 'vs 97.3% avg',
                  percentage: 99.8,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        // ROI Impact Statement
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blueGrey.shade900,
                  Colors.blue.shade900,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.emoji_events, color: AppTheme.emeraldGreen, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'MONITORING IMPACT',
                      style: TextStyle(
                        color: AppTheme.emeraldGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE0E7FF),
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(text: 'Real-time monitoring enables '),
                      const TextSpan(
                        text: 'early detection',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(text: ' of 3 anomalies this month, preventing '),
                      TextSpan(
                        text: 'R1,240',
                        style: TextStyle(
                          color: AppTheme.emeraldGreen,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(text: ' in potential losses.'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(top: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xFFE0E7FF), width: 0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Average response time:',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFCBD5E1),
                        ),
                      ),
                      const Text(
                        '2.4 hours',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceChart() {
    final data = _currentData;

    // Convert data to BarGroupData for BarChart
    final barGroups = <BarChartGroupData>[];
    for (int i = 0; i < data.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: data[i].previous,
              color: const Color(0xFFCBD5E1),
              width: 12,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            BarChartRodData(
              toY: data[i].current,
              color: AppTheme.emeraldGreen,
              width: 12,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
          ],
          barsSpace: 4,
        ),
      );
    }

    return BarChart(
      BarChartData(
        barGroups: barGroups,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: _selectedTimeRange == 'daily' ? 5 : _selectedTimeRange == 'weekly' ? 20 : 100,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xFFE2E8F0),
              strokeWidth: 1,
              dashArray: [3, 3],
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xFFE2E8F0),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < data.length) {
                  return Text(
                    data[index].label,
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
              reservedSize: 40,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.right,
                );
              },
              reservedSize: 40,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: const Color(0xFF1E293B),
            tooltipRoundedRadius: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String label = rodIndex == 0 ? 'Previous Period' : 'Current Period';
              return BarTooltipItem(
                '$label: ${rod.toY.toStringAsFixed(1)} kWh\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        ),
        maxY: _getMaxY(),
      ),
    );
  }

  double _getMaxY() {
    double max = 0;
    for (final point in _currentData) {
      max = max < point.current ? point.current : max;
      max = max < point.previous ? point.previous : max;
    }
    // Add some padding to the top
    return max * 1.1;
  }
}


class _TimeRangeButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TimeRangeButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.bgWhite : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    const BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? const Color(0xFF0F172A) : const Color(0xFF64748B),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class _InsightCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String description;

  const _InsightCard({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.bgWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _KPIRow extends StatelessWidget {
  final String label;
  final String value;
  final String benchmark;
  final double percentage;

  const _KPIRow({
    required this.label,
    required this.value,
    required this.benchmark,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F172A),
                  ),
                ),
                Text(
                  benchmark,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppTheme.emeraldGreen,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 8,
              width: (percentage / 100) * 280,
              decoration: BoxDecoration(
                color: AppTheme.emeraldGreen,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

