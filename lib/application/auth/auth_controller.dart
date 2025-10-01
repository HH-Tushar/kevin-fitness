import 'package:flutter/material.dart';

import '../../common/api_handler.dart';
import 'auth_repo.dart';
import 'models/user_credential.dart';


class AuthController extends ChangeNotifier {
  UserCredential? _userCredential;
  bool get isLogin => _userCredential != null;
  String? get accessToken => _userCredential?.access;
  final AuthRepo authRepo = AuthRepo();

  Future<Attempt<UserCredential>> login({
    required String email,
    required String password,
  }) async {
    final (response, error) = await authRepo.login(
      email: email,
      password: password,
    );

    if (response != null) {
      _userCredential = response;
      //call others function for home page and notify here

      return success(response);
      // save in local and notify listeners
    } else {
      return failed(error!);
    }
  }
}
