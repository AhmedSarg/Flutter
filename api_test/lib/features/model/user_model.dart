class UserModel {
  final String email;
  final String password;
  final String firstName;

  UserModel(
      {required this.email, required this.password, required this.firstName});

  factory UserModel.fromJson(Map jsonData) {
    return UserModel(
        email: jsonData['email'],
        password: jsonData['password'],
        firstName: jsonData['firstName']);
  }
}
