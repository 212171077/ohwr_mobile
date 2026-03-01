import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/models/navigation_tab.dart';

class BottomNavigation extends StatelessWidget {
  final NavigationTab activeTab;
  final ValueChanged<NavigationTab> onTabChanged;
  final bool showAlertBadge;

  const BottomNavigation({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
    this.showAlertBadge = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: activeTab.index,
        onTap: (index) => onTabChanged(NavigationTab.values[index]),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppTheme.bgWhite,
        elevation: 0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24),
            activeIcon: Icon(Icons.home, size: 24),
            label: 'Overview',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_outlined, size: 24),
            activeIcon: Icon(Icons.trending_up, size: 24),
            label: 'Monitor',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_outlined, size: 24),
            activeIcon: Icon(Icons.auto_awesome, size: 24),
            label: 'Optimize',
          ),
          BottomNavigationBarItem(
            icon: _AlertIcon(
              isActive: activeTab == NavigationTab.alerts,
              showBadge: showAlertBadge,
            ),
            label: NavigationTab.alerts.label,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined, size: 24),
            activeIcon: Icon(Icons.description, size: 24),
            label: 'Reports',
          ),
        ],
        selectedItemColor: AppTheme.primaryBlue,
        unselectedItemColor: const Color(0xFF94A3B8),
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _AlertIcon extends StatelessWidget {
  final bool isActive;
  final bool showBadge;

  const _AlertIcon({
    required this.isActive,
    required this.showBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          isActive ? Icons.notifications : Icons.notifications_outlined,
          size: 24,
        ),
        if (showBadge)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: AppTheme.redAlert,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

