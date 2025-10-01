import 'dart:convert';
import 'dart:io';

import '/application/auth/models/user_info_models.dart';
import '/env.dart';

import '/common/api_handler.dart';
import 'package:http/http.dart' as http;
import 'models/user_credential.dart';

class AuthRepo {
  Future<Attempt<UserCredential>> login({
    required String email,
    required String password,
  }) async {
    final String url = '$baseUrl/login/';

    // Create the body of the POST request
    final Map<String, String> body = {"email": email, "password": password};

    // Set the headers for the request
    final Map<String, String> headers = {"Content-Type": "application/json"};

    try {
      // Send the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      // Check the status of the response
      if (response.statusCode == 200) {
        // If the server responds with a 200 OK, parse the response
        return success(UserCredential.fromJson(json.decode(response.body)));
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

  Future<Attempt<String>> sentOTP({required String email}) async {
    final String url = '$baseUrl/send-otp/';

    // Create the body of the POST request
    final Map<String, String> body = {"email": email};

    // Set the headers for the request
    final Map<String, String> headers = {"Content-Type": "application/json"};

    try {
      // Send the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final msg = jsonDecode(response.body);
        return success(msg["message"]);
      } else if (response.statusCode == 400) {
        return failed(Failure(title: "No user found with $email e-mail"));
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

  Future<Attempt<String>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final String url = '$baseUrl/verify-otp/';

    // Create the body of the POST request
    final Map<String, String> body = {"email": email, "otp": otp};

    // Set the headers for the request
    final Map<String, String> headers = {"Content-Type": "application/json"};

    try {
      // Send the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final msg = jsonDecode(response.body);
        return success(msg["message"]);
      } else if (response.statusCode == 400) {
        return failed(Failure(title: "No user found with $email e-mail"));
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

  Future<Attempt<String>> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final String url = '$baseUrl/reset-password/?email=$email';

    final Map<String, String> body = {
      "new_password": newPassword,
      "confirm_password": confirmPassword,
    };

    final Map<String, String> headers = {"Content-Type": "application/json"};

    try {
      // Send the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final msg = jsonDecode(response.body);
        return success(msg["message"]);
      } else if (response.statusCode == 400) {
        final error = jsonDecode(response.body);
        return failed(Failure(title: error["error"]));
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

  Future<Attempt<UserProfile>> getProfile({
    required String token,
    required String language,
  }) async {
    final String url = '$baseUrl/profile/get_profile_$language/';

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
        return success(UserProfile.fromJson(json.decode(response.body)));
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
