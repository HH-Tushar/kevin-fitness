import 'dart:convert';
import 'dart:io';

import '../header.dart';
import '/env.dart';

import '/common/api_handler.dart';
import 'package:http/http.dart' as http;

import 'subscription_model.dart';

class SubscriptionRepo {
  Future<Attempt<SubscriptionModel>> getPackages() async {
    final String url = '$baseUrl/packages/';
    final headers = await getAuthHeaders();
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return success(SubscriptionModel.fromJson(body));
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

  // Create checkout session
  Future<Attempt<String>> createCheckoutSession({
    required String priceId,
  }) async {
    try {
      final headers = await getAuthHeaders();

      final response = await http
          .post(
            Uri.parse("$baseUrl/subscription/create-checkout-session/"),
            headers: headers,
            body: jsonEncode({'price_id': priceId}),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        print('Checkout session created successfully');
        print('Response Data: $responseData');
        return success(responseData["url"]);
      } else {
        final errorBody = jsonDecode(response.body);
        String errorMessage = 'Failed to create checkout session';

        print('Error Response: $errorBody');

        if (errorBody is Map<String, dynamic>) {
          if (errorBody.containsKey('detail')) {
            errorMessage = errorBody['detail'];
          } else if (errorBody.containsKey('message')) {
            errorMessage = errorBody['message'];
          } else if (errorBody.containsKey('non_field_errors')) {
            errorMessage = errorBody['non_field_errors'][0];
          } else {
            // Use first error found
            final firstError = errorBody.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              errorMessage = firstError.first.toString();
            } else if (firstError is String) {
              errorMessage = firstError;
            }
          }
        }
        return failed(Failure(title: "Unable to create payment data."));
      }
    } on SocketException {
      return failed(Failure(title: "No internet"));
    } catch (e) {
      return failed(Failure(title: "Something went wrong"));
    }
  }
}
