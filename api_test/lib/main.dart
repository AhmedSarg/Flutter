import 'package:api_test/core/bloc/data_cubit/data_cubit.dart';
import 'package:api_test/core/services/user_service.dart';
import 'package:api_test/features/screens/login_screen.dart';
import 'package:api_test/features/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/data_cubit/data_state.dart';
import 'features/screens/failure_screen.dart';
import 'features/screens/loading_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return DataCubit(UserService());
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Data from API Task"),
        ),
        body: BlocBuilder<DataCubit, DataState>(
          builder: ((context, state) {
            if (state is DataLoading) {
              return const LoadingScreen();
            } else if (state is DataSuccess) {
              return const SuccessScreen();
            } else if (state is DataFailure) {
              return const FailureScreen();
            } else {
              return const LoginScreen();
            }
          }),
        ),
      ),
    );
  }
}
