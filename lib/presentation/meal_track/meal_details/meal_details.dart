import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/shimmer_loading.dart'
    show ShimmerContainer;
import 'package:provider/provider.dart';

import '../../../application/auth/auth_controller.dart';
import '../../../application/daily_plan/daily_plan_repo.dart';
import '../../../application/daily_plan/models/daily_meal_plan.dart';
import '../../../common/colors.dart';
import '../../../common/gaps.dart';
import '../../../translation/localization.dart';
part 'components/tiles.dart';

class MealDetailsView extends StatefulWidget {
  const MealDetailsView({
    super.key,
    required this.mealUniqueId,
    required this.recipeDetails,
  });
  final String mealUniqueId;
  final Recipe? recipeDetails;
  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  bool isLoading = false;
  final DailyPlanRepo dailyPlanRepo = DailyPlanRepo();
  Recipe? _recipeDetails;
  void checkData() async {
    // if (widget.recipeDetails == null && widget.workoutUniqueId == null) {
    //   showToast(
    //     context: context,
    //     title: "Unable to fetch workout details",
    //     isSuccess: false,
    //   );
    //   Navigator.pop(context);
    // }
    if (widget.recipeDetails == null) {
      fetchData();
    } else {
      _recipeDetails = widget.recipeDetails;
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
    // final (data, error) = await dailyPlanRepo.getDailyMealPlanDetails(
    //   token: token!,
    //   language: lan,
    //   id: widget.mealUniqueId,
    // );
    // if (data != null) {
    //   // _recipeDetails = data;
    // }
  }

  @override
  void initState() {
    checkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.mealPlanTranslation;
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? _loadingView()
            : !isLoading && _recipeDetails == null
            ? _error()
            : Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: _recipeDetails!.image,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),

                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vPad20,
                                // vPad5,
                                Text(
                                  _recipeDetails!.recipeName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                vPad20,

                                Row(
                                  spacing: 8,
                                  children: [
                                    _topTiles(
                                      icon: Icons.star,
                                      label: _recipeDetails!.ratings.toString(),
                                      iconColor: Colors.orange,
                                    ),
                                    _topTiles(
                                      icon: Icons.watch_later_outlined,
                                      label:
                                          "${_recipeDetails!.makingTime} ${translator.min}",
                                    ),
                                    _topTiles(
                                      icon: Icons.people,
                                      label: "1 ${translator.serving}",
                                    ),
                                  ],
                                ),
                                vPad20,

                                Container(
                                  padding: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      defaultRadius / 2,
                                    ),
                                    color: Color(0xFF3A4646),
                                  ),
                                  child: Row(
                                    children: [
                                      // Column(children: [
                                      //   Text(_recipeDetails!.calories,style: TextStyle(fontSize: 16,color: customWhite,fontFamily: "Outfit"),),
                                      //   Text(translator.calories,style: TextStyle(fontSize: 14,color: customWhite,fontFamily: "Outfit"),),
                                      // ],),
                                      _verticalTile(
                                        label: translator.calories,
                                        value: _recipeDetails!.calories,
                                      ),
                                      _verticalTile(
                                        label: translator.carbs,
                                        value: _recipeDetails!.carbs,
                                        unit: "g",
                                      ),
                                      _verticalTile(
                                        label: translator.protein,
                                        value: _recipeDetails!.protein,
                                        unit: "g",
                                      ),
                                      _verticalTile(
                                        label: translator.fat,
                                        value: _recipeDetails!.fat,
                                        unit: "g",
                                      ),
                                    ],
                                  ),
                                ),
                                vPad15,
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      defaultRadius / 2,
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFF3A4646),
                                      width: 1,
                                    ),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF253032),
                                        Color(0xFF3A4646),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        translator.makeItHealthy,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Outfit',
                                        ),
                                      ),
                                      Text(
                                        "Enjoy your meal!",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Outfit',
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
                                  children: _recipeDetails!.tag
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // spacing: 8,
                                    children: [
                                      Text(
                                        translator.ingredients,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: customWhite,
                                          fontFamily: "Outfit",
                                        ),
                                      ),
                                      vPad10,
                                      ..._recipeDetails!.ingredients
                                          .split(",")
                                          .map(
                                            (e) => Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 6,
                                              ),
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

                  Positioned(
                    top: 250,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Text(
                        _recipeDetails!.recipeType,
                        style: TextStyle(
                          color: const Color(0xFF222A2C),
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
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
