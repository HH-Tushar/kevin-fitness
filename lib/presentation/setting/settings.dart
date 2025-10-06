import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: const Color(0xFF5A6D6D),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 50,
                            color: Color(0xFFB0BFBF),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: Color(0xFF4A9B9B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My Profile',
                            style: TextStyle(
                              fontFamily: "Outfit",
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'theworkofficial.01@g...',
                            style: TextStyle(
                              fontFamily: "Outfit",
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.5),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontFamily: "Outfit",
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // General Settings Section
                Container(
                  decoration: BoxDecoration(
                    color: customGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'General Settings',
                          style: TextStyle(
                            fontFamily: "Outfit",
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildMenuItem(
                        icon: Icons.bar_chart,
                        title: 'Profile Summary',
                      ),
                      _buildMenuItem(
                        icon: Icons.language,
                        title: 'Language Selection',
                        subtitle: 'English',
                      ),
                      _buildMenuItem(
                        icon: Icons.flash_on,
                        title: 'Manage Subscription',
                      ),
                      _buildMenuItem(
                        icon: Icons.info_outline,
                        title: 'About us',
                      ),
                      _buildMenuItem(
                        icon: Icons.headset_mic_outlined,
                        title: 'Help & Support',
                      ),
                      _buildMenuItem(
                        icon: Icons.shield_outlined,
                        title: 'Privacy Policy',
                      ),
                      _buildMenuItem(
                        icon: Icons.description_outlined,
                        title: 'Terms & Conditions',
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Account Section
                Container(
                  decoration: BoxDecoration(
                    color: customGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Account',
                          style: TextStyle(
                            fontFamily: "Outfit",
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildMenuItem(
                        icon: Icons.delete_outline,
                        title: 'Delete Account',
                      ),
                      _buildMenuItem(
                        icon: Icons.logout,
                        title: 'Log out',
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.7), size: 24),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.white.withOpacity(0.5),
            size: 24,
          ),
        ],
      ),
    );
  }
}
