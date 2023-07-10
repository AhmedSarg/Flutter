import 'package:dio/dio.dart';

class UserService {
  String baseUrl = "https://dummyjson.com/users";
  late List<dynamic> result;

  Future<String> findPassforEmail(
      {required String email, required String password}) async {
    String message = "Incorrect email or password";
    final dio = Dio();
    final response = await dio.get(baseUrl).then((value) {
      value.data['users'].forEach((user) {
        if (user['email'] == email && user['password'] == password) {
          message = "Login Successful";
        }
      });
    });
    return message;
  }
}
