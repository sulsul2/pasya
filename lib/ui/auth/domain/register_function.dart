import 'dart:convert';
import 'package:http/http.dart' as http;
import './register_model.dart';

Future<Map<String, dynamic>> register(RegisterModel registerModel) async {
  final response = await http.post(
    Uri.parse('https://pasya-api.agilf.dev/api/Auth/Register'),
    body: jsonEncode(registerModel.toJson()),
    headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    },
  );

  if (response.statusCode != 200) {
    final responseBody = jsonDecode(response.body);
    throw Exception(responseBody['message']);
  } else {
    final responseBody = jsonDecode(response.body);
    return {
      'isSuccess': responseBody['isSuccess'],
      'statusCode': responseBody['statusCode'],
      'message': responseBody['message'],
      'timestamp': responseBody['timestamp'],
    };
  }
}