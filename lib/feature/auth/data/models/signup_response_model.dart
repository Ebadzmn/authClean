import 'package:auth_system/feature/auth/data/models/user_model.dart';

class SignupResponseModel {
  final int code;
  final String status;
  final String msg;
  final UserModel data;

  SignupResponseModel(
      {required this.code,
      required this.status,
      required this.msg,
      required this.data});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      code: json['code'],
      status: json['status'],
      msg: json['msg'],
      data: UserModel.fromJson(json['data']),
    );
  }
}
