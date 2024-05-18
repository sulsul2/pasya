import 'dart:convert';
import 'package:http/http.dart' as http;
import './register_model.dart';
Future<void> register(RegisterModel registerModel) async {
  final response = await http.post(
    Uri.parse('https://pasya-api.agilf.dev/api/Auth/Register'),
    body: jsonEncode(registerModel.toJson()),
    headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    },
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to register');
  }
}