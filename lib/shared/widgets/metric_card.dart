import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

enum MetricVariant { default_, success, warning }

class MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String? unit;
  final IconData? icon;
  final Color? iconColor;
  final MetricVariant variant;
  final ({double value, bool isPositive})? trend;

  const MetricCard({
    super.key,
    required this.label,
    required this.value,
    this.unit,
    this.icon,
    this.iconColor,
    this.variant = MetricVariant.default_,
    this.trend,
  });

  Color get _backgroundColor {
    switch (variant) {
      case MetricVariant.default_:
        return AppTheme.bgWhite;
      case MetricVariant.success:
        return const Color(0xFFF0FDF4);
      case MetricVariant.warning:
        return const Color(0xFFFFFBEB);
    }
  }

  Color get _borderColor {
    switch (variant) {
      case MetricVariant.default_:
        return const Color(0xFFE2E8F0);
      case MetricVariant.success:
        return const Color(0xFFA7F3D0);
      case MetricVariant.warning:
        return const Color(0xFFFDE68A);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _backgroundColor,
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textLight,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor ?? AppTheme.textLight,
                  size: 20,
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark,
                ),
              ),
              if (unit != null) ...[
                const SizedBox(width: 8),
                Text(
                  unit!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.textLight,
                  ),
                ),
              ],
            ],
          ),
          if (trend != null) ...[
            const SizedBox(height: 8),
            _TrendIndicator(
              value: trend!.value,
              isPositive: trend!.isPositive,
            ),
          ],
        ],
      ),
    );
  }
}

class _TrendIndicator extends StatelessWidget {
  final double value;
  final bool isPositive;

  const _TrendIndicator({
    required this.value,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPositive ? AppTheme.healthyGreen : AppTheme.criticalRed;
    final arrow = isPositive ? '↑' : '↓';

    return Row(
      children: [
        Icon(
          isPositive ? Icons.trending_up : Icons.trending_down,
          size: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          '$arrow ${value.abs()}%',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
        const SizedBox(width: 6),
        const Text(
          'vs last period',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.textLight,
          ),
        ),
      ],
    );
  }
}

