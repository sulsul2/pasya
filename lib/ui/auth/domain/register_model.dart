class RegisterModel {
  final String name;
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterModel({
    required this.name,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'userName': userName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

}