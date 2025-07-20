import 'package:auth_system/core/error/failure.dart';
import 'package:auth_system/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:auth_system/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth_system/feature/auth/data/models/loginResponseModel.dart';
import 'package:auth_system/feature/auth/data/models/signInRequestModel.dart';
import 'package:auth_system/feature/auth/data/models/signup_request_model.dart';
import 'package:auth_system/feature/auth/data/models/signup_response_model.dart';
import 'package:auth_system/feature/auth/data/models/user_model.dart';
import 'package:auth_system/feature/auth/domain/entities/user.dart';
import 'package:auth_system/feature/auth/domain/repositories/auth_repository.dart';
import 'package:auth_system/feature/auth/domain/usecases/login_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final LoginUser loginUser;
  final AuthLocalDataSource localDataSource;

  AuthBloc(this.loginUser, this.localDataSource, this.repository)
      : super(AuthInitial()) {
    on<LoginRequestEvent>(_onLoginRequest);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<LogoutRequest>(_onLogout);
    on<SignUpRequestEvent>(_onSignUpRequest);
  }

  Future<void> _onSignUpRequest(
      SignUpRequestEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await repository.signUp(event.model);
    result.fold((Failure) => emit(AuthError(Failure.message)),
        (response) => emit(SignUpSuccess(response)));
  }

  Future<void> _onLoginRequest(
      LoginRequestEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await loginUser(
        Signinrequestmodel(email: event.email, password: event.password));

    result.fold((Failure) => emit(AuthError(Failure.message)), (token) async {
      // await localDataSource.saveToken(token);
      emit(AuthSuccess(token));
    });
  }

  Future<void> _onCheckAuthStatus(
      CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    final token = await localDataSource.getToken();
    final user = await localDataSource.getUser();
    if (token != null && user != null) {
      // emit(AuthSuccess(token));
      final data = Loginresponsemodel(token: token, user: user);
      emit(AuthSuccess(data));
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> _onLogout(LogoutRequest event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('AUTH_TOKEN');
    emit(AuthLoggedOut());
  }
}
