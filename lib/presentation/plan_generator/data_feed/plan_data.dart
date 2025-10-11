import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();

    final translator = languageProvider.profileUpdateTranslation;
    final translator2 = languageProvider.basicInfoTranslation;
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
                            value: null,
                            items: _dataSource.fitnessLevelData,
                            onChanged: (e) {},
                          ),
                          _buildDropdownField(
                            label: translator.trainingLocation,
                            value: null,
                            items: _dataSource.trainingLocationData,
                            onChanged: (e) {},
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
                            onChanged: (e) {},
                            hint: "",
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
                      child: Column(
                        spacing: 20,
                        children: [
                          _buildCheckboxSection(
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
                          _buildCheckboxSection(
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
                          _buildCheckboxSection(
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
    );
  }
}
