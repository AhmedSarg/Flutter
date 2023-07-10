import 'dart:convert';

import 'package:api_test/features/model/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  String baseUrl = "https://dummyjson.com/users";
  late List<dynamic> result;
  late UserModel userModel;
  Future<UserModel> findPassforEmail(
      {required String email, required String password}) async {
    final dio = Dio();
    bool found = false;
    await dio.get(baseUrl).then((value) {
      value.data['users'].forEach((user) {
        if (user['email'] == email && user['password'] == password) {
          found = true;
          userModel = UserModel.fromJson(user);
        }
      });
    });
    if (!found) {
      throw Exception();
    }
    return userModel;
  }
}
