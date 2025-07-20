import 'package:auth_system/core/error/failure.dart';
import 'package:auth_system/feature/auth/data/models/loginResponseModel.dart';
import 'package:auth_system/feature/auth/data/models/signInRequestModel.dart';
import 'package:auth_system/feature/auth/data/models/signup_request_model.dart';
import 'package:auth_system/feature/auth/data/models/signup_response_model.dart';
import 'package:auth_system/feature/auth/domain/entities/user.dart';
import 'package:auth_system/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, Loginresponsemodel>> call(Signinrequestmodel model) {
    return repository.login(model);
  }
}

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<Either<Failure, SignupResponseModel>> call(SignupRequestModel model) {
    return repository.signUp(model);
  }
}
