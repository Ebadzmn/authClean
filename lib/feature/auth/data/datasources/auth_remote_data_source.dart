import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:auth_system/core/error/failure.dart';
import 'package:auth_system/feature/auth/data/models/loginResponseModel.dart';
import 'package:auth_system/feature/auth/data/models/signInRequestModel.dart';
import 'package:auth_system/feature/auth/data/models/signup_request_model.dart';
import 'package:auth_system/feature/auth/data/models/signup_response_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<Loginresponsemodel> login(Signinrequestmodel model);
  Future<SignupResponseModel> signUp(SignupRequestModel model);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<Loginresponsemodel> login(Signinrequestmodel model) async {
    final response = await client.post(
        Uri.parse('https://ecom-rs8e.onrender.com/api/auth/login'),
        headers: {'Content-Type': ' application/json '},
        body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return Loginresponsemodel.fromJson(decoded);
    } else {
      throw Exception('Login Failed');
    }
  }

  @override
  Future<SignupResponseModel> signUp(SignupRequestModel model) async {
    final response = await client.post(
        Uri.parse('https://ecom-rs8e.onrender.com/api/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(model.toJson()));

    final decoded = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return SignupResponseModel.fromJson(decoded);
    } else {
      final msg = decoded['msg'] ?? 'Sign Up Failed';
      throw ServerFailure(msg); // ✅ custom exception
    }
    // TODO: implement signUp
  }
}
