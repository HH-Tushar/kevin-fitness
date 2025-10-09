// import 'package:flutter/material.dart';

// // State providers for form fields


// class UpdateProfileScreen extends StatefulWidget {
//   const UpdateProfileScreen({super.key});

//   @override
//   ConsumerState<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
// }

// class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
//   // Controllers for text fields
//   late TextEditingController _weightController;
//   late TextEditingController _heightController;
//   late TextEditingController _injuriesController;

//   @override
//   void initState() {
//     super.initState();
//     _weightController = TextEditingController();
//     _heightController = TextEditingController();
//     _injuriesController = TextEditingController();
    
 
//   }

//   @override
//   void dispose() {
//     _weightController.dispose();
//     _heightController.dispose();
//     _injuriesController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF263133),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // SizedBox(height: 47.h),
                
//                 // Header with back button and title
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () => Navigator.of(context).pop(),
//                       icon: Icon(
//                         Icons.arrow_back_ios_new_rounded,
//                         color: Colors.white,
//                         size: 24.sp,
//                       ),
//                     ),
//                     Expanded(
//                       child: Text(
//                         t('settings.update_profile'),
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 23.sp,
//                           fontFamily: 'Outfit',
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 48.w), // Balance the header
//                   ],
//                 ),
                
//                 SizedBox(height: 32.h),
                
//                 // Personal Measurements Section
//                 _buildSectionCard(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildInputField(
//                         label: t('profile_update.weight'),
//                         controller: _weightController,
//                         onChanged: (value) => ref.read(weightProvider.notifier).state = value,
//                         suffix: t('profile_update.kg'),
//                         icon: Icons.monitor_weight_outlined,
//                       ),
//                       SizedBox(height: 16.h),
//                       _buildInputField(
//                         label: t('profile_update.height'),
//                         controller: _heightController,
//                         onChanged: (value) => ref.read(heightProvider.notifier).state = value,
//                         suffix: t('profile_update.cm'),
//                         icon: Icons.height,
//                       ),
//                     ],
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Workout Duration Section
//                 _buildSectionCard(
//                   child: _buildDropdownField(
//                     label: t('profile_update.workout_duration_question'),
//                     value: ref.watch(workoutDurationProvider),
//                     items: ['1 Month', '2 Months', '3 Months', '6 Months'],
//                     onChanged: (value) {
//                       if (value != null) {
//                         ref.read(workoutDurationProvider.notifier).state = value;
//                       }
//                     },
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Fitness Level Section
//                 _buildSectionCard(
//                   child: _buildDropdownField(
//                     label: t('profile_update.fitness_level'),
//                     value: ref.watch(fitnessLevelProvider),
//                     items: ['Beginner', 'Basic', 'Intermediate', 'Advanced'],
//                     onChanged: (value) {
//                       if (value != null) {
//                         ref.read(fitnessLevelProvider.notifier).state = value;
//                       }
//                     },
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Training Location Section
//                 _buildSectionCard(
//                   child: _buildDropdownField(
//                     label: t('profile_update.training_location'),
//                     value: ref.watch(trainingLocationProvider),
//                     items: ['At gym', 'At home', 'Outdoor', 'Mixed'],
//                     onChanged: (value) {
//                       if (value != null) {
//                         ref.read(trainingLocationProvider.notifier).state = value;
//                       }
//                     },
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Injuries Section
//                 _buildSectionCard(
//                   child: _buildTextAreaField(
//                     label: t('profile_update.injuries_question'),
//                     controller: _injuriesController,
//                     onChanged: (value) => ref.read(injuriesProvider.notifier).state = value,
//                     hint: t('profile_update.write_here'),
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Dietary Preferences Section
//                 _buildSectionCard(
//                   child: _buildRadioSection(
//                     title: t('profile_update.dietary_preferences'),
//                     question: t('profile_update.dietary_question'),
//                     options: [
//                       {'key': 'keto', 'label': t('profile_update.keto')},
//                       {'key': 'paleo', 'label': t('profile_update.paleo')},
//                       {'key': 'no_preferences', 'label': t('profile_update.no_preferences')},
//                     ],
//                     selectedValue: ref.watch(dietaryPreferenceProvider),
//                     onChanged: (value) => ref.read(dietaryPreferenceProvider.notifier).state = value,
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Allergies Section
//                 _buildSectionCard(
//                   child: _buildCheckboxSection(
//                     title: t('profile_update.allergies'),
//                     question: t('profile_update.allergies_question'),
//                     options: [
//                       {'key': 'nuts', 'label': t('profile_update.nuts')},
//                       {'key': 'dairy', 'label': t('profile_update.dairy')},
//                       {'key': 'shellfish', 'label': t('profile_update.shellfish')},
//                     ],
//                     selectedValues: ref.watch(allergiesProvider),
//                     onChanged: (values) => ref.read(allergiesProvider.notifier).state = values,
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Food Preference Section
//                 _buildSectionCard(
//                   child: _buildCheckboxSection(
//                     title: t('profile_update.food_preference'),
//                     question: t('profile_update.food_preference_question'),
//                     options: [
//                       {'key': 'egg', 'label': t('profile_update.egg')},
//                       {'key': 'milk', 'label': t('profile_update.milk')},
//                       {'key': 'fish', 'label': t('profile_update.fish')},
//                     ],
//                     selectedValues: ref.watch(foodPreferencesProvider),
//                     onChanged: (values) => ref.read(foodPreferencesProvider.notifier).state = values,
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Medical Conditions Section
//                 _buildSectionCard(
//                   child: _buildCheckboxSection(
//                     title: t('profile_update.medical_conditions'),
//                     question: t('profile_update.medical_conditions_question'),
//                     options: [
//                       {'key': 'diabetes', 'label': t('profile_update.diabetes')},
//                       {'key': 'high_blood_pressure', 'label': t('profile_update.high_blood_pressure')},
//                       {'key': 'heart_disease', 'label': t('profile_update.heart_disease')},
//                     ],
//                     selectedValues: ref.watch(medicalConditionsProvider),
//                     onChanged: (values) => ref.read(medicalConditionsProvider.notifier).state = values,
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Fitness Goals Section
//                 _buildSectionCard(
//                   child: _buildCheckboxSection(
//                     title: t('profile_update.fitness_goals'),
//                     question: t('profile_update.fitness_goals_question'),
//                     options: [
//                       {'key': 'weight_loss', 'label': t('profile_update.weight_loss')},
//                       {'key': 'weight_gain', 'label': t('profile_update.weight_gain')},
//                       {'key': 'maintenance', 'label': t('profile_update.maintenance')},
//                     ],
//                     selectedValues: ref.watch(fitnessGoalsProvider),
//                     onChanged: (values) => ref.read(fitnessGoalsProvider.notifier).state = values,
//                   ),
//                 ),
                
//                 SizedBox(height: 18.h),
                
//                 // Lifestyle Habits Section
//                 _buildSectionCard(
//                   child: _buildRadioSection(
//                     title: t('profile_update.lifestyle_habits'),
//                     question: t('profile_update.lifestyle_question'),
//                     options: [
//                       {'key': '3_meals', 'label': t('profile_update.three_meals')},
//                       {'key': '4_meals', 'label': t('profile_update.four_meals')},
//                       {'key': '5_meals', 'label': t('profile_update.five_meals')},
//                     ],
//                     selectedValue: ref.watch(mealFrequencyProvider),
//                     onChanged: (value) => ref.read(mealFrequencyProvider.notifier).state = value,
//                   ),
//                 ),
                
//                 SizedBox(height: 32.h),
                
//                                  // Submit Button
//                  Center(
//                    child: SizedBox(
//                      width: 143.w,
//                      height: 35.h,
//                      child: ElevatedButton(
//                        onPressed: ref.watch(profileUpdateLoadingProvider) ? null : _handleContinue,
//                        style: ElevatedButton.styleFrom(
//                          backgroundColor: const Color(0xFF343F41),
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(3.43.r),
//                            side: const BorderSide(
//                              color: Color(0xFF767781),
//                              width: 0.69,
//                            ),
//                          ),
//                          padding: EdgeInsets.symmetric(horizontal: 10.w),
//                        ),
//                        child: ref.watch(profileUpdateLoadingProvider)
//                            ? SizedBox(
//                                width: 16.w,
//                                height: 16.w,
//                                child: CircularProgressIndicator(
//                                  strokeWidth: 2,
//                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                                ),
//                              )
//                            : Text(
//                               t('basic_info.submit'),
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 15.78.sp,
//                                 fontFamily: 'Outfit',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                      ),
//                    ),
//                  ),
                
//                 SizedBox(height: 32.h),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionCard({required Widget child}) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: const Color(0xFF3A4646),
//         borderRadius: BorderRadius.circular(6),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0x26000000),
//             blurRadius: 2,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(20),
//       child: child,
//     );
//   }

//   Widget _buildInputField({
//     required String label,
//     required TextEditingController controller,
//     required ValueChanged<String> onChanged,
//     required String suffix,
//     required IconData icon,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               width: 32.w,
//               height: 32.w,
//               decoration: BoxDecoration(
//                 color: const Color(0xFF343F41),
//                 borderRadius: BorderRadius.circular(8.r),
//                 border: Border.all(
//                   color: const Color(0xFF767781),
//                   width: 1,
//                 ),
//               ),
//               child: Icon(
//                 icon,
//                 color: const Color(0xFFA0A0A6),
//                 size: 18.sp,
//               ),
//             ),
//             SizedBox(width: 12.w),
//             Expanded(
//               child: Text(
//                 label,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16.sp,
//                   fontFamily: 'Outfit',
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 12.h),
//         Container(
//           width: double.infinity,
//           height: 48.h,
//           decoration: BoxDecoration(
//             color: const Color(0xFF343F41),
//             borderRadius: BorderRadius.circular(8.r),
//             border: Border.all(
//               color: const Color(0xFF767781),
//               width: 1,
//             ),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w),
//                   child: TextField(
//                     controller: controller,
//                     onChanged: onChanged,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16.sp,
//                       fontFamily: 'Outfit',
//                       fontWeight: FontWeight.w400,
//                     ),
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       hintText: '',
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 60.w,
//                 height: 48.h,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF263133),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(8.r),
//                     bottomRight: Radius.circular(8.r),
//                   ),
//                   border: Border(
//                     left: BorderSide(
//                       color: const Color(0xFF767781),
//                       width: 1,
//                     ),
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     suffix,
//                     style: TextStyle(
//                       color: const Color(0xFFA0A0A6),
//                       fontSize: 14.sp,
//                       fontFamily: 'Outfit',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDropdownField({
//     required String label,
//     required String value,
//     required List<String> items,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             color: const Color(0xFFA0A0A6),
//             fontSize: 13.sp,
//             fontFamily: 'Outfit',
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Container(
//           width: double.infinity,
//           height: 42.h,
//           decoration: BoxDecoration(
//             border: Border.all(color: const Color(0xFFA0A0A6), width: 1),
//             borderRadius: BorderRadius.circular(3.r),
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               value: value,
//               isExpanded: true,
//               items: items.map((item) => DropdownMenuItem(
//                 value: item,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 12.w),
//                   child: Text(
//                     item,
//                     style: TextStyle(
//                       color: const Color(0xFFA0A0A6),
//                       fontSize: 13.sp,
//                       fontFamily: 'Outfit',
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               )).toList(),
//               onChanged: onChanged,
//               icon: Icon(Icons.keyboard_arrow_down, color: const Color(0xFFA0A0A6), size: 20.sp),
//               dropdownColor: const Color(0xFF3A4646),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTextAreaField({
//     required String label,
//     required TextEditingController controller,
//     required ValueChanged<String> onChanged,
//     required String hint,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             color: const Color(0xFFA0A0A6),
//             fontSize: 13.sp,
//             fontFamily: 'Outfit',
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Container(
//           width: double.infinity,
//           height: 42.h,
//           decoration: BoxDecoration(
//             border: Border.all(color: const Color(0xFFA0A0A6), width: 1),
//             borderRadius: BorderRadius.circular(3.r),
//           ),
//           child: TextField(
//             controller: controller,
//             onChanged: onChanged,
//             maxLines: 1,
//             style: TextStyle(
//               color: const Color(0xFF767781),
//               fontSize: 13.sp,
//               fontFamily: 'Outfit',
//               fontWeight: FontWeight.w400,
//             ),
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(
//                 color: const Color(0xFF767781),
//                 fontSize: 13.sp,
//                 fontFamily: 'Outfit',
//                 fontWeight: FontWeight.w400,
//               ),
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRadioSection({
//     required String title,
//     required String question,
//     required List<Map<String, String>> options,
//     required String selectedValue,
//     required ValueChanged<String> onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.sp,
//             fontFamily: 'Outfit',
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           question,
//           style: TextStyle(
//             color: const Color(0xFFA0A0A6),
//             fontSize: 14.sp,
//             fontFamily: 'Outfit',
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//         SizedBox(height: 16.h),
//         ...options.map((option) => _buildRadioOption(
//           option: option['label']!,
//           isSelected: selectedValue == option['key'],
//           onChanged: (value) => onChanged(option['key']!),
//         )),
//       ],
//     );
//   }

//   Widget _buildRadioOption({
//     required String option,
//     required bool isSelected,
//     required ValueChanged<String> onChanged,
//   }) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () => onChanged(option),
//             child: Container(
//               width: 20.w,
//               height: 20.w,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.white, width: 1),
//               ),
//               child: isSelected
//                   ? Center(
//                       child: Container(
//                         width: 12.w,
//                         height: 12.w,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     )
//                   : null,
//             ),
//           ),
//           SizedBox(width: 12.w),
//           Text(
//             option,
//             style: TextStyle(
//               color: const Color(0xFFA0A0A6),
//               fontSize: 14.sp,
//               fontFamily: 'Outfit',
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCheckboxSection({
//     required String title,
//     required String question,
//     required List<Map<String, String>> options,
//     required Set<String> selectedValues,
//     required ValueChanged<Set<String>> onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.sp,
//             fontFamily: 'Outfit',
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           question,
//           style: TextStyle(
//             color: const Color(0xFFA0A0A6),
//             fontSize: 14.sp,
//             fontFamily: 'Outfit',
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//         SizedBox(height: 16.h),
//         ...options.map((option) => _buildCheckboxOption(
//           option: option['label']!,
//           isSelected: selectedValues.contains(option['key']),
//           onChanged: (isSelected) {
//             final newValues = Set<String>.from(selectedValues);
//             if (isSelected) {
//               newValues.add(option['key']!);
//             } else {
//               newValues.remove(option['key']!);
//             }
//             onChanged(newValues);
//           },
//         )),
//       ],
//     );
//   }

//   Widget _buildCheckboxOption({
//     required String option,
//     required bool isSelected,
//     required ValueChanged<bool> onChanged,
//   }) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () => onChanged(!isSelected),
//             child: Container(
//               width: 20.w,
//               height: 20.w,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.white, width: 1),
//               ),
//               child: isSelected
//                   ? Center(
//                       child: Container(
//                         width: 12.w,
//                         height: 12.w,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     )
//                   : null,
//             ),
//           ),
//           SizedBox(width: 12.w),
//           Text(
//             option,
//             style: TextStyle(
//               color: const Color(0xFFA0A0A6),
//               fontSize: 14.sp,
//               fontFamily: 'Outfit',
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _handleContinue() async {
//     // Set loading state
//     ref.read(profileUpdateLoadingProvider.notifier).state = true;
    
//     try {
//       // Validate required fields
//       if (!_validateForm()) {
//         return;
//       }
      
//       // Prepare profile data
//       final profileData = _prepareProfileData();
      
//       print('=== UPDATE PROFILE API DEBUG ===');
//       print('API URL: ${ApiConfig.patchProfileUrl}');
//       print('Request Method: PATCH');
//       print('Request Headers: Authorization Bearer + Content-Type: application/json');
//       print('=== REQUEST BODY DATA ===');
//       print('Profile Data: ${profileData.toString()}');
//       print('=== DETAILED REQUEST DATA ===');
//       profileData.forEach((key, value) {
//         print('$key: $value (${value.runtimeType})');
//       });
//       print('=== END REQUEST DATA ===');
      
//       // Make API call
//       final response = await ApiService.patchProfile(profileData: profileData);
      
//       print('=== API RESPONSE SUCCESS ===');
//       print('Response Status: 200 OK');
//       print('Response Data: ${response.toString()}');
//       print('=== DETAILED RESPONSE DATA ===');
//       response.forEach((key, value) {
//         print('$key: $value (${value.runtimeType})');
//       });
//       print('=== END RESPONSE DATA ===');
//       print('=== API CALL COMPLETED SUCCESSFULLY ===');
      
//       // Show success message
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               t('basic_info.profile_updated'),
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14.sp,
//                 fontFamily: 'Outfit',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             backgroundColor: const Color(0xFF343F41),
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.r),
//             ),
//             margin: EdgeInsets.all(16.w),
//             duration: const Duration(seconds: 2),
//           ),
//         );
//       }
      
//       // Navigate back
//       Navigator.of(context).pop();
      
//     } catch (e) {
//       print('=== API ERROR ===');
//       print('Error Type: ${e.runtimeType}');
//       print('Error Message: $e');
//       print('Error Details: ${e.toString()}');
//       print('=== END ERROR ===');
      
//       // Show error message
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               e.toString().replaceAll('ApiException: ', ''),
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14.sp,
//                 fontFamily: 'Outfit',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             backgroundColor: Colors.red,
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.r),
//             ),
//             margin: EdgeInsets.all(16.w),
//             duration: const Duration(seconds: 3),
//           ),
//         );
//       }
//     } finally {
//       // Reset loading state
//       ref.read(profileUpdateLoadingProvider.notifier).state = false;
//       print('=== LOADING STATE RESET ===');
//     }
//   }

 
 
 
//   bool _validateForm() {
//     final weight = ref.read(weightProvider);
//     final height = ref.read(heightProvider);
    
//     // Check if weight is provided and valid
//     if (weight.isEmpty) {
//       _showValidationError('Please enter your weight');
//       return false;
//     }
    
//     if (double.tryParse(weight) == null) {
//       _showValidationError('Please enter a valid weight');
//       return false;
//     }
    
//     // Check if height is provided and valid
//     if (height.isEmpty) {
//       _showValidationError('Please enter your height');
//       return false;
//     }
    
//     if (double.tryParse(height) == null) {
//       _showValidationError('Please enter a valid height');
//       return false;
//     }
    
//     return true;
//   }

//   void _showValidationError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 14.sp,
//             fontFamily: 'Outfit',
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         backgroundColor: Colors.orange,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//         margin: EdgeInsets.all(16.w),
//         duration: const Duration(seconds: 3),
//       ),
//     );
//   }

//   Map<String, dynamic> _prepareProfileData() {
//     // Get values from providers
//     final weight = ref.read(weightProvider).trim();
//     final height = ref.read(heightProvider).trim();
//     final workoutDuration = ref.read(workoutDurationProvider);
//     final fitnessLevel = ref.read(fitnessLevelProvider);
//     final trainingLocation = ref.read(trainingLocationProvider);
//     final injuries = ref.read(injuriesProvider).trim();
//     final dietaryPreference = ref.read(dietaryPreferenceProvider);
//     final mealFrequency = ref.read(mealFrequencyProvider);
//     final allergies = ref.read(allergiesProvider);
//     final foodPreferences = ref.read(foodPreferencesProvider);
//     final medicalConditions = ref.read(medicalConditionsProvider);
//     final fitnessGoals = ref.read(fitnessGoalsProvider);

//     // Convert sets to lists for API and ensure they're not empty
//     final allergiesList = allergies.isNotEmpty ? allergies.toList() : ['None'];
//     final foodPreferencesList = foodPreferences.isNotEmpty ? foodPreferences.toList() : ['None'];
//     final medicalConditionsList = medicalConditions.isNotEmpty ? medicalConditions.toList() : ['None'];
//     final fitnessGoalsList = fitnessGoals.isNotEmpty ? fitnessGoals.toList() : ['weight_loss'];

//     // Map training location to appropriate fields
//     List<String> atHome = [];
//     List<String> atGym = [];
//     List<String> martialArts = [];
//     List<String> running = [];
//     List<String> otherSports = [];

//     // Based on training location, populate the appropriate list
//     switch (trainingLocation) {
//       case 'At home':
//         atHome = ['Home workout routine'];
//         break;
//       case 'At gym':
//         atGym = ['Gym workout routine'];
//         break;
//       case 'Outdoor':
//         running = ['Outdoor running routine'];
//         break;
//       case 'Mixed':
//         atHome = ['Mixed home routine'];
//         atGym = ['Mixed gym routine'];
//         break;
//       default:
//         atGym = ['Gym workout routine']; // Default fallback
//     }

//     // Map dietary preference
//     String dietaryPref = 'No preferences';
//     switch (dietaryPreference) {
//       case 'keto':
//         dietaryPref = 'Keto';
//         break;
//       case 'paleo':
//         dietaryPref = 'Paleo';
//         break;
//       case 'no_preferences':
//         dietaryPref = 'No preferences';
//         break;
//       default:
//         dietaryPref = 'No preferences';
//     }

//     // Map meal frequency
//     String lifestyleHabits = '4 Meals';
//     switch (mealFrequency) {
//       case '3_meals':
//         lifestyleHabits = '3 Meals';
//         break;
//       case '4_meals':
//         lifestyleHabits = '4 Meals';
//         break;
//       case '5_meals':
//         lifestyleHabits = '5 Meals';
//         break;
//       default:
//         lifestyleHabits = '4 Meals';
//     }

//     // Map fitness level
//     String fitnessLevelMapped = 'Basic';
//     switch (fitnessLevel) {
//       case 'Beginner':
//         fitnessLevelMapped = 'Beginners';
//         break;
//       case 'Basic':
//         fitnessLevelMapped = 'Basic';
//         break;
//       case 'Intermediate':
//         fitnessLevelMapped = 'Intermediate';
//         break;
//       case 'Advanced':
//         fitnessLevelMapped = 'Advanced';
//         break;
//       default:
//         fitnessLevelMapped = 'Basic';
//     }

//     // Map fitness goals
//     String interestedWorkout = 'Lose Fat';
//     if (fitnessGoals.contains('weight_loss')) {
//       interestedWorkout = 'Lose Fat';
//     } else if (fitnessGoals.contains('weight_gain')) {
//       interestedWorkout = 'Gain Muscle';
//     } else if (fitnessGoals.contains('maintenance')) {
//       interestedWorkout = 'Maintenance';
//     }

//     // Ensure injuries field is not empty
//     final injuriesText = injuries.isNotEmpty ? injuries : 'None';

//     final profileData = {
//       'at_home': atHome,
//       'at_gym': atGym,
//       'martial_arts': martialArts,
//       'running': running,
//       'other_sports': otherSports,
//       'allergies': allergiesList,
//       'food_preference': foodPreferencesList,
//       'medical_conditions': medicalConditionsList,
//       'fitness_goals': fitnessGoalsList,
//       'fullname': '', // This will be empty as it's not collected in this screen
//       'gender': '', // This will be empty as it's not collected in this screen
//       'date_of_birth': '1990-01-01', // Default date to avoid format error
//       'weight': double.tryParse(weight) ?? 0.0,
//       'height': double.tryParse(height) ?? 0.0,
//       'abdominal': 0.0, // Default value as not collected in this screen
//       'sacroiliac': 0.0, // Default value as not collected in this screen
//       'subscapularis': 0.0, // Default value as not collected in this screen
//       'triceps': 0.0, // Default value as not collected in this screen
//       'fitness_level': fitnessLevelMapped,
//       'trainer': trainingLocation,
//       'train_duration': workoutDuration,
//       'interested_workout': interestedWorkout,
//       'injuries_discomfort': injuriesText,
//       'routine_duration': workoutDuration,
//       'dietary_preferences': dietaryPref,
//       'lifestyle_habits': lifestyleHabits,
//     };

//     return profileData;
//   }
// }
