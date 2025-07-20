import 'package:auth_system/feature/auth/data/models/signup_request_model.dart';
import 'package:auth_system/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_system/feature/auth/presentation/screens/otpPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print("🔄 State changed: $state");
          if (state is SignUpSuccess) {
            print('SignUp Success777777777777777');
            final email = state.data.data.email;
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => Otppage(email: email)));
          } else if (state is AuthError) {
            print("❌ Signup failed: ${state.message}");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          body: Signup_form(),
        ));
  }
}

class Signup_form extends StatelessWidget {
  Signup_form({
    super.key,
  });
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void SignUpClick() {
      final model = SignupRequestModel(
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          password: passwordController.text,
          phone: phoneController.text,
          city: cityController.text,
          avatarUrl: '');

      BlocProvider.of<AuthBloc>(context).add(SignUpRequestEvent(model));
    }

    return Column(
      children: [
        TextField(
            controller: firstNameController,
            decoration: const InputDecoration(labelText: 'First Name')),
        TextField(
            controller: lastNameController,
            decoration: const InputDecoration(labelText: 'Last Name')),
        TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email')),
        TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password')),
        TextField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: 'Phone')),
        TextField(
            controller: cityController,
            decoration: const InputDecoration(labelText: 'City')),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: SignUpClick, child: Text('Submit'))
      ],
    );
  }
}
