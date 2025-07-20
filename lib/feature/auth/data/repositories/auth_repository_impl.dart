import 'package:auth_system/core/error/failure.dart';
import 'package:auth_system/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:auth_system/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth_system/feature/auth/data/models/loginResponseModel.dart';
import 'package:auth_system/feature/auth/data/models/signInRequestModel.dart';
import 'package:auth_system/feature/auth/data/models/signup_request_model.dart';
import 'package:auth_system/feature/auth/data/models/signup_response_model.dart';
import 'package:auth_system/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource local;
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({required this.local, required this.remote});
  @override
  Future<Either<Failure, Loginresponsemodel>> login(
      Signinrequestmodel model) async {
    // TODO: implement login

    try {
      final loginResponse = await remote.login(model);
      await local.saveToken(loginResponse.token);
      await local.saveUser(loginResponse.user);
      return Right(loginResponse);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupResponseModel>> signUp(
      SignupRequestModel model) async {
    try {
      final response = await remote.signUp(model);
      return Right(response);
    } catch (e) {
      if (e is Failure) {
        return Left(ServerFailure(e.message)); // message from API
      } else {
        return Left(ServerFailure('Unexpected error: $e'));
      }
    }
  }
}
