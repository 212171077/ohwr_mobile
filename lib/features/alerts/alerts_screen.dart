import 'package:flutter/material.dart';
import '../../shared/widgets/screen_header.dart';
import '../../core/theme/app_theme.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  String _filterType = 'all';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ScreenHeader(
          title: 'Alerts & Monitoring',
          subtitle: 'AI-powered issue detection & insights',
          leadingIcon: Icons.security,
          backgroundColor: AppTheme.darkSlate,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterChip(
                      label: 'All (7)',
                      isActive: _filterType == 'all',
                      onTap: () => setState(() => _filterType = 'all'),
                    ),
                    const SizedBox(width: 8),
                    _FilterChip(
                      label: 'Critical (2)',
                      isActive: _filterType == 'critical',
                      onTap: () => setState(() => _filterType = 'critical'),
                    ),
                    const SizedBox(width: 8),
                    _FilterChip(
                      label: 'Warnings (2)',
                      isActive: _filterType == 'warning',
                      onTap: () => setState(() => _filterType = 'warning'),
                    ),
                    const SizedBox(width: 8),
                    _FilterChip(
                      label: 'Info (3)',
                      isActive: _filterType == 'info',
                      onTap: () => setState(() => _filterType = 'info'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Alert Items Placeholder
              _AlertItemCard(
                severity: 'critical',
                title: 'Power Quality Anomaly Detected',
                description:
                    'Voltage fluctuation outside safe operating range detected in grid supply.',
                timestamp: '45min ago',
              ),
              const SizedBox(height: 12),
              _AlertItemCard(
                severity: 'warning',
                title: 'Battery Discharge Depth Alert',
                description:
                    'Battery discharged below optimal 80% threshold twice this week.',
                timestamp: '4h ago',
              ),
              const SizedBox(height: 12),
              _AlertItemCard(
                severity: 'info',
                title: 'AI Optimization Successful',
                description:
                    'Battery charge cycle adjusted based on tomorrow\'s weather forecast.',
                timestamp: '3h ago',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      onSelected: (_) => onTap(),
      selected: isActive,
      backgroundColor: AppTheme.bgWhite,
      selectedColor: const Color(0xFFEFF6FF),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: isActive ? AppTheme.primaryBlue : AppTheme.textMedium,
      ),
      side: BorderSide(
        color: isActive ? AppTheme.primaryBlue : const Color(0xFFE2E8F0),
      ),
    );
  }
}

class _AlertItemCard extends StatelessWidget {
  final String severity;
  final String title;
  final String description;
  final String timestamp;

  const _AlertItemCard({
    required this.severity,
    required this.title,
    required this.description,
    required this.timestamp,
  });

  Color get _bgColor {
    switch (severity) {
      case 'critical':
        return const Color(0xFFFEE2E2);
      case 'warning':
        return const Color(0xFFFEF3C7);
      case 'info':
        return const Color(0xFFEFF6FF);
      default:
        return AppTheme.bgWhite;
    }
  }

  Color get _borderColor {
    switch (severity) {
      case 'critical':
        return const Color(0xFFFCA5A5);
      case 'warning':
        return const Color(0xFFFCD34D);
      case 'info':
        return const Color(0xFF93C5FD);
      default:
        return const Color(0xFFE2E8F0);
    }
  }

  IconData get _icon {
    switch (severity) {
      case 'critical':
        return Icons.error_outline;
      case 'warning':
        return Icons.warning_outlined;
      case 'info':
        return Icons.info_outlined;
      default:
        return Icons.info_outlined;
    }
  }

  Color get _iconColor {
    switch (severity) {
      case 'critical':
        return const Color(0xFFDC2626);
      case 'warning':
        return const Color(0xFFD97706);
      case 'info':
        return const Color(0xFF2563EB);
      default:
        return AppTheme.textLight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgColor,
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _icon,
              color: _iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      timestamp,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textMedium,
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

