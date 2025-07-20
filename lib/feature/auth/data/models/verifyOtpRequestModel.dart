import 'package:equatable/equatable.dart';

class Verifyotprequestmodel extends Equatable {
  final String email;
  final String otp;

  Verifyotprequestmodel({required this.email, required this.otp});

  Map<String, dynamic> toJson() => {'email': email, 'otp': otp};
  @override
  // TODO: implement props
  List<Object?> get props => [email, otp];
}
