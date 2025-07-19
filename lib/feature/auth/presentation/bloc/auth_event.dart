part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequestEvent extends AuthEvent {
  final String email;
  final String password;

  LoginRequestEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class CheckAuthStatusEvent extends AuthEvent {}

class LogoutRequest extends AuthEvent {}
