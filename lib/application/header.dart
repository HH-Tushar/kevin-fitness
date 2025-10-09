   import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, String>> getAuthHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }