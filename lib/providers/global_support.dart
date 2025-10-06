// import 'package:flutter/material.dart';

// typedef ApiSyncCallback = Future<void> Function(String newLanguage);

// // --- 1. Global Sync Service (The Orchestrator) ---
// // This class manages and coordinates all functions that need to run
// // when the global state (language) changes.
// class GlobalSyncService with ChangeNotifier {
//   final List<ApiSyncCallback> _callbacks = [];

//   // Used by other Providers to add their fetch functions to the list
//   void registerCallback(ApiSyncCallback callback) {
//     _callbacks.add(callback);
//     print('✅ GlobalSyncService: Registered a new callback.');
//   }

//   // Called by LanguageProvider when the language changes
//   void synchronize(String newLanguage) {
//     print(
//       '\n🚀 GlobalSyncService: Initiating sync for language: $newLanguage...',
//     );
//     for (final callback in _callbacks) {
//       // Execute the registered functions
//       callback(newLanguage);
//     }
//   }
// }
