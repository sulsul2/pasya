import 'dart:convert';
import 'package:http/http.dart' as http;
import 'LoginModel.dart';

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
    return LoginModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to login');
  }
}