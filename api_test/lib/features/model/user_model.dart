class UserModel {
  final String email;
  final String password;

  UserModel({required this.email, required this.password});

  factory UserModel.fromJson(Map jsonData) {
    return UserModel(email: jsonData['email'], password: jsonData['password']);
  }
}
