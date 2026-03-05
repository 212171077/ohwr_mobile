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
  final bool compact;

  const MetricCard({
    super.key,
    required this.label,
    required this.value,
    this.unit,
    this.icon,
    this.iconColor,
    this.variant = MetricVariant.default_,
    this.trend,
    this.compact = false,
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
    final double cardHeight = compact ? 95 : 190;

    final double valueFont = 32;
    final double unitFont = 18;
    final double spaceBetween = 12;

    return SizedBox(
      height: cardHeight,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _backgroundColor,
          border: Border.all(color: _borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Label + Icon
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
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

            SizedBox(height: spaceBetween),

            /// Value row
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Flexible(
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: valueFont,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textDark,
                    ),
                  ),
                ),
                if (unit != null) ...[
                  const SizedBox(width: 6),
                  Text(
                    unit!,
                    style: TextStyle(
                      fontSize: unitFont,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textLight,
                    ),
                  ),
                ],
              ],
            ),

            /// Trend indicator
            if (trend != null) ...[
              const SizedBox(height: 6),
              _TrendIndicator(
                value: trend!.value,
                isPositive: trend!.isPositive,
                compact: compact,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TrendIndicator extends StatelessWidget {
  final double value;
  final bool isPositive;
  final bool compact;

  const _TrendIndicator({
    required this.value,
    required this.isPositive,
    required this.compact,
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

        /// Percentage
        Flexible(
          child: Text(
            '$arrow ${value.abs()}%',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ),

        const SizedBox(width: 6),

        /// Description
        Flexible(
          child: Text(
            'vs last period',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppTheme.textLight,
            ),
          ),
        ),
      ],
    );
  }
}