import 'package:auth_system/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_system/feature/auth/presentation/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void _login() {
      BlocProvider.of<AuthBloc>(context).add(LoginRequestEvent(
          emailController.text.trim(), passwordController.text.trim()));
    }

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthSuccess) {
            Future.microtask(() {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
            });
          }
          return SafeArea(
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                ),
                TextField(
                  controller: passwordController,
                ),
                ElevatedButton(onPressed: _login, child: Text('Login'))
              ],
            ),
          );
        },
      ),
    );
  }
}
