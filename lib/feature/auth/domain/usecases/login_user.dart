import 'package:auth_system/core/error/failure.dart';
import 'package:auth_system/feature/auth/data/models/signInRequestModel.dart';
import 'package:auth_system/feature/auth/domain/entities/user.dart';
import 'package:auth_system/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, String>> call(Signinrequestmodel model) {
    return repository.login(model);
  }
}
