import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final Widget? badge;
  final Color? backgroundColor;
  final bool showGradient;

  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.badge,
    this.backgroundColor,
    this.showGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: showGradient
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  backgroundColor ?? const Color(0xFF1E293B),
                  (backgroundColor ?? const Color(0xFF1E293B)).withValues(alpha: 0.8),
                ],
              )
            : null,
        color: !showGradient ? backgroundColor : null,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
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
                    if (leadingIcon != null) ...[
                      Row(
                        children: [
                          Icon(
                            leadingIcon,
                            color: Colors.blue.shade400,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'AI-POWERED INTELLIGENCE',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                              color: Colors.blue.shade400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (badge != null) badge!,
            ],
          ),
        ],
      ),
    );
  }
}

