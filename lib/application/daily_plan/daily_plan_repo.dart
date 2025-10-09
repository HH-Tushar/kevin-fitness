import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../common/api_handler.dart';
import '../../env.dart';
import 'models/ai_gen_meals_plan.dart';
import 'models/ai_gen_workout_plans.dart';
import 'models/daily_meal_plan.dart';
import 'models/daily_plan_model.dart';
import 'models/daily_workout_plan.dart';
import 'models/today_meal_plan.dart';

class DailyPlanRepo {
  Future<Attempt<DailyPlans>> getDailyPlan({
    required String token,
    required String language,
  }) async {
    final String url = '$baseUrl/userapi/plans/today/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      // Send the POST request
      final response = await http.get(Uri.parse(url), headers: headers);

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

  Future<Attempt<DailyWorkoutPlanDetails>> getTodaysWorkoutPlan({
    required String token,
    required String language,
  }) async {
    final String url = '$baseUrl/userapi/workouts/today/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      // Send the POST request
      final response = await http.get(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        // If the server responds with a 200 OK, parse the response
        return success(
          DailyWorkoutPlanDetails.fromJson(json.decode(response.body)),
        );
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

  Future<Attempt<DailyWorkoutPlanDetails>> updateWorkoutPlanUnit({
    required String token,
    required int id,
  }) async {
    final String url = '$baseUrl/userapi/workout/update-today-entry/$id/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      // Send the POST request
      final response = await http.patch(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        // If the server responds with a 200 OK, parse the response
        return success(
          DailyWorkoutPlanDetails.fromJson(json.decode(response.body)),
        );
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

  Future<Attempt<TodayDailyMealPlans>> getTodaysMealPlan({
    required String token,
    required String language,
  }) async {
    final String url = '$baseUrl/userapi/meals/today/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      // Send the POST request
      final response = await http.get(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        // If the server responds with a 200 OK, parse the response
        return success(
          TodayDailyMealPlans.fromJson(json.decode(response.body)),
        );
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

  Future<Attempt<DailyMealPlanDetails>> getDailyMealPlanDetails({
    required String token,
    required String language,
    required int id,
  }) async {
    final String url = '$baseUrl/userapi/meal/day/$id/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      // Send the POST request
      final response = await http.get(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        // If the server responds with a 200 OK, parse the response
        return success(
          DailyMealPlanDetails.fromJson(json.decode(response.body)),
        );
      } else if (response.statusCode == 401) {
        return failed(SessionExpired());
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

  Future<Attempt<DailyWorkoutPlanDetails>> getDailyWorkOutPlanDetails({
    required String token,
    required String language,
    required int id,
  }) async {
    final String url = '$baseUrl/userapi/daily-workout/details/$id/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      // Send the POST request
      final response = await http.get(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        // If the server responds with a 200 OK, parse the response
        return success(
          DailyWorkoutPlanDetails.fromJson(json.decode(response.body)),
        );
      } else if (response.statusCode == 401) {
        return failed(SessionExpired());
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

  Future<Attempt<AiGeneratedMealPlans>> get15DaysMealPlan({
    required String token,
    required String language,
    required int id,
  }) async {
    // userapi/spanish/meal-plan/daywise/$id/
    final String url = '$baseUrl/userapi/spanish/meal-plan/daywise/$id/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      // Send the POST request
      final response = await http.get(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        // If the server responds with a 200 OK, parse the response
        return success(
          AiGeneratedMealPlans.fromJson(json.decode(response.body)),
        );
      } else if (response.statusCode == 401) {
        return failed(SessionExpired());
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

  Future<Attempt<AiGeneratedWorkOutPlans>> get15DaysWorkOutPlan({
    required String token,
    required String language,
    // required String id,
  }) async {
    // userapi/spanish/meal-plan/daywise/$id/
    final String url = '$baseUrl/userapi/active-workout-plan/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      // Send the POST request
      final response = await http.get(Uri.parse(url), headers: headers);

      // Check the status of the response
      if (response.statusCode == 200) {
        // If the server responds with a 200 OK, parse the response
        return success(
          AiGeneratedWorkOutPlans.fromJson(json.decode(response.body)),
        );
      } else if (response.statusCode == 401) {
        return failed(SessionExpired());
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

  Future<void> getUserSummery() async {
    // /userapi/achievement/details/
  }
  
}
