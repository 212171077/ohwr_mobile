import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

enum AlertStatus { healthy, warning, alert }

class StatusBadge extends StatelessWidget {
  final AlertStatus status;
  final bool animate;

  const StatusBadge({
    super.key,
    required this.status,
    this.animate = true,
  });

  Color get _dotColor {
    switch (status) {
      case AlertStatus.healthy:
        return AppTheme.healthyGreen;
      case AlertStatus.warning:
        return AppTheme.warningOrange;
      case AlertStatus.alert:
        return AppTheme.criticalRed;
    }
  }

  Color get _bgColor {
    switch (status) {
      case AlertStatus.healthy:
        return const Color(0xFFD1FAE5);
      case AlertStatus.warning:
        return const Color(0xFFFEF3C7);
      case AlertStatus.alert:
        return const Color(0xFFFEE2E2);
    }
  }

  Color get _textColor {
    switch (status) {
      case AlertStatus.healthy:
        return const Color(0xFF047857);
      case AlertStatus.warning:
        return const Color(0xFFB45309);
      case AlertStatus.alert:
        return const Color(0xFFDC2626);
    }
  }

  String get _label {
    switch (status) {
      case AlertStatus.healthy:
        return 'Healthy';
      case AlertStatus.warning:
        return 'Warning';
      case AlertStatus.alert:
        return 'Alert';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (animate)
            _AnimatedDot(color: _dotColor)
          else
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: _dotColor,
                shape: BoxShape.circle,
              ),
            ),
          const SizedBox(width: 8),
          Text(
            _label,
            style: TextStyle(
              color: _textColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedDot extends StatefulWidget {
  final Color color;

  const _AnimatedDot({required this.color});

  @override
  State<_AnimatedDot> createState() => __AnimatedDotState();
}

class __AnimatedDotState extends State<_AnimatedDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.5, end: 1.0).animate(_controller),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

