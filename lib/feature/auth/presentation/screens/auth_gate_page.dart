import 'package:auth_system/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_system/feature/auth/presentation/screens/homepage.dart';
import 'package:auth_system/feature/auth/presentation/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGatePage extends StatelessWidget {
  const AuthGatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is AuthSuccess) {
        return HomePage();
      } else {
        return Loginpage();
      }
    });
  }
}
