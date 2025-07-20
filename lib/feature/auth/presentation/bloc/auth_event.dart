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

class SignUpRequestEvent extends AuthEvent {
  final SignupRequestModel model;

  SignUpRequestEvent(this.model);
  // final String email;
  // final String password;
  // final String firstName;
  // final String lastName;
  // final String city;
  // final String phone;

  // SignUpRequestEvent(
  //     {required this.email,
  //     required this.password,
  //     required this.firstName,
  //     required this.lastName,
  //     required this.city,
  //     required this.phone});

  // List<Object> get props => [email, password, firstName, lastName, phone, city];
}

class CheckAuthStatusEvent extends AuthEvent {}

class LogoutRequest extends AuthEvent {}
