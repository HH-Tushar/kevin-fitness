import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kenvinorellana/application/auth/auth_controller.dart';
import 'package:kenvinorellana/presentation/auth/view/login_screen.dart';
import '../profile/edit_profile/edit_profile.dart';
import '../subscribe_plan/plan_update.dart';
import '../summery/summery.dart';
import '/common/colors.dart';
import '/common/gaps.dart';
import '/common/navigator.dart';
import '/translation/localization.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../business_pages/about_us.dart';
import '../business_pages/help_support.dart';
import '../business_pages/privacy_policy.dart';
import '../business_pages/terms_condition.dart';
part 'controller.dart';
part 'components/language.dart';
part 'components/alerts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? localImage;
  String? imageUrl;
  void pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        localImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = context.watch();
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.settingTranslation;
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
                        CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.white.withOpacity(0.08),
                          backgroundImage:
                              authController.userProfile?.image != null &&
                                  authController.userProfile!.image.isNotEmpty
                              ? NetworkImage(authController.userProfile!.image)
                              : (localImage != null
                                    ? FileImage(localImage!)
                                    : null),
                          onBackgroundImageError:
                              (authController.userProfile?.image != null &&
                                      authController
                                          .userProfile!
                                          .image
                                          .isNotEmpty) ||
                                  localImage != null
                              ? (exception, stackTrace) {
                                  // Fallback to default icon if network image fails
                                }
                              : null,
                          child:
                              (authController.userProfile?.image == null ||
                                      authController
                                          .userProfile!
                                          .image
                                          .isEmpty) &&
                                  localImage == null
                              ? Icon(
                                  Icons.person,
                                  size: 54,
                                  color: Colors.white.withOpacity(0.7),
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () async => pickImage(),
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
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translator.myProfile,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            authController.getUserEmail ??
                                translator.noEmailAvailable,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => navigateTo(context, UpdateProfile()),
                      child: Container(
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
                        child: Text(
                          translator.edit,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            color: Colors.white,
                            fontSize: 16,
                          ),
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
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          translator.generalSettings,
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
                        title: translator.profileSummary,
                        onTap: () {
                          animatedNavigateTo(context, SummeryView());
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.language,
                        title: translator.languageSelection,
                        subtitle: languageProvider.isEnglish
                            ? "English"
                            : "Spanish",
                        onTap: () => _showLanguageModal(context: context),
                      ),
                      _buildMenuItem(
                        icon: Icons.flash_on,
                        title: translator.manageSubscription,
                        onTap: () =>
                            animatedNavigateTo(context, UpgradePlanScreen()),
                      ),
                      _buildMenuItem(
                        icon: Icons.info_outline,
                        title: translator.aboutUs,
                        onTap: () =>
                            animatedNavigateTo(context, AboutUsScreen()),
                      ),
                      _buildMenuItem(
                        icon: Icons.headset_mic_outlined,
                        title: translator.helpSupport,
                        onTap: () =>
                            animatedNavigateTo(context, HelpAndSupportScreen()),
                      ),
                      _buildMenuItem(
                        icon: Icons.shield_outlined,
                        title: translator.privacyPolicy,
                        onTap: () =>
                            animatedNavigateTo(context, PrivacyPolicyScreen()),
                      ),
                      _buildMenuItem(
                        icon: Icons.description_outlined,
                        title: translator.termsConditions,
                        onTap: () => animatedNavigateTo(
                          context,
                          TermsConditionsScreen(),
                        ),
                      ),
                      vPad5,
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
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          translator.account,
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
                        title: translator.deleteAccount,
                        onTap: () {
                          _showDeleteAccountDialog(
                            cancel: translator.cancel,
                            content: translator.deleteAccountDialogMessage,
                            delete: translator.delete,
                            isDeleting: false,
                            context: context,
                            title: translator.deleteAccountDialogTitle,
                          );
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.logout,
                        title: translator.logOut,
                        // isLast: true,
                        onTap: () {
                          final feedback = _showLogoutDialog(
                            cancel: translator.cancel,
                            content: translator.logoutDialogMessage,
                            logout: translator.logOut,
                            title: translator.logoutDialogTitle,
                            context: context,
                          );
                        },
                      ),
                      vPad5,
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
    required VoidCallback onTap,
    String? subtitle,
    // bool isLast = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
