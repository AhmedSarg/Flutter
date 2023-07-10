import 'package:api_test/core/bloc/data_cubit/data_cubit.dart';
import 'package:api_test/core/bloc/data_cubit/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Login Successfully",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Welcome Back ${BlocProvider.of<DataCubit>(context).loggedUser.firstName}",
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<DataCubit>(context).emit(DataInitial());
                },
                child: const Text("BACK")),
          )
        ],
      ),
    );
  }
}
