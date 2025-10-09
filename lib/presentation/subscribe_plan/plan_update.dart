import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:provider/provider.dart';

import '../../application/auth/models/package_model.dart';
import '../../common/shimmer_loading.dart';
import '../../translation/localization.dart';

part 'components/error.dart';
part 'components/loading.dart';
part 'components/tiles.dart';

class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({super.key});

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  int selectedPlan = 1; // 0 for monthly, 1 for yearly
  PackageList? list;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.upgradePlanTranslation;
    return Scaffold(
      backgroundColor: const Color(0xFF263133),
      body: Stack(
        children: [
          Positioned.fill(
            left: 0,
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/ai_recommended_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    hPad5,
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        // size: 20,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          translator.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                            height: 0.71,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),
                    hPad20,
                  ],
                ),
                vPad20,

                // Unlock Premium Section
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translator.unlockPremium,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Features List
                        _buildFeatureItem(translator.aiGeneratedGoal),
                        const SizedBox(height: 15),
                        _buildFeatureItem(translator.aiGeneratedMeal),
                        const SizedBox(height: 15),
                        _buildFeatureItem(translator.aiGeneratedWorkout),
                        const SizedBox(height: 15),
                        _buildFeatureItem(translator.weeklyProgress),
                        const SizedBox(height: 35),

                        // Pick your plan
                        Text(
                          translator.pickYourPlan,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Pricing Cards
                        isLoading
                            ? _buildShimmerCards()
                            : !isLoading && list == null
                            ? _buildErrorWidget(
                                context,
                                translator.errorLoading,
                              )
                            : Center(
                                child: Wrap(
                                  spacing: 16,
                                  runSpacing: 16,
                                  runAlignment: WrapAlignment.center,
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,

                                  children: [
                                    ...List.generate(
                                      list?.results.length ?? 0,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedPlan = 0;
                                          });
                                        },
                                        child: _buildPricingCard(
                                          package: list!.results[index],
                                          price: '\$4.99/',
                                          period: 'month',
                                          isSelected: selectedPlan == 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        vPad35,

                        // Join Now Button
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle join now action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB8C5C5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              translator.joinNow,
                              style: TextStyle(
                                color: Color(0xFF2C3E3E),
                                fontSize: 18,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
