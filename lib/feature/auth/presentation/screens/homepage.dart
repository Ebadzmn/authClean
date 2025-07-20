import 'package:auth_system/feature/auth/data/models/user_model.dart';
import 'package:auth_system/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_system/feature/auth/presentation/screens/auth_gate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text('Name ${user.city}'),
          IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequest());
              },
              icon: Icon(Icons.logout_outlined))
        ],
      )),
    );
  }
}
