import 'package:auth_system/core/error/failure.dart';
import 'package:auth_system/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:auth_system/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth_system/feature/auth/data/models/signInRequestModel.dart';
import 'package:auth_system/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource local;
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({required this.local, required this.remote});
  @override
  Future<Either<Failure, String>> login(Signinrequestmodel model) async {
    // TODO: implement login

    try {
      final token = await remote.login(model);
      await local.saveToken(token);
      return Right(token);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
