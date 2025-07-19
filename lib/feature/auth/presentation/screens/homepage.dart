import 'package:auth_system/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_system/feature/auth/presentation/screens/auth_gate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text('This is home page'),
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
