part of '../summery.dart';




// class _FeedbackSection extends StatelessWidget {
//   final userFeedback;

//   const _FeedbackSection({required this.userFeedback});

//   String _parseFeedbackText(String rawText) {
//     if (rawText.isEmpty) return '';
    
//     // Remove extra quotes and escape characters
//     String cleanedText = rawText;
    
//     print('=== PARSING FEEDBACK TEXT ===');
//     print('Step 1 - Original: $cleanedText');
    
//     // Remove the outer quotes and extra formatting
//     if (cleanedText.startsWith('"": "') && cleanedText.endsWith('",')) {
//       cleanedText = cleanedText.substring(5, cleanedText.length - 2);
//       print('Step 2 - After removing "": " and ",: $cleanedText');
//     } else if (cleanedText.startsWith('"') && cleanedText.endsWith('"')) {
//       cleanedText = cleanedText.substring(1, cleanedText.length - 1);
//       print('Step 3 - After removing outer quotes: $cleanedText');
//     }
    
//     // Remove any remaining ": " at the beginning
//     if (cleanedText.startsWith('": "')) {
//       cleanedText = cleanedText.substring(3);
//       print('Step 4 - After removing ": ": $cleanedText');
//     }
    
//     // Remove any remaining ", at the end
//     if (cleanedText.endsWith('",')) {
//       cleanedText = cleanedText.substring(0, cleanedText.length - 2);
//       print('Step 5 - After removing ",: $cleanedText');
//     }
    
//     // Remove any remaining quotes at the beginning and end
//     if (cleanedText.startsWith('"')) {
//       cleanedText = cleanedText.substring(1);
//       print('Step 6 - After removing leading quote: $cleanedText');
//     }
//     if (cleanedText.endsWith('"')) {
//       cleanedText = cleanedText.substring(0, cleanedText.length - 1);
//       print('Step 7 - After removing trailing quote: $cleanedText');
//     }
    
//     // Replace escaped newlines with actual newlines
//     cleanedText = cleanedText.replaceAll('\\n', '\n');
//     print('Step 8 - After replacing \\n: $cleanedText');
    
//     // Remove any remaining escape characters
//     cleanedText = cleanedText.replaceAll('\\"', '"');
//     cleanedText = cleanedText.replaceAll('\\\\', '\\');
    
//     // Clean up any extra whitespace
//     cleanedText = cleanedText.trim();
    
//     // Final cleanup - remove any remaining ", at the end
//     if (cleanedText.endsWith('",')) {
//       cleanedText = cleanedText.substring(0, cleanedText.length - 2);
//       print('Step 9 - Final cleanup removing ",: $cleanedText');
//     }
    
//     print('=== FINAL CLEANED TEXT ===');
//     print('Result: $cleanedText');
    
//     return cleanedText;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get current language without triggering provider rebuild
//     final currentLanguage = LocalizationService.getCurrentLanguage();
//     String rawFeedbackText = currentLanguage == 'es' 
//         ? userFeedback.feedbackEs 
//         : userFeedback.feedbackEn;
    
//     // Clean and parse the feedback text
//     String feedbackText = _parseFeedbackText(rawFeedbackText);

//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: const Color(0xFF2D393A),
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0x26000000),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.psychology,
//                 color: const Color(0xFF8BF0E6),
//                 size: 20,
//               ),
//               SizedBox(width: 8),
//               Text(
//                 t('summary.ai_feedback'),
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontFamily: 'Outfit',
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: -0.1,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           if (feedbackText.isNotEmpty)
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF1E2526),
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: const Color(0xFF8BF0E6).withOpacity(0.2),
//                   width: 1,
//                 ),
//               ),
//               child: MarkdownBody(
//                 data: feedbackText,
//                 styleSheet: MarkdownStyleSheet(
//                   p: TextStyle(
//                     color: const Color(0xFFA0A0A6),
//                     fontSize: 14,
//                     fontFamily: 'Outfit',
//                     fontWeight: FontWeight.w400,
//                     height: 1.6,
//                   ),
//                   textScaleFactor: 1.0,
//                 ),
//                 shrinkWrap: true,
//               ),
//             )
//                       else
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF1E2526),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.info_outline,
//                       color: const Color(0xFFA0A0A6),
//                       size: 20,
//                     ),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: Text(
//                         'No feedback available at the moment',
//                         style: TextStyle(
//                           color: const Color(0xFFA0A0A6),
//                           fontSize: 14,
//                           fontFamily: 'Outfit',
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//         ],
//       ),
//     );
//   }
// } 