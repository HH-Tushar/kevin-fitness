import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:kenvinorellana/common/snack_bar.dart';
import 'package:provider/provider.dart';

import '../../application/subscription/subscription_model.dart';
import '../../application/subscription/subscription_repo.dart';
import '../../common/shimmer_loading.dart';
import '../../env.dart';
import '../../translation/localization.dart';
import 'stripe_payment_webview.dart';

part 'components/error.dart';
part 'components/loading.dart';
part 'components/tiles.dart';

class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({super.key});

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  final SubscriptionRepo subscriptionRepo = SubscriptionRepo();
  SubscriptionModel? subscriptionModel;
  int selectedPlan = 1; // 0 for monthly, 1 for yearly
  // PackageList? list;
  bool isLoading = false;
  bool isLoadingStripe = false;

  void fetchList() async {
    setState(() {
      isLoading = true;
    });
    final (data, error) = await subscriptionRepo.getPackages();
    if (data != null) {
      subscriptionModel = data;
    }
    setState(() {
      isLoading = false;
    });
  }

  void buyNow() async {
    setState(() {
      isLoadingStripe = true;
    });

    final priceId = subscriptionModel!.results[selectedPlan].priceId;
    final (data, error) = await subscriptionRepo.createCheckoutSession(
      priceId: priceId,
    );
    if (data != null) {
      animatedNavigateTo(context, StripePaymentWebView(url: data));
    } else {
      showToast(
        context: context,
        title: error?.title ?? "Please try again later",
        isSuccess: false,
      );
    }

    setState(() {
      isLoadingStripe = false;
    });
  }

  @override
  void initState() {
    fetchList();
    super.initState();
  }

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
                            fontSize: 22,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    hPad20,
                    hPad10,
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
                            fontSize: 22,
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
                            : !isLoading && subscriptionModel == null
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
                                      subscriptionModel?.results.length ?? 0,
                                      (index) {
                                        final item =
                                            subscriptionModel?.results[index];
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedPlan = index;
                                            });
                                          },
                                          child: _buildPricingCard(
                                            package: item!,
                                            // price: '\$4.99/',
                                            // period: 'month',
                                            isSelected: selectedPlan == index,
                                          ),
                                        );
                                      },
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
                            onPressed: isLoading || isLoadingStripe
                                ? null
                                : () {
                                    buyNow();
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
