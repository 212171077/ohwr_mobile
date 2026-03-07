import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/theme/app_theme.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String _reportType = 'performance'; // 'performance', 'financial', or 'esg'

  final List<Map<String, dynamic>> _monthlyPerformanceData = [
    {'month': 'Aug', 'production': 756.0, 'savings': 212.0},
    {'month': 'Sep', 'production': 812.0, 'savings': 238.0},
    {'month': 'Oct', 'production': 768.0, 'savings': 224.0},
    {'month': 'Nov', 'production': 698.0, 'savings': 218.0},
    {'month': 'Dec', 'production': 654.0, 'savings': 204.0},
    {'month': 'Jan', 'production': 876.0, 'savings': 268.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header matching Dashboard/Monitoring/Alerts screens
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
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 24,
              left: 24,
              right: 24,
              bottom: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                  Icons.description_outlined,
                                  size: 14,
                                  color: AppTheme.emeraldGreen,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'VALUE REPORTING',
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
                            'Performance Reports',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Executive summaries & insights',
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
                        Icons.insert_drive_file_outlined,
                        color:  Colors.amber.shade400,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Report Type Selector
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppTheme.bgWhite,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    children: [
                      _buildReportTypeButton('performance', 'Performance', Icons.analytics_outlined, AppTheme.primaryBlue),
                      const SizedBox(width: 4),
                      _buildReportTypeButton('financial', 'Financial', Icons.attach_money, AppTheme.emeraldGreen),
                      const SizedBox(width: 4),
                      _buildReportTypeButton('esg', 'ESG', Icons.energy_savings_leaf, Colors.green),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                if (_reportType == 'performance') _buildPerformanceView(),
                if (_reportType == 'financial') _buildFinancialView(),
                if (_reportType == 'esg') _buildESGView(),

                const SizedBox(height: 24),
                // Footer Info
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFF8FAFC), Color(0xFFEFF6FF)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFDBEAFE)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined, color: AppTheme.primaryBlue, size: 20),
                          const SizedBox(width: 8),
                          const Text(
                            'Automated Reporting',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Reports are generated monthly and designed to be investor-ready, audit-compliant, and executive-friendly.",
                        style: TextStyle(fontSize: 13, color: Color(0xFF334155), height: 1.5),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Color(0xFFDBEAFE))),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Next report:', style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                            const Text('Feb 1, 2026', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.w600, fontSize: 13)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportTypeButton(String type, String label, IconData icon, Color activeColor) {
    final isActive = _reportType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _reportType = type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? activeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ]
                : null,
          ),
          child: Column(
            children: [
              Icon(icon, size: 18, color: isActive ? Colors.white : AppTheme.textLight),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive ? Colors.white : AppTheme.textLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPerformanceView() {
    return Column(
      children: [
        // Monthly Summary Card
        _buildHeroSummaryCard(
          title: 'January 2026 Summary',
          value: '876 kWh',
          icon: Icons.trending_up,
          color: AppTheme.primaryBlue,
          metrics: [
            {'label': 'vs Expected', 'value': '+8.2%'},
            {'label': 'vs Last Month', 'value': '+14.2%'},
            {'label': 'Efficiency', 'value': '94.2%'},
          ],
        ),
        const SizedBox(height: 24),
        // KPI List
        _buildKPIContainer(
          title: 'Key Performance Indicators',
          kpis: [
            {'label': 'System Availability', 'sub': 'Operational uptime', 'value': '99.8%', 'valueSub': 'Industry leading', 'valColor': AppTheme.emeraldGreen},
            {'label': 'AI Prediction Accuracy', 'sub': 'Forecast precision', 'value': '94.2%', 'valueSub': '+2.1% improvement', 'valColor': AppTheme.primaryBlue},
            {'label': 'Capacity Factor', 'sub': 'Actual vs rated output', 'value': '18.6%', 'valueSub': 'vs 15.2% avg', 'valColor': AppTheme.textDark},
            {'label': 'Anomalies Detected', 'sub': 'Issues prevented', 'value': '3', 'valueSub': 'R1,240 saved', 'valColor': AppTheme.primaryBlue},
          ],
        ),
        const SizedBox(height: 24),
        // Chart
        _buildChartCard(
          title: '6-Month Production Trend',
          subtitle: 'Solar generation (kWh)',
          color: AppTheme.primaryBlue,
        ),
        const SizedBox(height: 24),
        _buildDownloadButton('Performance Report (PDF)', AppTheme.primaryBlue),
      ],
    );
  }

  Widget _buildFinancialView() {
    return Column(
      children: [
        // Revenue Summary Card
        _buildHeroSummaryCard(
          title: 'January 2026 Revenue',
          value: 'R268',
          icon: Icons.attach_money,
          color: AppTheme.emeraldGreen,
          metrics: [
            {'label': 'vs Last Month', 'value': '+19.3%'},
            {'label': 'AI Bonus', 'value': '+R34'},
            {'label': 'Daily Avg', 'value': 'R8.64'},
          ],
        ),
        const SizedBox(height: 24),
        // ROI Progress
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.bgWhite,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ROI Progress', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Investment Recovery', style: TextStyle(fontSize: 13, color: AppTheme.textLight)),
                  const Text('42.4%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 0.424,
                  minHeight: 8,
                  backgroundColor: const Color(0xFFF1F5F9),
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.emeraldGreen),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Color(0xFFE2E8F0)),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2.5,
                children: [
                  _buildStatLabel('Total Invested', 'R18,500', AppTheme.textDark),
                  _buildStatLabel('Recovered', 'R7,842', AppTheme.emeraldGreen),
                  _buildStatLabel('Standard Payback', '6.8 years', AppTheme.textDark),
                  _buildStatLabel('With Ohwr', '5.2 years', AppTheme.emeraldGreen),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Savings Breakdown
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.bgWhite,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Savings Breakdown (YTD)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
              const SizedBox(height: 16),
              _buildBreakdownItem('Energy Savings', 'Grid avoidance', 'R6,656', Icons.attach_money, AppTheme.emeraldGreen, const Color(0xFFECFDF5)),
              const SizedBox(height: 12),
              _buildBreakdownItem('AI Optimization', 'Intelligent boost', '+R1,186', Icons.trending_up, AppTheme.primaryBlue, const Color(0xFFEFF6FF)),
              const SizedBox(height: 12),
              _buildBreakdownItem('Damage Prevention', 'Early detection', 'R1,240', Icons.security_outlined, Colors.purple, const Color(0xFFF3E8FF)),
              const SizedBox(height: 20),
              const Divider(color: Color(0xFFE2E8F0)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Value', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.textMedium)),
                  const Text('R9,082', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.textDark)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildDownloadButton('Financial Report (PDF)', AppTheme.emeraldGreen),
      ],
    );
  }

  Widget _buildESGView() {
    return Column(
      children: [
        // Environmental Impact Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF22C55E), Color(0xFF16A34A)],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF22C55E).withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('CO₂ Avoided (YTD)', style: TextStyle(color: Color(0xFFDCFCE7), fontSize: 13, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 4),
                      const Text('6.2 tons', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16)),
                    child: const Icon(Icons.eco, color: Colors.white, size: 28),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Equivalent to planting 283 trees or removing 1.3 cars from the road for a year',
                style: TextStyle(color: Color(0xFFF0FDF4), fontSize: 13, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Sustainability Metrics
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.bgWhite,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sustainability Impact', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
              const SizedBox(height: 20),
              _buildSustainabilityMetric('Clean Energy Generated', '4,880 kWh', '100% renewable, zero emissions', null),
              const SizedBox(height: 16),
              _buildSustainabilityMetric('Grid Dependency Reduction', '78.4%', 'Maximizing self-sufficiency', AppTheme.emeraldGreen),
              const SizedBox(height: 16),
              _buildSustainabilityMetric('System Lifespan Extension', '+2.4 years', 'vs industry average (AI optimization)', Colors.purple),
              const SizedBox(height: 16),
              _buildSustainabilityMetric('E-Waste Reduction', '68 kg', 'Battery & component preservation', AppTheme.primaryBlue),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Highlights
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFF0FDF4), Colors.white]),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFBBF7D0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.emoji_events_outlined, color: Colors.green.shade600, size: 20),
                  const SizedBox(width: 8),
                  const Text('ESG Highlights', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
                ],
              ),
              const SizedBox(height: 16),
              _buildESGHighlightItem('Carbon Neutral Operations', 'All energy from renewable sources'),
              const SizedBox(height: 12),
              _buildESGHighlightItem('Responsible Resource Use', 'AI extends equipment lifespan'),
              const SizedBox(height: 12),
              _buildESGHighlightItem('Energy Independence', 'Reducing fossil fuel dependency'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildDownloadButton('ESG Report (PDF)', Colors.green.shade600),
      ],
    );
  }

  Widget _buildHeroSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required List<Map<String, String>> metrics,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [color, color.withValues(alpha: 0.8)]),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700)),
                ],
              ),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16)),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: metrics.map((m) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(m['label']!, style: const TextStyle(color: Colors.white60, fontSize: 10)),
                  const SizedBox(height: 2),
                  Text(m['value']!, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildKPIContainer({required String title, required List<Map<String, dynamic>> kpis}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.bgWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
          const SizedBox(height: 12),
          ...kpis.asMap().entries.map((entry) {
            final idx = entry.key;
            final kpi = entry.value;
            final isLast = idx == kpis.length - 1;
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: isLast ? null : const Border(bottom: BorderSide(color: Color(0xFFF1F5F9))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(kpi['label'], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppTheme.textDark)),
                      Text(kpi['sub'], style: const TextStyle(fontSize: 11, color: AppTheme.textLight)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(kpi['value'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: kpi['valColor'])),
                      Text(kpi['valueSub'], style: const TextStyle(fontSize: 10, color: AppTheme.textLight)),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildChartCard({required String title, required String subtitle, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.bgWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: AppTheme.textLight)),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                barGroups: _monthlyPerformanceData.asMap().entries.map((entry) {
                  return BarChartGroupData(
                    x: entry.key,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value['production'],
                        color: color,
                        width: 16,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= 0 && value.toInt() < _monthlyPerformanceData.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(_monthlyPerformanceData[value.toInt()]['month'], style: const TextStyle(color: AppTheme.textLight, fontSize: 10)),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 200, getDrawingHorizontalLine: (value) => const FlLine(color: Color(0xFFF1F5F9), strokeWidth: 1)),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadButton(String label, Color color) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.download_outlined, size: 20, color: Colors.white),
        label: Text('Download $label'),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          shadowColor: color.withValues(alpha: 0.4),
        ),
      ),
    );
  }

  Widget _buildStatLabel(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.textLight)),
        const SizedBox(height: 2),
        Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: valueColor)),
      ],
    );
  }

  Widget _buildBreakdownItem(String title, String sub, String value, IconData icon, Color iconColor, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppTheme.textDark)),
                Text(sub, style: const TextStyle(fontSize: 11, color: AppTheme.textLight)),
              ],
            ),
          ],
        ),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: iconColor)),
      ],
    );
  }

  Widget _buildSustainabilityMetric(String label, String value, String sub, Color? valColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 13, color: AppTheme.textMedium)),
            Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: valColor ?? AppTheme.textDark)),
          ],
        ),
        const SizedBox(height: 2),
        Text(sub, style: const TextStyle(fontSize: 11, color: AppTheme.textLight)),
      ],
    );
  }

  Widget _buildESGHighlightItem(String title, String sub) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF16A34A), size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
              Text(sub, style: const TextStyle(fontSize: 11, color: AppTheme.textLight)),
            ],
          ),
        ),
      ],
    );
  }
}
