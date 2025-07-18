import 'dart:convert';

import 'package:auth_system/feature/auth/data/models/signInRequestModel.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<String> login(Signinrequestmodel model);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<String> login(Signinrequestmodel model) async {
    final response = await client.post(
        Uri.parse('https://ecom-rs8e.onrender.com/api/auth/login'),
        headers: {'Content-Type': ' application/json '},
        body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['data']['token'];
    } else {
      throw Exception('Login Failed');
    }
  }
}
