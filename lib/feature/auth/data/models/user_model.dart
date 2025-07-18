import 'package:auth_system/feature/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String lastName,
    required String firstName,
    required String email,
    required String phone,
    required String avatarUrl,
    required String city,
  }) : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            avatarUrl: avatarUrl,
            city: city);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      firstName: json['first_Name'] ?? '',
      email: json['email'] ?? '',
      lastName: json['last_Name'] ?? '',
      phone: json['phone'] ?? '',
      avatarUrl: json['avatar_Url'] ?? '',
      city: json['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'first_Name': firstName,
      'last_Name': lastName,
      'email': email,
      'phone': phone,
      'avatar_Url': avatarUrl,
      'city': city,
    };
  }
}
