import 'package:kenvinorellana/common/api_handler.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kenvinorellana/application/header.dart';

import '../../env.dart';
import 'summery_model.dart';

class SummeryRepo {
  Future<Attempt<UserAchievementModel>> getUserAchievement() async {
    final String url = '$baseUrl/userapi/achievement/details/';

    // Set the headers for the request
    final Map<String, String> headers = await getAuthHeaders();

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return success(UserAchievementModel.fromJson(body));
      } else if (response.statusCode == 401) {
        return failed(SessionExpired());
      } else {
        throw Exception('Failed to fetch Data: ${response.body}');
      }
    } on SocketException {
      return failed(InternetFailure());
    } catch (e) {
      return failed(
        Failure(title: "Something went wrong. Please try again later."),
      );
    }
  }

  Future<Attempt<UserAchievementModel>> getUserFeedback() async {
    final String url = '$baseUrl/userapi/user/feedback/';

    // Set the headers for the request
    final Map<String, String> headers = await getAuthHeaders();

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return success(UserAchievementModel.fromJson(body));
      } else if (response.statusCode == 401) {
        return failed(SessionExpired());
      } else {
        throw Exception('Failed to fetch Data: ${response.body}');
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
