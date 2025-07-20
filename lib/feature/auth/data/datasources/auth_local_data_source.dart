import 'dart:convert';

import 'package:auth_system/feature/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;

  AuthLocalDataSourceImpl({required this.prefs});

  static const String _tokenKey = "AUTH_TOKEN";
  static const String _userKey = "AUTH_USER";

  @override
  Future<void> saveUser(UserModel user) async {
    final userJson = jsonEncode({
      'id': user.id,
      'first_name': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'phone': user.phone,
      'city': user.city,
      'avatarUrl': user.avatarUrl,
    });
    await prefs.setString(_userKey, userJson);
  }

  @override
  Future<UserModel?> getUser() async {
    final userJson = prefs.getString(_userKey);
    if (userJson == null) return null;
    final Map<String, dynamic> jsonMap = jsonDecode(userJson);
    return UserModel(
      id: jsonMap['id'],
      firstName: jsonMap['first_name'],
      lastName: jsonMap['lastName'],
      email: jsonMap['email'],
      phone: jsonMap['phone'],
      avatarUrl: '',
      city: jsonMap['city'],
    );
  }

  Future<void> clearToken() async {
    // TODO: implement clearToken
    await prefs.remove(_tokenKey);
  }

  @override
  Future<String?> getToken() async {
    // TODO: implement getToken
    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    await prefs.setString(_tokenKey, token);
  }
}
