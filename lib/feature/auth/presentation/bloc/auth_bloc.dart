import 'package:auth_system/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:auth_system/feature/auth/data/models/signInRequestModel.dart';
import 'package:auth_system/feature/auth/domain/usecases/login_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final AuthLocalDataSource localDataSource;
  AuthBloc(this.loginUser, this.localDataSource) : super(AuthInitial()) {
    on<LoginRequestEvent>(_onLoginRequest);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<LogoutRequest>(_onLogout);
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
    if (token != null && token.isNotEmpty) {
      emit(AuthSuccess(token));
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
