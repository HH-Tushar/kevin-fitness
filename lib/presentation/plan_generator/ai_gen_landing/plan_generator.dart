import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kenvinorellana/presentation/feedback/feedback_view.dart';
import '../data_feed/plan_data.dart';
import '/common/gaps.dart';
import '/common/navigator.dart';
import '/translation/localization.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/auth_controller.dart';
import '../../../application/auth/models/user_info_models.dart';
import '../plan_list/meals_list/ai_gen_tracks.dart';
import '../plan_list/workout_list/ai_gen_tracks.dart';
part 'components/profile.dart';

class PlanGeneratorView extends StatelessWidget {
  const PlanGeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final planGen = languageProvider.aiScreenTranslation;
    final AuthController authController = context.watch();
    final userInfo = authController.getUserInfo;

    return Scaffold(
      // appBar: AppBar(centerTitle: true,title: Text("KEVIN"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ai_recommended_bg.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                Text(
                  'KEVIN ORELLANA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 4.0,
                  ),
                ),
                Text(
                  "Your personal trainer & nutritionist",
                  style: TextStyle(
                    color: const Color(0xFFA0A0A6),
                    fontSize: 13,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                vPad20,

                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await authController.fetchUserInfo();
                    },
                    child: SingleChildScrollView(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await authController.fetchUserInfo();
                        },
                        child: Column(
                          children: [
                            _ProfileSection(),

                            vPad20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 20,
                              children: [
                                _OutlinedFeatureButton(
                                  icon: Icons.fitness_center,
                                  iconBg: const Color(0xFF6F1877),
                                  label: planGen.aiWorkoutPlan,
                                  onTap: () async {
                                    final dd = await animatedNavigateTo(
                                      context,
                                      AiDataFeed(),
                                    );
                                    if (dd == true) {
                                      authController.fetchUserInfo();
                                    }
                                    // Navigator.push(context, )
                                  },
                                ),

                                _OutlinedFeatureButton(
                                  icon: Icons.restaurant,
                                  iconBg: const Color(0xFF134E48),
                                  label: planGen.aiDietPlan,
                                  onTap: () {},
                                  isLoading: false,
                                ),
                              ],
                            ),

                            vPad20,

                            (userInfo != null && userInfo.mealPlans.isNotEmpty)
                                ? _AIDietPlanCard(
                                    mealPlan: userInfo.mealPlans.first,
                                    onFeedbackTap: () {
                                      animatedNavigateTo(
                                        context,
                                        FeedbackView(),
                                      );
                                    },
                                  )
                                : SizedBox(),

                            vPad20,
                            (userInfo != null &&
                                    userInfo.workoutPlans.isNotEmpty)
                                ? _AIWorkoutPlanCard(
                                    workoutPlan: userInfo.workoutPlans.first,
                                    onFeedbackTap: () {
                                      animatedNavigateTo(
                                        context,
                                        FeedbackView(),
                                      );
                                    },
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // userInfo.workoutPlans.isNotEmpty &&
                //         userInfo.workoutPlans.first.isCompleted == true
                //     ? _AIWorkoutPlanCard(
                //         workoutPlan: userInfo.workoutPlans.first,
                //         onFeedbackTap: () => _navigateToFeedback(
                //           workoutPlanId: userInfo.workoutPlans.first.id,
                //         ),
                //       )
                //     : GestureDetector(
                //         //  onTap: () => _navigateToWorkoutPlan(),
                //         child: _AIWorkoutPlanCard(
                //           workoutPlan: userInfo.workoutPlans.isNotEmpty
                //               ? userInfo.workoutPlans.first
                //               : null,
                //           onFeedbackTap: () => _navigateToFeedback(
                //             workoutPlanId: userInfo.workoutPlans.isNotEmpty
                //                 ? userInfo.workoutPlans.first.id
                //                 : null,
                //           ),
                //         ),
                //       ),
              ],
            ),
          ),
        ),
      ),

      // body: Stack(
      //   children: [
      //     Image.asset(
      //       "assets/images/ai_recommended_bg.png",
      //       height: double.infinity,
      //       width: double.infinity,
      //       fit: BoxFit.cover,
      //     ),
      //     //bg image here
      //     Positioned.fill(
      //   ),
      //   ],
      // ),
    );
  }
}

class _OutlinedFeatureButton extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String label;
  final VoidCallback? onTap;
  final bool isLoading;
  const _OutlinedFeatureButton({
    required this.icon,
    required this.iconBg,
    required this.label,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _DashedBorderPainter(),
        child: Container(
          width: 173,
          height: 95,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : Icon(icon, color: Colors.white, size: 24),
                ),
              ),
              SizedBox(height: 12),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFD2D2D2)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final double dashWidth = 7;
    final double dashSpace = 5;
    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(6),
    );
    final Path path = Path()..addRRect(rRect);
    double distance = 0.0;
    final PathMetrics metrics = path.computeMetrics();
    for (final PathMetric metric in metrics) {
      while (distance < metric.length) {
        final double next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(
            distance,
            next < metric.length ? next : metric.length,
          ),
          paint,
        );
        distance = next + dashSpace;
      }
      distance = 0.0;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AIWorkoutPlanCard extends StatelessWidget {
  final Plan workoutPlan;
  final VoidCallback? onFeedbackTap;

  const _AIWorkoutPlanCard({required this.workoutPlan, this.onFeedbackTap});

  int _calculateDays(String startDate, String endDate) {
    try {
      final start = DateTime.parse(startDate);
      final end = DateTime.parse(endDate);
      return end.difference(start).inDays + 1;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final planGen = languageProvider.aiScreenTranslation;
    return GestureDetector(
      onTap: () => workoutPlan.isCompleted || workoutPlan.isCancelled
          ? null
          : animatedNavigateTo(
              context,
              AiGenWorkOutPlansList(planId: workoutPlan.id),
            ),
      child: Container(
        // width: 358,
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF2D393A),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1E000000),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.fitness_center, color: Color(0xFFB16EFF), size: 22),
                SizedBox(width: 8),
                Text(
                  planGen.aiWorkoutPlan,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                workoutPlan.isCompleted == true
                    ? GestureDetector(
                        onTap: onFeedbackTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Give Feedback',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: workoutPlan?.isCancelled == true
                              ? Colors.red
                              : Color(0xFFB16EFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          workoutPlan?.isCancelled == true
                              ? planGen.cancelled
                              : planGen.active,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              workoutPlan?.workoutPlanName ?? planGen.noWorkoutPlan,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
            vPad10,
            Row(
              children: [
                ...[
                  Text(
                    '${_calculateDays(workoutPlan.startDate.toString(), workoutPlan.endDate.toString())} ${planGen.days}',
                    style: TextStyle(
                      color: Color(0xFF6FE3C1),
                      fontSize: 13,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 12),
                ],
                Text(
                  workoutPlan.tags.split(',').first.trim(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (workoutPlan != null) ...[
              Wrap(
                spacing: 8,
                children: workoutPlan!.tags
                    .split(',')
                    .map((tag) => _Tag(text: tag.trim()))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _AIDietPlanCard extends StatelessWidget {
  final Plan mealPlan;
  final VoidCallback? onFeedbackTap;

  const _AIDietPlanCard({required this.mealPlan, this.onFeedbackTap});

  int _calculateDays(String startDate, String endDate) {
    try {
      final start = DateTime.parse(startDate);
      final end = DateTime.parse(endDate);
      return end.difference(start).inDays + 1;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final planGen = languageProvider.aiScreenTranslation;
    return GestureDetector(
      onTap: () => mealPlan.isCancelled || mealPlan.isCompleted
          ? null
          : animatedNavigateTo(
              context,
              AiGenMealsPlanList(planId: mealPlan.id),
            ),
      child: Container(
        // width: 358,
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF2D393A),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1E000000),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.restaurant, color: Color(0xFF6FE3C1), size: 22),
                SizedBox(width: 8),
                Text(
                  planGen.aiDietPlan,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                mealPlan.isCompleted == true
                    ? GestureDetector(
                        onTap: onFeedbackTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Give Feedback',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: mealPlan.isCancelled == true
                              ? Colors.red
                              : Color(0xFF6FE3C1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          mealPlan.isCancelled == true
                              ? planGen.cancelled
                              : planGen.active,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              mealPlan.mealPlanName ?? planGen.noMealPlan,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                ...[
                  Text(
                    '${_calculateDays(mealPlan.startDate.toString(), mealPlan.endDate.toString())} ${planGen.days}',
                    style: TextStyle(
                      color: Color(0xFFB16EFF),
                      fontSize: 13,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 12),
                ],
                Text(
                  mealPlan.tags.split(',').first.trim(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ...[
              Wrap(
                spacing: 8,
                children: mealPlan.tags
                    .split(',')
                    .map((tag) => _Tag(text: tag.trim()))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF263133),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
