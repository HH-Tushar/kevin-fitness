import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kenvinorellana/application/summery/summery_repo.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:kenvinorellana/common/snack_bar.dart';
import 'package:kenvinorellana/presentation/feedback/congratulation.dart';
import 'package:provider/provider.dart';

import '../../common/colors.dart';
import '../../common/gaps.dart';
import '../../translation/localization.dart';
part 'components/inputs.dart';
part 'components/data.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key, this.meal_plan_id, this.workout_plan_id});
  final int? workout_plan_id;
  final int? meal_plan_id;
  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  bool isLoading = false;
  final SummeryRepo summeryRepo = SummeryRepo();

  final _formKey = GlobalKey<FormState>();
  void submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });
    if (widget.meal_plan_id != null) {
      feedbackData["meal_plan"] = widget.meal_plan_id.toString();
    }
    if (widget.workout_plan_id != null) {
      feedbackData["workout_plan"] = widget.workout_plan_id.toString();
    }
    final (data, error) = await summeryRepo.postFeedback(feedbackData);
    if (data != null) {
      showToast(context: context, title: data, isSuccess: true);
      animatedNavigateTo(context, CongratulationsDialog());
    } else {
      showToast(
        context: context,
        title: error?.title ?? "Something went wrong",
        isSuccess: false,
      );
    }

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 15,
                    children: [
                      _buildSectionCard(
                        child: _buildInputField(
                          label: translator.currentWeight,
                          initialValue: currentWeight.toString(),

                          inputFormate: FilteringTextInputFormatter.digitsOnly,
                          onChanged: (value) {
                            currentWeight = int.tryParse(value) ?? 0;
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
                              initialValue: abdominal.toString(),
                              inputFormate:
                                  FilteringTextInputFormatter.digitsOnly,
                              onChanged: (value) {
                                abdominal = int.tryParse(value) ?? 0;
                              },
                              suffix: "mm",
                              icon: Icons.monitor_weight_outlined,
                            ),
                            _buildInputField(
                              label: translator.sacroiliac,
                              initialValue: sacroiliac.toString(),
                              inputFormate:
                                  FilteringTextInputFormatter.digitsOnly,
                              onChanged: (value) {
                                sacroiliac = int.tryParse(value) ?? 0;
                              },
                              suffix: "mm",
                              icon: Icons.monitor_weight_outlined,
                            ),
                            _buildInputField(
                              label: translator.subscapularis,
                              initialValue: subscapularis.toString(),
                              inputFormate:
                                  FilteringTextInputFormatter.digitsOnly,
                              onChanged: (value) {
                                subscapularis = int.tryParse(value) ?? 0;
                              },
                              suffix: "mm",
                              icon: Icons.monitor_weight_outlined,
                            ),
                            _buildInputField(
                              label: translator.triceps,
                              initialValue: triceps.toString(),
                              inputFormate:
                                  FilteringTextInputFormatter.digitsOnly,
                              onChanged: (value) {
                                triceps = int.tryParse(value) ?? 0;
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
                          selectedValue: feeling,
                          onChanged: (value) {
                            setState(() {
                              feeling = value;
                            });
                          },
                        ),
                      ),

                      _buildSectionCard(
                        child: _buildTextAreaField(
                          label: translator.mealsEaten,
                          initialValue: total_meal.toString(),
                          validation: (e) => _fieldRequired(e),
                          // controller: _injuriesController,
                          onChanged: (value) {
                            total_meal = int.tryParse(value) ?? 0;
                          },
                          hint: translator.mealsHint,
                        ),
                      ),

                      _buildSectionCard(
                        child: _buildRadioSection(
                          title: translator.workoutConsistency,
                          // question: "",
                          options: ["All", "Some", "None"],
                          selectedValue: workout_consistency,
                          onChanged: (value) {
                            setState(() {
                              workout_consistency = value;
                            });
                          },
                        ),
                      ),

                      _buildSectionCard(
                        child: _buildRadioSection(
                          title: translator.energyLevels,
                          options: ["1", "2", "3", "4", "5"],
                          selectedValue: energy_level.toString(),
                          onChanged: (value) {
                            setState(() {
                              energy_level = int.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ),

                      _buildSectionCard(
                        child: _buildTextAreaField(
                          label: translator.injuriesPain,
                          initialValue: injuries_pain,
                          validation: (e) => _fieldRequired(e),
                          // controller: _injuriesController,
                          onChanged: (value) {
                            injuries_pain = value;
                          },
                          hint: translator.mealsHint,
                        ),
                      ),

                      vPad10,
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  submit();
                                },
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
            ),
          ],
        ),
      ),
    );
  }
}
