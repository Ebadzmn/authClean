import 'package:equatable/equatable.dart';

class SignupRequestModel extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String phone;
  final String city;
  final String? avatarUrl;

  SignupRequestModel({
    required this.email,
    this.avatarUrl,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phone,
    required this.city,
  });

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'phone': phone,
        'city': city,
        'avatar_url': avatarUrl,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
