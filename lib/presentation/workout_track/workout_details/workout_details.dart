import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/colors.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:kenvinorellana/common/snack_bar.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/auth_controller.dart';
import '../../../application/daily_plan/daily_plan_repo.dart';
import '../../../application/daily_plan/models/daily_workout_plan.dart';
import '../../../common/shimmer_loading.dart';
import '../../../translation/localization.dart';

class WorkoutDetailsView extends StatefulWidget {
  const WorkoutDetailsView({super.key, this.workout, this.workoutUniqueId});
  final Workout? workout;
  final int? workoutUniqueId;
  @override
  State<WorkoutDetailsView> createState() => _WorkoutDetailsViewState();
}

class _WorkoutDetailsViewState extends State<WorkoutDetailsView> {
  bool isLoading = false;
  final DailyPlanRepo dailyPlanRepo = DailyPlanRepo();
  Workout? _workout;
  void checkData() async {
    if (widget.workout == null && widget.workoutUniqueId == null) {
      showToast(
        context: context,
        title: "Unable to fetch workout details",
        isSuccess: false,
      );
      Navigator.pop(context);
    }
    if (widget.workout == null) {
      fetchData();
    } else {
      _workout = widget.workout;
    }
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });
    final lan = Provider.of<LanguageProvider>(
      context,
      listen: false,
    ).currentLanguage;
    final token = Provider.of<AuthController>(
      context,
      listen: false,
    ).accessToken;
    final (data, error) = await dailyPlanRepo.getDailyWorkOutPlanDetails(
      token: token!,
      language: lan,
      id: widget.workoutUniqueId!,
    );
    if (data != null) {
      // _workout = data;
    }
  }

  @override
  void initState() {
    checkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.workoutPlanTranslation;
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? _loadingView()
            : !isLoading && _workout == null
            ? _error()
            : Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: _workout!.image,
                          // height: 200,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              vPad20,
                              // vPad5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _workout!.workoutName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: customWhite,
                                      borderRadius: BorderRadius.circular(
                                        defaultRadius,
                                      ),
                                    ),
                                    child: Text(
                                      _workout!.workoutType,
                                      style: TextStyle(
                                        color: const Color(0xFF222A2C),
                                        fontSize: 12,
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              vPad20,
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  color: customGrey,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: customGreyText,
                                    width: 0.8,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(2, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  // spacing: 15,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 8,
                                        children: [
                                          Row(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            spacing: 10,
                                            children: [
                                              Icon(
                                                Icons.watch_later_outlined,
                                                color: customLightBlue,
                                              ),

                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${_parseTimeToMinutes(_workout!.timeNeeded)} ${translator.min}",
                                                    style: TextStyle(
                                                      color: customWhite,
                                                      fontFamily: "Outfit",
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    translator.duration,
                                                    style: TextStyle(
                                                      color: customGreyText,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            spacing: 10,
                                            children: [
                                              Icon(
                                                Icons.fitness_center,
                                                color: customLightBlue,
                                              ),

                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      translator
                                                          .equipmentNeeded,
                                                      style: TextStyle(
                                                        color: customGreyText,
                                                      ),
                                                    ),
                                                    Text(
                                                      _workout!.equipmentNeeded,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: customWhite,
                                                        fontFamily: "Outfit",
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.local_fire_department,
                                            color: const Color(0xFFFF6B6B),
                                            // size: 18,
                                          ),

                                          Column(
                                            children: [
                                              Text(
                                                '${_workout!.caloriesBurn} cal',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                translator.caloriesBurn,

                                                style: TextStyle(
                                                  color: const Color(
                                                    0xFFA0A0A6,
                                                  ),
                                                  fontSize: 12,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              vPad20,
                              Text(
                                translator.tags,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: customWhite,
                                  fontFamily: "Outfit",
                                ),
                              ),
                              vPad10,
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: _workout!.tag
                                    .split(',')
                                    .map((tag) => _tags(tag.trim()))
                                    .toList(),
                              ),

                              vPad20,
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  color: customGrey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // spacing: 8,
                                  children: [
                                    Text(
                                      translator.benefits,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: customWhite,
                                        fontFamily: "Outfit",
                                      ),
                                    ),
                                    vPad10,
                                    ..._workout!.benefits
                                        .split(",")
                                        .map(
                                          (e) => Padding(
                                            padding: EdgeInsets.only(bottom: 6),
                                            child: Text(
                                              '• $e',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: 'Outfit',
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    // right: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: CircleAvatar(
                        backgroundColor: customGreyText,
                        child: Icon(Icons.arrow_back, color: customWhite),
                      ),
                    ),
                  ),

                  // Positioned(
                  //   top: 200,
                  //   bottom: 0,
                  //   left: defaultPadding,
                  //   right: defaultPadding,
                  //   child: Column(children: [Text("data")]),
                  // ),
                ],
              ),
      ),
    );
  }
}

Widget _tags(String value) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    decoration: BoxDecoration(
      color: customWhite,
      borderRadius: BorderRadius.circular(defaultRadius),
    ),
    child: Text(value),
  );
}

int _parseTimeToMinutes(String timeString) {
  try {
    // Handle format like "00:30:00" or "0:30:00"
    final parts = timeString.split(':');
    if (parts.length == 3) {
      final hours = int.parse(parts[0]);
      final minutes = int.parse(parts[1]);
      return hours * 60 + minutes;
    }
    return 0;
  } catch (e) {
    return 0;
  }
}

_loadingView() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerContainer(width: double.infinity, height: 280),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerContainer(width: 200, height: 30),
              SizedBox(height: 10),
              ShimmerContainer(width: double.infinity, height: 20),
              SizedBox(height: 10),
              ShimmerContainer(width: double.infinity, height: 120),
              SizedBox(height: 18),
              ShimmerContainer(width: 100, height: 20),
              SizedBox(height: 8),
              ShimmerContainer(width: double.infinity, height: 40),
              SizedBox(height: 18),
              ShimmerContainer(width: double.infinity, height: 120),
            ],
          ),
        ),
      ],
    ),
  );
}

_error() {
  return SafeArea(
    child: Center(
      child: Text(
        'No workout selected',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
