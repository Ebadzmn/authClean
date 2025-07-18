import 'package:equatable/equatable.dart';

class Signinrequestmodel extends Equatable {
  final String email;
  final String password;

  Signinrequestmodel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
