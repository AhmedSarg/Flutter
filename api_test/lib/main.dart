import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'api_session/view_model/cubits/home_cubit/home_cubit.dart';
import 'api_session_part_2/core/database/api/dio_consumer.dart';
import 'api_session_part_2/core/database/api/end_points.dart';
import 'api_session_part_2/core/services/service_locator.dart';
//import 'api_session_part_2/features/login_feature/model/login_model.dart';
import 'api_session_part_2/features/login_feature/screens/login_screen.dart';
//import 'state_management_session/counter_example/cubits/cubit.dart';

void main() {
  //  WidgetsFlutterBinding.ensureInitialized();
  //  print('s');
  //  List response = [];
  //  await http
  //      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'))
  //      .then((value) {
  //    response = jsonDecode(value.body);
  //    print(response[0]);
  //  }).catchError((e) => print(e.toString()));
  // List<Model>modelData= response.maSp((e) => Model.fromJson(e)).toList();
  // print (modelData[0].title);

// https://leap-teck.vercel.app/api/v1/user/signup

  // await serviceLocatorInit();

  // DioConsumer(client: Dio()).post(EndPoints.login, body: {
  //   "email": "anas423995@gmail.com",
  //   "password": "anas123",
  // }).then((value) => print(value));

  // 1.path
  // 2.body

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class Model {
  // {userId: 1, id: 1, title: quidem molestiae enim}
  final int userId;
  final int id;
  final String title;

  Model({required this.userId, required this.id, required this.title});

  factory Model.fromJson(Map jsonData) {
    return Model(
      userId: jsonData['userId'],
      id: jsonData['id'],
      title: jsonData['title'],
    );
  }
}
