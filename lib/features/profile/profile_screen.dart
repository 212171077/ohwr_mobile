import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback onLogout;

  const ProfileScreen({super.key, required this.onLogout});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _optimizationPreference = 'balanced';
  bool _notificationsEnabled = true;

  // Mock data - normally sourced from a User Provider or Profile Bloc
  final String _userName = 'John Doe';
  final String _userEmail = 'john.doe@example.com';
  final String _siteName = 'Pretoria Main Site';

  void _handleEditProfile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: const Text('Profile editing will be available in the next update.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSiteDetails() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Site Details', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            _buildDetailRow('Assigned Site', _siteName),
            _buildDetailRow('Location', 'Pretoria, GP'),
            _buildDetailRow('Role', 'System Administrator'),
            _buildDetailRow('System ID', 'OHWR-7742-X'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppTheme.textLight)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.textDark)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _ProfileHeader(
            name: _userName,
            email: _userEmail,
            site: _siteName,
            onEditAvatar: _handleEditProfile,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProfileSection(
                  title: 'Account Settings',
                  children: [
                    _ProfileItem(
                      icon: Icons.person_outline,
                      label: 'Personal Details',
                      onTap: _handleEditProfile,
                    ),
                    const _SectionDivider(),
                    _ProfileItem(
                      icon: Icons.business_outlined,
                      label: 'Organization / Site',
                      subtitle: _siteName,
                      onTap: _showSiteDetails,
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                _ProfileSection(
                  title: 'Preferences',
                  children: [
                    _PreferenceSwitch(
                      icon: Icons.notifications_none_outlined,
                      label: 'Push Notifications',
                      value: _notificationsEnabled,
                      onChanged: (val) => setState(() => _notificationsEnabled = val),
                    ),
                    const _SectionDivider(),
                    _OptimizationSelector(
                      currentMode: _optimizationPreference,
                      onChanged: (val) => setState(() => _optimizationPreference = val),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                _ProfileSection(
                  title: 'Support & Legal',
                  children: [
                    _ProfileItem(
                      icon: Icons.help_outline,
                      label: 'Help Center',
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Connecting to Support...')),
                      ),
                    ),
                    const _SectionDivider(),
                    _ProfileItem(
                      icon: Icons.policy_outlined,
                      label: 'Privacy Policy',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                _LogoutButton(onPressed: widget.onLogout),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String site;
  final VoidCallback onEditAvatar;

  const _ProfileHeader({
    required this.name,
    required this.email,
    required this.site,
    required this.onEditAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey.shade900, AppTheme.primaryBlue.withValues(alpha: 0.8)],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20,
        bottom: 32,
        left: 24,
        right: 24,
      ),
      child: Column(
        children: [
          const Text(
            'User Profile',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 52,
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                child: const CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 48, color: AppTheme.primaryBlue),
                ),
              ),
              InkWell(
                onTap: onEditAvatar,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: AppTheme.emeraldGreen, shape: BoxShape.circle),
                  child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          Text(email, style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 14)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.emeraldGreen.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.emeraldGreen.withValues(alpha: 0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on, size: 14, color: AppTheme.emeraldGreen),
                const SizedBox(width: 4),
                Text(
                  site,
                  style: const TextStyle(color: AppTheme.emeraldGreen, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _ProfileSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppTheme.textLight, letterSpacing: 1.1),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;

  const _ProfileItem({required this.icon, required this.label, this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppTheme.lightSlate, borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, size: 22, color: AppTheme.textDark),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
                    if (subtitle != null)
                      Text(subtitle!, style: const TextStyle(fontSize: 13, color: AppTheme.textLight)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, size: 20, color: Color(0xFFCBD5E1)),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreferenceSwitch extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _PreferenceSwitch({required this.icon, required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppTheme.lightSlate, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, size: 22, color: AppTheme.textDark),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
          ),
          Switch.adaptive(value: value, onChanged: onChanged, activeColor: AppTheme.emeraldGreen),
        ],
      ),
    );
  }
}

class _OptimizationSelector extends StatelessWidget {
  final String currentMode;
  final ValueChanged<String> onChanged;

  const _OptimizationSelector({required this.currentMode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppTheme.lightSlate, borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.bolt, size: 22, color: AppTheme.textDark),
              ),
              const SizedBox(width: 16),
              const Text('Optimization Mode', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildBtn('Cost', 'cost'),
              const SizedBox(width: 8),
              _buildBtn('Balanced', 'balanced'),
              const SizedBox(width: 8),
              _buildBtn('Lifespan', 'lifespan'),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _getDescription(currentMode),
            style: const TextStyle(fontSize: 12, color: AppTheme.textLight, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  String _getDescription(String mode) {
    if (mode == 'cost') return 'Prioritizes energy savings and grid off-peak usage.';
    if (mode == 'lifespan') return 'Prioritizes battery health and equipment longevity.';
    return 'Balances system performance with cost efficiency.';
  }

  Widget _buildBtn(String label, String value) {
    final isSelected = currentMode == value;
    return Expanded(
      child: InkWell(
        onTap: () => onChanged(value),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryBlue : AppTheme.bgLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isSelected ? AppTheme.primaryBlue : const Color(0xFFE2E8F0)),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? Colors.white : AppTheme.textMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();
  @override
  Widget build(BuildContext context) => const Divider(height: 1, indent: 64, color: Color(0xFFF1F5F9));
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _LogoutButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.logout, size: 20),
        label: const Text('Sign Out'),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.redAlert,
          side: const BorderSide(color: AppTheme.redAlert, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}