import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kenvinorellana/env.dart';


import '../../presentation/chat/chat_view.dart';
import '../header.dart';

class ChatRepo {
  static Stream<String> chatAiStream({
    required String message,
    required String sessionId,
  }) async* {
    try {
      final headers = await getAuthHeaders();

      print('Headers: $headers');
      print(
        'Request Body: ${jsonEncode({"message": message, "session_id": sessionId})}',
      );

      final request = http.Request('POST', Uri.parse("$baseUrl/chat/Ai/"));
      request.headers.addAll(headers);
      request.body = jsonEncode({"message": message, "session_id": sessionId});

      final streamedResponse = await request.send().timeout(
        const Duration(seconds: 60),
      );

      print('Response Status: ${streamedResponse.statusCode}');

      if (streamedResponse.statusCode == 200) {
        await for (final chunk in streamedResponse.stream.transform(
          utf8.decoder,
        )) {
          print('Received chunk: $chunk');
          yield chunk;
        }
      } else {
        final errorBody = await streamedResponse.stream.bytesToString();
        print('Error Response: $errorBody');

        String errorMessage = 'Failed to get AI response';
        try {
          final errorJson = jsonDecode(errorBody);
          if (errorJson is Map<String, dynamic>) {
            if (errorJson.containsKey('detail')) {
              errorMessage = errorJson['detail'];
            } else if (errorJson.containsKey('message')) {
              errorMessage = errorJson['message'];
            }
          }
        } catch (e) {
          errorMessage = 'Server error: ${streamedResponse.statusCode}';
        }

        throw ApiException(
          message: errorMessage,
          statusCode: streamedResponse.statusCode,
        );
      }
    } on SocketException {
      throw ApiException(
        message: 'No internet connection. Please check your network.',
        statusCode: 0,
      );
    } on HttpException {
      throw ApiException(
        message: 'Server error. Please try again later.',
        statusCode: 0,
      );
    } on TimeoutException {
      throw ApiException(
        message: 'Request timed out. Please try again.',
        statusCode: 0,
      );
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException(
        message: 'Network error: ${e.toString()}',
        statusCode: 0,
      );
    }
  }
}
