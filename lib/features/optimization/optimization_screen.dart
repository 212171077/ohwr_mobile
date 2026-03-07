import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class OptimizationScreen extends StatefulWidget {
  const OptimizationScreen({super.key});

  @override
  State<OptimizationScreen> createState() => _OptimizationScreenState();
}

class _OptimizationScreenState extends State<OptimizationScreen> {
  String _activeMode = 'balanced';

  @override
  Widget build(BuildContext context) {
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
                                  'AI-POWERED OPTIMIZATION',
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
                            'AI Optimization',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Intelligent energy management working for you',
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
                        Icons.auto_fix_high,
                        color: Colors.amber.shade400,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Active Optimization Mode Card (using AI Insight style)
                _buildActiveModeCard(),
                
                const SizedBox(height: 24),
                
                // Available Modes
                _buildSectionTitle('AVAILABLE MODES'),
                const SizedBox(height: 16),
                _buildModeButton(
                  id: 'balanced',
                  title: 'Balanced Mode',
                  description: 'Optimal balance between savings and system longevity',
                  icon: Icons.track_changes,
                  iconColor: const Color(0xFF059669), // emerald-600
                  iconBg: const Color(0xFFD1FAE5), // emerald-100
                  isActive: _activeMode == 'balanced',
                ),
                const SizedBox(height: 12),
                _buildModeButton(
                  id: 'savings',
                  title: 'Maximum Savings',
                  description: 'Prioritize cost reduction, may accelerate battery wear',
                  icon: Icons.trending_up,
                  iconColor: const Color(0xFF2563EB), // blue-600
                  iconBg: const Color(0xFFDBEAFE), // blue-100
                  isActive: _activeMode == 'savings',
                ),
                const SizedBox(height: 12),
                _buildModeButton(
                  id: 'longevity',
                  title: 'Longevity Mode',
                  description: 'Extend system lifespan with gentler charge cycles',
                  icon: Icons.shield,
                  iconColor: const Color(0xFF9333EA), // purple-600
                  iconBg: const Color(0xFFF3E8FF), // purple-100
                  isActive: _activeMode == 'longevity',
                ),
                
                const SizedBox(height: 24),
                
                // Recent AI Actions
                _buildSectionTitle('RECENT AI ACTIONS'),
                const SizedBox(height: 16),
                _buildRecentActionsList(),
                
                const SizedBox(height: 24),
                
                // How It Works
                _buildHowItWorks(),
                
                const SizedBox(height: 24),
                
                // Stats Summary
                _buildStatsSummary(),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppTheme.textLight,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildActiveModeCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF10B981), Color(0xFF059669)], // emerald-500 to 600
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.gps_fixed, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Active Optimization Mode',
                        style: TextStyle(color: Color(0xFFD1FAE5), fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Balanced Optimization',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.check_circle, color: Color(0xFFA7F3D0), size: 28),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                _buildActiveModeItem(
                  icon: Icons.trending_up,
                  title: 'Optimizing for cost savings',
                  subtitle: 'Maximizing self-consumption and reducing grid dependency',
                ),
                const SizedBox(height: 12),
                _buildActiveModeItem(
                  icon: Icons.shield,
                  title: 'Protecting system lifespan',
                  subtitle: 'Intelligent charge/discharge cycles to preserve battery health',
                ),
                const SizedBox(height: 12),
                _buildActiveModeItem(
                  icon: Icons.bolt,
                  title: 'Monitoring power quality',
                  subtitle: 'Real-time analysis preventing equipment damage',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveModeItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white, size: 18),
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
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.8)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildModeButton({
    required String id,
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => setState(() => _activeMode = id),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.bgWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? AppTheme.emeraldGreen : const Color(0xFFE2E8F0),
            width: isActive ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textDark,
                        ),
                      ),
                      Row(
                        children: [
                          if (isActive)
                            const Icon(Icons.check_circle, color: AppTheme.emeraldGreen, size: 12),
                          if (isActive) const SizedBox(width: 4),
                          Text(
                            isActive ? 'Active' : 'Available',
                            style: TextStyle(
                              fontSize: 12,
                              color: isActive ? AppTheme.emeraldGreen : AppTheme.textLight,
                              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (!isActive) const Icon(Icons.chevron_right, color: Color(0xFF94A3B8), size: 20),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 52, top: 4),
              child: Text(
                description,
                style: const TextStyle(fontSize: 12, color: AppTheme.textMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActionsList() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.bgWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          _buildActionItem(
            icon: Icons.battery_std,
            iconColor: const Color(0xFF16A34A), // green-600
            iconBg: const Color(0xFFDCFCE7), // green-100
            title: 'Battery charge limited to 85%',
            description: 'Low solar forecast tomorrow — preserving battery cycles',
            time: '2 hours ago',
            impact: '+R12 estimated savings',
            impactColor: AppTheme.emeraldGreen,
          ),
          const Divider(height: 1, color: Color(0xFFE2E8F0), indent: 64),
          _buildActionItem(
            icon: Icons.bolt,
            iconColor: const Color(0xFF2563EB),
            iconBg: const Color(0xFFDBEAFE),
            title: 'Increased self-consumption rate',
            description: 'Grid electricity price spike detected — storing more energy',
            time: '5 hours ago',
            impact: '+R28 estimated savings',
            impactColor: AppTheme.emeraldGreen,
          ),
          const Divider(height: 1, color: Color(0xFFE2E8F0), indent: 64),
          _buildActionItem(
            icon: Icons.shield,
            iconColor: const Color(0xFF9333EA),
            iconBg: const Color(0xFFF3E8FF),
            title: 'Discharge depth reduced',
            description: 'Battery health optimization — extending lifespan by 180 days',
            time: 'Yesterday',
            impact: '+240 cycles preserved',
            impactColor: const Color(0xFF9333EA),
          ),
          const Divider(height: 1, color: Color(0xFFE2E8F0), indent: 64),
          _buildActionItem(
            icon: Icons.trending_up,
            iconColor: const Color(0xFFD97706),
            iconBg: const Color(0xFFFEF3C7),
            title: 'Peak shaving activated',
            description: 'Grid demand charge threshold approaching — using stored energy',
            time: '2 days ago',
            impact: '+R145 estimated savings',
            impactColor: AppTheme.emeraldGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String description,
    required String time,
    required String impact,
    required Color impactColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: AppTheme.textMedium),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 12, color: AppTheme.textLight),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 11, color: AppTheme.textLight),
                    ),
                    const SizedBox(width: 8),
                    const Text('•', style: TextStyle(color: Color(0xFFCBD5E1))),
                    const SizedBox(width: 8),
                    Text(
                      impact,
                      style: TextStyle(
                        fontSize: 11,
                        color: impactColor,
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
    );
  }

  Widget _buildHowItWorks() {
    return Container(
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.psychology, color: AppTheme.primaryBlue, size: 20),
              SizedBox(width: 8),
              Text(
                'How AI Optimization Works',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            "Ohwr's AI continuously monitors your system performance, weather forecasts, grid pricing, and battery health metrics.\n\n"
            "Based on this data, the system automatically adjusts charge rates, discharge depth, and energy distribution to maximize your savings while protecting your equipment.\n\n"
            "All optimizations happen automatically in the background — no manual intervention required.",
            style: TextStyle(fontSize: 13, color: AppTheme.textMedium, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSummary() {
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
          const Text(
            'Optimization Impact (This Month)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 2.5,
            children: [
              _buildStatBox('R342', 'Additional Savings', AppTheme.emeraldGreen),
              _buildStatBox('+420', 'Battery Cycles Saved', Colors.purple),
              _buildStatBox('127', 'AI Actions Taken', AppTheme.primaryBlue),
              _buildStatBox('98.4%', 'Optimization Uptime', AppTheme.textDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox(String value, String label, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: AppTheme.textLight),
        ),
      ],
    );
  }
}
