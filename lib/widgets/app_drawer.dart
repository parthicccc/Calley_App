import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';
import '../core/services/storage_service.dart';
import '../screens/language_selection/language_selection_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                final username = snapshot.data?.getString('username') ?? 'User';
                final email = snapshot.data?.getString('email') ?? '';
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 36,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.rocket_launch_outlined,
            title: 'Getting Started',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.sync,
            title: 'Sync Data',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.emoji_events_outlined,
            title: 'Gamification',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.description_outlined,
            title: 'Send Logs',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.settings_outlined,
            title: 'Settings',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.help_outline,
            title: 'Help?',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.cancel_outlined,
            title: 'Cancel Subscription',
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'App Info',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.info_outline,
            title: 'About Us',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
          ),
          _buildDrawerItem(
            context,
            icon: Icons.system_update_outlined,
            title: AppStrings.appVersion,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.share_outlined,
            title: 'Share App',
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () => _handleLogout(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.pop(context),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    await StorageService.clearAll();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const LanguageSelectionScreen(),
        ),
        (route) => false,
      );
    }
  }
}