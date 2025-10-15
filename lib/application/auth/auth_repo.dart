import 'dart:convert';
import 'dart:io';

import '/application/auth/models/user_info_models.dart';
import '/env.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:async';
import '/common/api_handler.dart';
import 'package:http/http.dart' as http;
import 'models/user_credential.dart';
import 'models/user_profile_model.dart';

class TokenReGen {
  final String accessToken;
  final String refreshToken;
  const TokenReGen({required this.accessToken, required this.refreshToken});
}

class AuthRepo {
  Future<Attempt<TokenReGen>> refreshToken({required String refresh}) async {
    final String url = '$baseUrl/token/refresh/';
    final Map<String, String> body = {"refresh": refresh};
    final Map<String, String> headers = {"Content-Type": "application/json"};
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return success(
          TokenReGen(
            accessToken: body["access"],
            refreshToken: body["refresh"],
          ),
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

  Future<Attempt<UserCredential>> register({
    required String email,
    required String password,
  }) async {
    final String url = '$baseUrl/register/';

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
      if (response.statusCode == 201) {
        // If the server responds with a 200 OK, parse the response
        return success(UserCredential.fromJson(json.decode(response.body)));
      } else if (response.statusCode == 401) {
        return failed(Failure(title: "Invalid Email or Password"));
      } else {
        final res = jsonDecode(response.body);
        return failed(Failure(title: res["error"]));
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
        final msg = jsonDecode(response.body);
        return failed(Failure(title: msg["error"]));
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
      final response = await http.get(Uri.parse(url), headers: headers);

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

  Future<Attempt<UserProfile>> updateProfile({
    required String token,
    required String language,
    required UserProfile userProfile,
    File? image,
  }) async {
    final String url = '$baseUrl/profile/patch_profile_$language/';

    // Set the headers for the request
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      http.Response response;
      //if have image
      if (image != null) {
        final request = http.MultipartRequest('PATCH', Uri.parse(url));
        request.headers['Authorization'] = headers['Authorization']!;
        final fileStream = http.ByteStream(image.openRead());
        final fileLength = await image.length();
        final multipartFile = http.MultipartFile(
          'image',
          fileStream,
          fileLength,
          filename: image.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        );
        request.files.add(multipartFile);

        // final dataWithoutImage = Map<String, dynamic>.from(
        //   userProfile.toJson(),
        // );
        // dataWithoutImage.remove('image');

        // dataWithoutImage.forEach((key, value) {
        //   if (value != null && value.toString().isNotEmpty) {
        //     request.fields[key] = value.toString();
        //   }
        // });

        final streamedResponse = await request.send().timeout(
          const Duration(seconds: 30),
        );
        response = await http.Response.fromStream(streamedResponse);
      } else {
        final bodyData = userProfile.toJson();
        bodyData.remove("image");
        print(bodyData);
        response = await http.patch(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(bodyData),
        );
      }

      // Check the status of the response
      if (response.statusCode == 200) {
        return success(UserProfile.fromJson(json.decode(response.body)));
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

  Future<Attempt<UserInfo>> getUserInfo({
    required String token,
    required String language,
  }) async {
    final String url = '$baseUrl/userapi/user/info/$language/';

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
        final body = jsonDecode(response.body);
        print(body);
        return success(UserInfo.fromJson(json.decode(response.body)));
      } else if (response.statusCode == 401) {
        return failed(Failure(title: "Invalid Email or Password"));
      } else {
        throw Exception('Failed to log in: ${response.body}');
      }
    } on SocketException {
      return failed(InternetFailure());
    } catch (e) {
      // dPrint(e.toString());
      return failed(
        Failure(title: "Something went wrong. Please try again later."),
      );
    }
  }
}
