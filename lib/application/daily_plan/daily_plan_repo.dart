import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../common/api_handler.dart';
import '../../env.dart';
import 'daily_plan_model.dart';

class DailyPlanRepo {
  Future<Attempt<DailyPlans>> getProfile({
    required String token,
    required String language,
  }) async {
    final String url = '$baseUrl/userapi/$language/plans/today/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      // Send the POST request
      final response = await http.post(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        // If the server responds with a 200 OK, parse the response
        return success(DailyPlans.fromJson(json.decode(response.body)));
      } else if (response.statusCode == 401) {
        return failed(Failure(title: "Invalid Email or Password"));
      } else {
        throw Exception('Failed to log in: ${response.body}');
      }
    } on SocketException {
      return failed(InternetFailure());
    } catch (e) {
      dPrint(e.toString());
      return failed(
        Failure(title: "Something went wrong. Please try again later."),
      );
    }
  }
}
