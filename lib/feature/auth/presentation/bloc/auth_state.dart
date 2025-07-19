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
  final String token;

  AuthSuccess(this.token);
  @override
  List<Object> get props => [token];
}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
  @override
  List<Object> get props => [message];
}
