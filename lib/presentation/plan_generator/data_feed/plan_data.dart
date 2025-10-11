import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kenvinorellana/common/snack_bar.dart';
import 'package:provider/provider.dart';

import '../../../application/daily_plan/search_repo.dart';
import '../../../common/colors.dart';
import '../../../common/gaps.dart';
import '../../../translation/localization.dart';
part 'controller.dart';
part 'components/input.dart';

class AiDataFeed extends StatefulWidget {
  const AiDataFeed({super.key});

  @override
  State<AiDataFeed> createState() => _AiDataFeedState();
}

class _AiDataFeedState extends State<AiDataFeed> {
  final _DataSource _dataSource = _DataSource();
  final SearchRepo repo = SearchRepo();
  bool isLoading = false;

  void postPlan() async {
    Navigator.pop(context, true);
    // setState(() {
    //   isLoading = true;
    // });

    // final (data, error) = await repo.postWorkoutPlan(
    //   workoutData: _dataSource._makeModel(),
    // );

    // if (data != null) {
    //   showToast(context: context, title: data, isSuccess: true);
    //   Navigator.pop(context,true);
    // }
    // setState(() {
    //   isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.profileUpdateTranslation;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                // hPad5,
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: customWhite),
                ),
                Expanded(
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

                      // Text(
                      //   translator.updateProfile,
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 24,
                      //     fontFamily: 'Outfit',
                      //     fontWeight: FontWeight.w600,
                      //     height: 0.71,
                      //     letterSpacing: -0.5,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                hPad20,
                hPad15,
              ],
            ),

            vPad15,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  spacing: 25,
                  children: [
                    _buildSectionCard(
                      child: Column(
                        spacing: 20,
                        children: [
                          _buildDropdownField(
                            label: translator.fitnessLevel,
                            value: _dataSource.fitnessLevel,
                            items: _dataSource.fitnessLevelData,
                            onChanged: (e) {
                              _dataSource.fitnessLevel = e!;
                              setState(() {});
                            },
                          ),
                          _buildDropdownField(
                            label: translator.trainingLocation,
                            value: _dataSource.trainingLocation,
                            items: _dataSource.trainingLocationData,
                            onChanged: (e) {
                              setState(() {
                                _dataSource.trainingLocation = e!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    _buildSectionCard(
                      child: Column(
                        spacing: 20,
                        children: [
                          _buildTextAreaField(
                            label: translator.injuriesQuestion,
                            onChanged: (e) {
                              _dataSource.injuries = e;
                            },
                            hint: "No",
                          ),
                          _buildTextAreaField(
                            // initialValue: ,
                            inputFormate:
                                FilteringTextInputFormatter.digitsOnly,
                            label: translator.workoutDurationQuestion,
                            onChanged: (e) {},
                            hint: "",
                          ),
                        ],
                      ),
                    ),
                    _buildSectionCard(
                      child: _buildCheckboxSection(
                        title: "Chest",
                        options: _dataSource.chestEquipment,
                        selectedValues: _dataSource.chest.toSet(),
                        // question: ,
                        // selectedValue: "All",
                        onChanged: (e) {
                          _dataSource.chest = e.toList();
                          setState(() {});
                        },
                      ),
                    ),

                    // _buildSectionCard(child: child),
                    //                     _buildSectionCard(child: child),
                    _buildSectionCard(
                      child: _buildCheckboxSection(
                        title: "Back",
                        options: _dataSource.backEquipment,
                        selectedValues: _dataSource.back.toSet(),
                        // question: ,
                        // selectedValue: "All",
                        onChanged: (e) {
                          _dataSource.back = e.toList();
                          setState(() {});
                        },
                      ),
                    ),
                    _buildSectionCard(
                      child: _buildCheckboxSection(
                        title: "Shoulders",
                        options: _dataSource.shouldersEquipment,
                        selectedValues: _dataSource.shoulders.toSet(),
                        // question: ,
                        // selectedValue: "All",
                        onChanged: (e) {
                          _dataSource.shoulders = e.toList();
                          setState(() {});
                        },
                      ),
                    ),

                    _buildSectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          Text(
                            "Arms",
                            style: TextStyle(fontSize: 18, color: customWhite),
                          ),
                          _buildCheckboxSection(
                            title: "Biceps",
                            options: _dataSource.bicepsEquipment,
                            selectedValues: _dataSource.biceps.toSet(),
                            // question: ,
                            // selectedValue: "All",
                            onChanged: (e) {
                              _dataSource.biceps = e.toList();
                              setState(() {});
                            },
                          ),
                          _buildCheckboxSection(
                            title: "Triceps",
                            options: _dataSource.tricepsEquipment,
                            selectedValues: _dataSource.triceps.toSet(),
                            // question: ,
                            // selectedValue: "All",
                            onChanged: (e) {
                              _dataSource.triceps = e.toList();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),

                    _buildSectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          Text(
                            "Legs & Glutes",
                            style: TextStyle(fontSize: 18, color: customWhite),
                          ),

                          _buildCheckboxSection(
                            title: "Quadriceps",
                            options: _dataSource.quadricepsEquipment,
                            selectedValues: _dataSource.quadriceps.toSet(),
                            // question: ,
                            // selectedValue: "All",
                            onChanged: (e) {
                              _dataSource.quadriceps = e.toList();
                              setState(() {});
                            },
                          ),
                          _buildCheckboxSection(
                            title: "Hamstrings",
                            options: _dataSource.hamstringsEquipment,
                            selectedValues: _dataSource.hamstrings.toSet(),
                            // question: ,
                            // selectedValue: "All",
                            onChanged: (e) {
                              _dataSource.hamstrings = e.toList();
                              setState(() {});
                            },
                          ),
                          _buildCheckboxSection(
                            title: "Glutes",
                            options: _dataSource.glutesEquipment,
                            selectedValues: _dataSource.glutes.toSet(),
                            // question: ,
                            // selectedValue: "All",
                            onChanged: (e) {
                              _dataSource.glutes = e.toList();
                              setState(() {});
                            },
                          ),
                          _buildCheckboxSection(
                            title: "Calves",
                            options: _dataSource.calvesEquipment,
                            selectedValues: _dataSource.calves.toSet(),
                            // question: ,
                            // selectedValue: "All",
                            onChanged: (e) {
                              _dataSource.calves = e.toList();
                              setState(() {});
                            },
                          ),
                          _buildCheckboxSection(
                            title: "Adductors",
                            options: _dataSource.adductorsEquipment,
                            selectedValues: _dataSource.adductors.toSet(),
                            // question: ,
                            // selectedValue: "All",
                            onChanged: (e) {
                              _dataSource.adductors = e.toList();
                              setState(() {});
                            },
                          ),
                          _buildCheckboxSection(
                            title: "Lower Back",
                            options: _dataSource.lowerBackEquipment,
                            selectedValues: _dataSource.lower_back.toSet(),
                            // question: ,
                            // selectedValue: "All",
                            onChanged: (e) {
                              _dataSource.lower_back = e.toList();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    vPad20,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : () => postPlan(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF343F41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.43),
                            ),
                            side: const BorderSide(
                              color: Color(0xFF767781),
                              width: 0.69,
                            ),
                          ),
                          child: isLoading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Generating...',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.78,
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  'Generate Plan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                        ),
                      ),
                    ),
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
