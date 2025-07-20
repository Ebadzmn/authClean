import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Otppage extends StatelessWidget {
  final String email;
  const Otppage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text('Otp Sent TO ${email}'),
      )),
    );
  }
}
