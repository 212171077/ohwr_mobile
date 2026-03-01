import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class GaugeIndicator extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final double percentage;
  final String status;

  const GaugeIndicator({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.percentage,
    required this.status,
  });

  Color get _gaugeColor {
    switch (status) {
      case 'optimal':
        return AppTheme.emeraldGreen;
      case 'warning':
        return AppTheme.warningOrange;
      case 'critical':
        return AppTheme.criticalRed;
      default:
        return AppTheme.primaryBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.bgWhite,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.textLight,
            ),
          ),
          const SizedBox(height: 12),
          // Gauge visualization
          Container(
            height: 12,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                Container(
                  height: 12,
                  width: (percentage / 100) * double.infinity,
                  decoration: BoxDecoration(
                    color: _gaugeColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textDark,
                    ),
                  ),
                  Text(
                    unit,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textLight,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _gaugeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _gaugeColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

