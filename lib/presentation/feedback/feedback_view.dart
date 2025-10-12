import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../common/colors.dart';
import '../../common/gaps.dart';
import '../../translation/localization.dart';
part 'components/inputs.dart';
part 'components/data.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  bool isLoading = false;

  void submit() async {
    setState(() {
      isLoading = true;
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.feedbackTranslation;
    // final translator = languageProvider.profileUpdateTranslation;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                hPad5,
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: customWhite),
                ),
                Expanded(
                  child: Text(
                    translator.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                      // height: 0.71,
                      // letterSpacing: -0.5,
                    ),
                  ),
                ),
                hPad20,
                hPad20,
              ],
            ),

            vPad10,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 15,
                  children: [
                    _buildSectionCard(
                      child: _buildInputField(
                        label: translator.currentWeight,
                        initialValue: null,
                        inputFormate: FilteringTextInputFormatter.digitsOnly,
                        onChanged: (value) {
                          // final num = double.tryParse(value) ?? 0;
                          // profile?.weight = num;
                        },
                        suffix: "kg",
                        icon: Icons.monitor_weight_outlined,
                      ),
                    ),
                    _buildSectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16,
                        children: [
                          Text(
                            translator.skinfoldMeasurements,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Outfit",
                              color: customWhite,
                            ),
                          ),
                          Text(
                            translator.skinfoldDescription,
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.w600,
                              fontFamily: "Outfit",
                              color: customWhite,
                            ),
                          ),

                          _buildInputField(
                            label: translator.abdominal,
                            initialValue: null,
                            inputFormate:
                                FilteringTextInputFormatter.digitsOnly,
                            onChanged: (value) {
                              // final num = double.tryParse(value) ?? 0;
                              // profile?.weight = num;
                            },
                            suffix: "mm",
                            icon: Icons.monitor_weight_outlined,
                          ),
                          _buildInputField(
                            label: translator.sacroiliac,
                            initialValue: null,
                            inputFormate:
                                FilteringTextInputFormatter.digitsOnly,
                            onChanged: (value) {
                              // final num = double.tryParse(value) ?? 0;
                              // profile?.weight = num;
                            },
                            suffix: "mm",
                            icon: Icons.monitor_weight_outlined,
                          ),
                          _buildInputField(
                            label: translator.subscapularis,
                            initialValue: null,
                            inputFormate:
                                FilteringTextInputFormatter.digitsOnly,
                            onChanged: (value) {
                              // final num = double.tryParse(value) ?? 0;
                              // profile?.weight = num;
                            },
                            suffix: "mm",
                            icon: Icons.monitor_weight_outlined,
                          ),
                          _buildInputField(
                            label: translator.triceps,
                            initialValue: null,
                            inputFormate:
                                FilteringTextInputFormatter.digitsOnly,
                            onChanged: (value) {
                              // final num = double.tryParse(value) ?? 0;
                              // profile?.weight = num;
                            },
                            suffix: "mm",
                            icon: Icons.monitor_weight_outlined,
                          ),
                        ],
                      ),
                    ),

                    _buildSectionCard(
                      child: _buildRadioSection(
                        title: translator.mentalFeeling,
                        // question: "",
                        options: ["Happy", "Neutral", "Stressed"],
                        selectedValue: "Happy",
                        onChanged: (value) {
                          setState(() {
                            // profile?.lifestyleHabits = value;
                          });
                        },
                      ),
                    ),

                    _buildSectionCard(
                      child: _buildTextAreaField(
                        label: translator.mealsEaten,
                        initialValue: null,
                        // controller: _injuriesController,
                        onChanged: (value) {},
                        hint: translator.mealsHint,
                      ),
                    ),

                    _buildSectionCard(
                      child: _buildRadioSection(
                        title: translator.workoutConsistency,
                        // question: "",
                        options: ["All", "Some", "None"],
                        selectedValue: "All",
                        onChanged: (value) {
                          setState(() {
                            // profile?.lifestyleHabits = value;
                          });
                        },
                      ),
                    ),

                    _buildSectionCard(
                      child: _buildRadioSection(
                        title: translator.energyLevels,
                        // question: "",
                        options: ["1", "2", "3", "4", "5"],
                        selectedValue: "1",
                        onChanged: (value) {
                          setState(() {
                            // profile?.lifestyleHabits = value;
                          });
                        },
                      ),
                    ),

                    _buildSectionCard(
                      child: _buildTextAreaField(
                        label: translator.injuriesPain,
                        initialValue: null,
                        // controller: _injuriesController,
                        onChanged: (value) {},
                        hint: translator.mealsHint,
                      ),
                    ),

                    vPad10,
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6FE3C1),
                          foregroundColor: const Color(0xFF263133),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 2,
                        ),
                        child: isLoading
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    const Color(0xFF263133),
                                  ),
                                ),
                              )
                            : Text(
                                translator.submitFeedback,
                                style: TextStyle(
                                  color: const Color(0xFF263133),
                                  fontSize: 16,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),

                    vPad35,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
