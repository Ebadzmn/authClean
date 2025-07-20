import 'package:auth_system/core/error/failure.dart';
import 'package:auth_system/feature/auth/data/models/loginResponseModel.dart';
import 'package:auth_system/feature/auth/data/models/signInRequestModel.dart';
import 'package:auth_system/feature/auth/data/models/signup_request_model.dart';
import 'package:auth_system/feature/auth/data/models/signup_response_model.dart';
import 'package:auth_system/feature/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Loginresponsemodel>> login(Signinrequestmodel model);
  Future<Either<Failure, SignupResponseModel>> signUp(SignupRequestModel model);
}
