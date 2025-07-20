import 'package:auth_system/feature/auth/data/models/user_model.dart';

class Loginresponsemodel {
  final String token;
  final UserModel user;

  Loginresponsemodel({required this.token, required this.user});

  factory Loginresponsemodel.fromJson(Map<String, dynamic> json) {
    return Loginresponsemodel(
        token: json['data']['token'],
        user: UserModel.fromJson(json['data']['user']));
  }
}
