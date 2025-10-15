import 'package:flutter/material.dart';
import 'package:kenvinorellana/application/summery/summery_repo.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:kenvinorellana/translation/localization.dart';
import 'package:provider/provider.dart';

import '../../application/summery/summery_model.dart';

part 'components/achievement.dart';
part 'components/congo_layouts.dart';

class CongratulationsDialog extends StatefulWidget {
  const CongratulationsDialog({super.key});

  @override
  State<CongratulationsDialog> createState() => CongratulationsDialogState();
}

class CongratulationsDialogState extends State<CongratulationsDialog> {
  bool isLoading = false;
  String error = "";
  UserAchievementModel? userAchievementModel;
  final SummeryRepo summeryRepo = SummeryRepo();
  fetchAchievement() async {
    setState(() {
      isLoading = true;
    });

    final (data, err) = await summeryRepo.getUserAchievement();
    if (err != null) {
      error = err.title ?? "Something went wrong. please try again later.";
    } else {
      userAchievementModel = data!;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider lan = context.watch();
    final translator = lan.feedbackTranslation;
    //  return isLoading
    return Scaffold(
      body: isLoading
          ? _buildLoadingDialog(context)
          : (!isLoading && userAchievementModel == null)
          ? _buildErrorDialog(context, error)
          : _buildDialogContent(context, userAchievementModel),
    );
  }

  Widget _buildDialogContent(
    BuildContext context,
    UserAchievementModel? achievementData,
  ) {
    final LanguageProvider lan = context.watch();
    final translator = lan.feedbackTranslation;
    // Use real data if available, otherwise use placeholder data
    final achievement = achievementData?.info.achievement;
    final totalWorkoutDays = achievementData?.totalCompletedWorkoutDays ?? 0;
    final totalMealDays = achievementData?.totalCompletedMealDays ?? 0;

    return Container(
      width: double.infinity,
      height: 580, // Increased height to accommodate larger grid
      decoration: BoxDecoration(
        color: const Color(0xFF263133),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background decorative elements
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF6F1877).withOpacity(0.8),
                    const Color(0xFF263133),
                  ],
                ),
              ),
            ),
          ),

          // Decorative circles - reduced number and repositioned
          Positioned(
            right: 100,
            top: 44,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0x38EDAB82),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 70,
            top: 139,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: const Color(0x35B56DF8),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: 73,
            top: 70,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: const Color(0x3800561C),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Main content
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 20),

                // Trophy icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0x87919191),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.emoji_events_rounded,
                      size: 35,
                      color: const Color(0xFFFFD700),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                // Congratulations text
                Text(
                  translator.congratulations,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.27,
                  ),
                ),

                SizedBox(height: 6),

                // Subtitle
                Text(
                  translator.completionMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.30,
                  ),
                ),

                SizedBox(height: 12),

                // Progress section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            translator.completed,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.26,
                            ),
                          ),
                          Text(
                            '$totalWorkoutDays/15',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.26,
                            ),
                          ),
                        ],
                      ),
                      vPad5,
                      Container(
                        width: double.infinity,
                        height: 6,
                        decoration: BoxDecoration(
                          color: const Color(0x49979797),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: (totalWorkoutDays / 15).clamp(0.0, 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF6F1877),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // Your Achievement section
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 6),
                    Text(
                      translator.yourAchievement,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                // Achievement cards grid - Fixed height to show all 6 cards
                Container(
                  height:
                      240, // Increased height to ensure all cards and labels are visible
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 8, // Increased spacing
                    mainAxisSpacing: 8, // Increased spacing
                    childAspectRatio:
                        2.8, // Increased aspect ratio to give more height to each card
                    children: [
                      _AchievementCard(
                        value: achievement?.weightChange != null
                            ? '${achievement!.weightChange} kg'
                            : '--',
                        label: translator.weightLoss,
                      ),
                      _AchievementCard(
                        value:
                            achievementData
                                ?.info
                                .latestWorkoutPlan
                                ?.totalWorkoutsCompleted
                                .toString() ??
                            '--',
                        label: translator.totalWorkout,
                      ),
                      _AchievementCard(
                        value: achievement?.abdominalChange != null
                            ? '${achievement!.abdominalChange}%'
                            : '--',
                        label: translator.abdominal,
                      ),
                      _AchievementCard(
                        value: achievement?.sacrolicChange != null
                            ? '${achievement!.sacrolicChange}%'
                            : '--',
                        label: translator.sacroiliac,
                      ),
                      _AchievementCard(
                        value: achievement?.subscapularisChange != null
                            ? '${achievement!.subscapularisChange}%'
                            : '--',
                        label: translator.subscapularis,
                      ),
                      _AchievementCard(
                        value: achievement?.tricepsChange != null
                            ? '${achievement!.tricepsChange}%'
                            : '--',
                        label: translator.triceps,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12),

                // Done button
                SizedBox(
                  width: 120,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      // context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2D393A),
                      foregroundColor: const Color(0xFFCCD7D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                          color: Color(0xFF616D6D),
                          width: 1,
                        ),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      translator.done,
                      style: TextStyle(
                        color: const Color(0xFFCCD7D9),
                        fontSize: 15,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                      ),
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
