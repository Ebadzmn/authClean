import 'package:auth_system/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:auth_system/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth_system/feature/auth/data/models/user_model.dart';
import 'package:auth_system/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:auth_system/feature/auth/domain/repositories/auth_repository.dart';
import 'package:auth_system/feature/auth/domain/usecases/login_user.dart';
import 'package:auth_system/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth_system/feature/auth/presentation/screens/auth_gate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    // Datasources & Repository Setup
    final localDataSource = AuthLocalDataSourceImpl(prefs: prefs);
    final remoteDataSource = AuthRemoteDataSourceImpl(http.Client());
    final repository = AuthRepositoryImpl(
      local: localDataSource,
      remote: remoteDataSource,
    );
    final loginUser = LoginUser(repository);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(loginUser, localDataSource, repository)
            ..add(CheckAuthStatusEvent()), // ✅ Check if user is logged in
        ),
      ],
      child: MaterialApp(
        home: AuthGatePage(),
      ),
    );
  }
}
