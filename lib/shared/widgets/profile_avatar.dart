import 'package:flutter/material.dart';
import '../../features/profile/profile_screen.dart';
import '../../core/theme/app_theme.dart';

class ProfileAvatar extends StatelessWidget {
  final VoidCallback onLogout;
  final double radius;

  const ProfileAvatar({
    super.key,
    required this.onLogout,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(onLogout: onLogout),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white30),
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: AppTheme.primaryBlue,
          child: Icon(Icons.person, size: radius * 1.1, color: Colors.white),
        ),
      ),
    );
  }
}
