import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kenvinorellana/application/header.dart';

import '../../common/api_handler.dart';
import '../../env.dart';
import 'models/daily_meal_plan.dart';
import 'models/daily_workout_plan.dart';

class SearchRepo {
  Future<Attempt<List<Recipe>>> getAllRecipe({
    // required String token,
    required String language,
  }) async {
    final String url = '$baseUrl/userapi/recipes/';

    // Set the headers for the request
    final Map<String, String> headers = await getAuthHeaders();

    try {
      // Send the POST request
      final response = await http.get(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final js = List<Map<String, dynamic>>.from(body);
        final List<Recipe> list = js.map((jsonItem) {
          return Recipe.fromJson(jsonItem);
        }).toList();
        return success(list);
      } else if (response.statusCode == 401) {
        return failed(Failure(title: "Invalid Email or Password"));
      } else {
        throw Exception('Failed to log in: ${response.body}');
      }
    } on SocketException {
      return failed(InternetFailure());
    } catch (e) {
      return failed(
        Failure(title: "Something went wrong. Please try again later."),
      );
    }
  }
  Future<Attempt<List<Workout>>> getAllWorkout({
    // required String token,
    required String language,
  }) async {
    final String url = '$baseUrl/userapi/all/workouts/';

    // Set the headers for the request
    final Map<String, String> headers = await getAuthHeaders();

    try {
      // Send the POST request
      final response = await http.get(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final js = List<Map<String, dynamic>>.from(body);
        final List<Workout> list = js.map((jsonItem) {
          return Workout.fromJson(jsonItem);
        }).toList();
        return success(list);
      } else if (response.statusCode == 401) {
        return failed(Failure(title: "Invalid Email or Password"));
      } else {
        throw Exception('Failed to log in: ${response.body}');
      }
    } on SocketException {
      return failed(InternetFailure());
    } catch (e) {
      return failed(
        Failure(title: "Something went wrong. Please try again later."),
      );
    }
  }
}
