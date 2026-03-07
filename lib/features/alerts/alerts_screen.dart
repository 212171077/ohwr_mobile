import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  String _filterType = 'all';

  final List<Map<String, dynamic>> _alerts = [
    {
      'severity': 'critical',
      'title': 'Power Quality Anomaly Detected',
      'description': 'Voltage fluctuation outside safe operating range detected in grid supply.',
      'timestamp': '45min ago',
      'whyMatters': 'Unstable voltage can damage inverter components and reduce system lifespan by up to 3 years.',
      'impact': 'R12,400 equipment risk',
    },
    {
      'severity': 'critical',
      'title': 'Significant Underperformance',
      'description': 'Northwest panel array output is 18% below expected. Possible panel soiling or shading.',
      'timestamp': '2h ago',
      'whyMatters': 'Each day of underperformance costs R18 in lost revenue and delays your ROI timeline.',
      'impact': 'R540/month revenue loss',
    },
    {
      'severity': 'warning',
      'title': 'Battery Discharge Depth Alert',
      'description': 'Battery discharged below optimal 80% threshold twice this week.',
      'timestamp': '4h ago',
      'whyMatters': 'Deep discharges accelerate battery degradation, potentially reducing lifespan by 6-12 months.',
      'impact': '240 cycles at risk',
    },
    {
      'severity': 'warning',
      'title': 'Inverter Temperature Elevated',
      'description': 'Inverter operating temperature reached 68°C. Within safe limits but elevated.',
      'timestamp': '1d ago',
      'whyMatters': 'Sustained high temps reduce inverter efficiency and can shorten equipment life.',
      'impact': '2-3% efficiency loss',
    },
    {
      'severity': 'info',
      'title': 'AI Optimization Successful',
      'description': 'Battery charge cycle adjusted based on tomorrow\'s weather forecast.',
      'timestamp': '3h ago',
      'whyMatters': 'Proactive adjustments maximize savings and extend battery health.',
      'impact': '+R12 estimated savings',
    },
    {
      'severity': 'info',
      'title': 'Peak Production Achieved',
      'description': 'Your system reached 98% of maximum rated capacity today at 12:45 PM.',
      'timestamp': '6h ago',
      'whyMatters': 'High-efficiency days validate your system is properly maintained and optimized.',
      'impact': 'On track for target ROI',
    },
    {
      'severity': 'info',
      'title': 'Monthly Report Available',
      'description': 'Your January performance summary is ready to view.',
      'timestamp': '2d ago',
      'whyMatters': 'Regular reporting helps track progress toward your energy independence goals.',
      'impact': 'Review insights',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final criticalAlerts = _alerts.where((a) => a['severity'] == 'critical').toList();
    final warningAlerts = _alerts.where((a) => a['severity'] == 'warning').toList();
    final infoAlerts = _alerts.where((a) => a['severity'] == 'info').toList();

    final filteredAlerts = _filterType == 'all'
        ? _alerts
        : _alerts.where((a) => a['severity'] == _filterType).toList();

    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      body: ListView(
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
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16,
              left: 24,
              right: 24,
              bottom: 32,
            ),
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
                                  Icons.shield_outlined,
                                  size: 14,
                                  color: AppTheme.emeraldGreen,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'ANOMALY DETECTION',
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
                            'Alerts & Monitoring',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'AI-powered issue detection & insights',
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
                        color: Colors.blue.shade400.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Alert Summary Banner
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Alert Summary',
                            style: TextStyle(
                              color: Color(0xFFE2E8F0),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${_alerts.length} total',
                            style: const TextStyle(
                              color: Color(0xFFCBD5E1),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _buildSummaryItem('Critical', criticalAlerts.length.toString(), const Color(0xFFEF4444)),
                          const SizedBox(width: 8),
                          _buildSummaryItem('Warning', warningAlerts.length.toString(), const Color(0xFFF59E0B)),
                          const SizedBox(width: 8),
                          _buildSummaryItem('Info', infoAlerts.length.toString(), const Color(0xFF3B82F6)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Filter Tabs
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      _buildFilterTab('all', 'All (${_alerts.length})'),
                      _buildFilterTab('critical', 'Critical (${criticalAlerts.length})'),
                      _buildFilterTab('warning', 'Warnings (${warningAlerts.length})'),
                      _buildFilterTab('info', 'Info (${infoAlerts.length})'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Critical Section
                if (_filterType == 'all' || _filterType == 'critical') ...[
                  if (criticalAlerts.isNotEmpty) ...[
                    _buildSectionHeader('Critical Issues', Icons.cancel_outlined, const Color(0xFFDC2626), 'Immediate attention required', const Color(0xFFFEE2E2)),
                    const SizedBox(height: 12),
                    ...criticalAlerts.map((a) => _AlertItemCard(alert: a)).toList(),
                    const SizedBox(height: 24),
                  ],
                ],

                // Warning Section
                if (_filterType == 'all' || _filterType == 'warning') ...[
                  if (warningAlerts.isNotEmpty) ...[
                    _buildSectionHeader('Warnings', Icons.warning_amber_rounded, const Color(0xFFD97706), 'Monitor closely', const Color(0xFFFEF3C7)),
                    const SizedBox(height: 12),
                    ...warningAlerts.map((a) => _AlertItemCard(alert: a)).toList(),
                    const SizedBox(height: 24),
                  ],
                ],

                // Info Section
                if (_filterType == 'all' || _filterType == 'info') ...[
                  if (infoAlerts.isNotEmpty) ...[
                    _buildSectionHeader('Informational', Icons.info_outline, const Color(0xFF2563EB), 'FYI', const Color(0xFFDBEAFE)),
                    const SizedBox(height: 12),
                    ...infoAlerts.map((a) => _AlertItemCard(alert: a)).toList(),
                    const SizedBox(height: 24),
                  ],
                ],

                if (filteredAlerts.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48),
                      child: Column(
                        children: [
                          Icon(Icons.notifications_none, size: 48, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          Text('No alerts in this category', style: TextStyle(color: Colors.grey.shade600)),
                        ],
                      ),
                    ),
                  ),

                // AI Anomaly Detection Info Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFEFF6FF), Color(0xFFF8FAFC)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFBFDBFE)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.shield_outlined, color: Color(0xFF2563EB), size: 20),
                          const SizedBox(width: 8),
                          const Text(
                            'AI Anomaly Detection',
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
                        "Ohwr's AI continuously monitors 40+ system parameters, comparing them against expected performance patterns to detect issues before they become costly problems.",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF334155),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Color(0xFFDBEAFE))),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('94.2%', style: TextStyle(color: Color(0xFF1E3A8A), fontWeight: FontWeight.w600, fontSize: 15)),
                                  const Text('Detection Accuracy', style: TextStyle(color: Color(0xFF64748B), fontSize: 11)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('2.4 hrs', style: TextStyle(color: Color(0xFF1E3A8A), fontWeight: FontWeight.w600, fontSize: 15)),
                                  const Text('Avg Response Time', style: TextStyle(color: Color(0xFF64748B), fontSize: 11)),
                                ],
                              ),
                            ),
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

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: color.withValues(alpha: 0.9),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTab(String type, String label) {
    final isActive = _filterType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _filterType = type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? const Color(0xFF0F172A) : const Color(0xFF64748B),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, Color color, String badge, Color badgeBg) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: badgeBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            badge,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _AlertItemCard extends StatelessWidget {
  final Map<String, dynamic> alert;

  const _AlertItemCard({required this.alert});

  @override
  Widget build(BuildContext context) {
    final severity = alert['severity'] as String;
    final isCritical = severity == 'critical';
    final isWarning = severity == 'warning';

    // Matching AlertItem.tsx severityConfig
    final Color primaryColor = isCritical
        ? const Color(0xFFDC2626) // text-red-600
        : isWarning
            ? const Color(0xFFD97706) // text-amber-600
            : const Color(0xFF2563EB); // text-blue-600

    final Color bgColor = isCritical
        ? const Color(0xFFFEF2F2) // bg-red-50
        : isWarning
            ? const Color(0xFFFFFBEB) // bg-amber-50
            : const Color(0xFFEFF6FF); // bg-blue-50

    final Color borderColor = isCritical
        ? const Color(0xFFFECACA) // border-red-200
        : isWarning
            ? const Color(0xFFFDE68A) // border-amber-200
            : const Color(0xFFBFDBFE); // border-blue-200

    final Color iconBg = isCritical
        ? const Color(0xFFFEE2E2) // bg-red-100
        : isWarning
            ? const Color(0xFFFEF3C7) // bg-amber-100
            : const Color(0xFFDBEAFE); // bg-blue-100

    final IconData icon = isCritical
        ? Icons.error_outline // AlertCircle
        : isWarning
            ? Icons.warning_amber_rounded // AlertTriangle
            : Icons.info_outline; // Info

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCritical ? const Color(0xFFFECACA) : const Color(0xFFE2E8F0),
          width: isCritical ? 2 : 1,
        ),
        boxShadow: isCritical
            ? [
                BoxShadow(
                  color: const Color(0xFFEF4444).withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Main Alert Content (AlertItem.tsx style)
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: iconBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: primaryColor, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              alert['title'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            alert['timestamp'],
                            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        alert['description'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF475569),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Formal Insight Section (from AlertsScreen.tsx)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: bgColor,
              border: Border(top: BorderSide(color: borderColor.withValues(alpha: 0.5))),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, size: 16, color: primaryColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Why this matters:',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: primaryColor.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        alert['whyMatters'],
                        style: TextStyle(
                          fontSize: 12,
                          color: primaryColor.withValues(alpha: 0.7),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        alert['impact'],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ],
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
