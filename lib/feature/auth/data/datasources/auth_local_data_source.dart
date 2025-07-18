import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;

  AuthLocalDataSourceImpl({required this.prefs});

  static const String _tokenKey = "AUTH_TOKEN";

  @override
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
