import 'package:api_test/core/bloc/data_cubit/data_cubit.dart';
import 'package:api_test/core/bloc/data_cubit/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: Text(
              "Incorrect Email or Password",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<DataCubit>(context).emit(DataInitial());
              },
              child: const Text("BACK"))
        ],
      ),
    );
  }
}
