import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../application/summery/summery_model.dart';
import '../../application/summery/summery_repo.dart';
import '/common/gaps.dart';
import '/translation/localization.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../common/shimmer_loading.dart';
part 'components/widgets.dart';
part 'components/feedback.dart';
part 'layouts/error.dart';
part 'layouts/loading.dart';

class SummeryView extends StatefulWidget {
  const SummeryView({super.key});

  @override
  State<SummeryView> createState() => _SummeryViewState();
}

class _SummeryViewState extends State<SummeryView> {
  UserAchievementModel? userAchievementModel;
  final SummeryRepo summeryRepo = SummeryRepo();
  bool isLoading = true;

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    final (data, error) = await summeryRepo.getUserAchievement();
    if (data != null) {
      userAchievementModel = data;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.summaryTranslation;
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? _buildShimmerContent(context)
            : !isLoading && userAchievementModel == null
            ? _buildErrorContent(context, "", fetchData)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      // SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          translator.summery,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // const Spacer(),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      // hPad10,
                      hPad20,
                    ],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Column(
                        children: [
                          vPad15,
                          _WeightChartCard(
                            weightsList:
                                userAchievementModel?.weightsList ?? [],
                            title: translator.weightChangeComparison,
                          ),
                          vPad15,
                          _SkinfoldGraphCard(
                            achievement: userAchievementModel!.info.achievement,
                          ),
                          vPad15,

                          _AdherenceCard(
                            title: translator.workoutAdherence,
                            percent:
                                userAchievementModel!
                                    .totalCompletedWorkoutDays /
                                15,
                            valueText:
                                '${userAchievementModel?.totalCompletedWorkoutDays} ${translator.daysCompleted} / 15',
                          ),
                          vPad10,
                          _AdherenceCard(
                            title: translator.dietAdherence,
                            percent:
                                userAchievementModel!.totalCompletedMealDays /
                                15,
                            valueText:
                                '${userAchievementModel?.totalCompletedMealDays} ${translator.daysCompleted} / 15',
                          ),
                          vPad15,
                          // _FeedbackSection(userFeedback: summaryData.userFeedback),
                          SizedBox(height: 32),
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
