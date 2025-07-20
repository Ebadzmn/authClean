part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

class AuthLoggedOut extends AuthState {}

final class AuthSuccess extends AuthState {
  final Loginresponsemodel data;

  AuthSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class SignUpSuccess extends AuthState {
  final SignupResponseModel data;

  SignUpSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
  @override
  List<Object> get props => [message];
}
