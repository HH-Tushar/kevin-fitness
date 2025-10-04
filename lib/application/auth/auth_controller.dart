import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/api_handler.dart';
import 'auth_repo.dart';
import 'models/user_credential.dart';
import 'models/user_info_models.dart';
import 'models/user_profile_model.dart';

class AuthController extends ChangeNotifier {
  AuthController() {
    retrieveUser();
  }
  UserCredential? _userCredential;
  UserProfile? _userProfile;
  UserInfo? _userInfo;
  bool get isLogin => _userCredential != null;
  UserProfile? get userProfile => _userProfile;
  UserInfo? get getUserInfo => _userInfo;
  String? get accessToken => _userCredential?.access;

  //implementation
  final AuthRepo authRepo = AuthRepo();

  retrieveUser() async {
    final data = await UserCredentialStorage.load();
    if (data != null) {
      _userCredential = data;
      refreshToken();
      await fetchProfile(token: data.access);
      await fetchUserInfo();
      notifyListeners();
    }
  }

  Future<void> onLanguageChange() async {
    await fetchUserInfo();
    await fetchProfile(token: _userCredential!.access);
  }

  Future<String?> refreshToken() async {
    final (data, error) = await authRepo.refreshToken(
      refresh: _userCredential!.refresh,
    );
    if (data != null) {
      _userCredential?.access = data.accessToken;
      _userCredential?.refresh = data.refreshToken;
      UserCredentialStorage.save(_userCredential!);
      notifyListeners();
      return data.accessToken;
    } else {
      _userCredential = null;
      UserCredentialStorage.clear();
      notifyListeners();
      return null;
    }
  }

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
      UserCredentialStorage.save(response);
      await fetchUserInfo();
      //call others function for home page and notify here
      return success(response);
      // save in local and notify listeners
    } else {
      return failed(error!);
    }
  }

  Future<void> fetchUserInfo() async {
    final (data, error) = await authRepo.getUserInfo(
      token: _userCredential!.access,
      language: "language",
    );
    if (data != null) {
      _userInfo = data;
    }
    notifyListeners();
  }

  Future<Attempt<UserProfile>> fetchProfile({required String token}) async {
    final (response, error) = await authRepo.getProfile(
      language: "email",
      token: token,
    );
    if (response != null) {
      _userProfile = response;
      return success(response);
      // save in local and notify listeners
    } else {
      return failed(error!);
    }
  }

  Future<bool> logout() async {
    await UserCredentialStorage.clear();
    _userCredential = null;
    notifyListeners();
    return true;
  }
}

class UserCredentialStorage {
  static const _key = 'user_credential';

  /// Save UserCredential to SharedPreferences
  static Future<void> save(UserCredential credential) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, credential.toRawJson());
  }

  /// Load UserCredential from SharedPreferences
  static Future<UserCredential?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return null;
    return UserCredential.fromJson(json.decode(jsonString));
  }

  /// Remove UserCredential from SharedPreferences
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
