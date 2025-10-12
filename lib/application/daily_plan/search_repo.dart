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
        return failed(SessionExpired());
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
        return failed(SessionExpired());
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

  Future<Attempt<String>> postWorkoutPlan({
    required Map<String, dynamic> workoutData,
  }) async {
    final String url = '$baseUrl/userapi/workout-plans/generate/';

    // Set the headers for the request
    final Map<String, String> headers = await getAuthHeaders();

    try {
      // Send the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(workoutData),
      );

      // Check the status of the response
      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        print(body);
        return success("Successfully created workout plan");
      } else if (response.statusCode == 401) {
        return failed(SessionExpired());
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

  Future<Attempt<String>> reqMealPlan() async {
    final String url = '$baseUrl/userapi/meal-plans/generate/';
    final Map<String, String> headers = await getAuthHeaders();

    try {
      // Send the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        // body: jsonEncode(workoutData),
      );
      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        print(body);
        return success("Successfully created Meal plan");
      } else if (response.statusCode == 401) {
        return failed(SessionExpired());
      } else if (response.statusCode == 409) {
        return failed(
          Failure(
            title:
                "You already have an active meal plan. Please refresh the page if not visible.",
            code: 409,
          ),
        );
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
