import 'dart:convert';
import 'package:http/http.dart' as http;
import 'LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LoginModel> login(String email, String password) async {
  var body = jsonEncode({
    'email': email,
    'password': password
  });

  final response = await http.post(
      Uri.parse('https://pasya-api.agilf.dev/api/Auth/Login'),
      body: body,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      }
  );

  if (response.statusCode == 200) {
    final loginModel = LoginModel.fromJson(jsonDecode(response.body));
    // Store the token
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', loginModel.token);
    return loginModel;
  } else {
    throw Exception('Failed to login');
  }
}