import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  if (token == null) {
    throw Exception('No token found');
  }
  return token;
}


Map<String, dynamic> decodeToken(String token) {
  Map<String, dynamic> payload = JwtDecoder.decode(token);
  return payload;
}

String getUserIdFromToken(String token){
  Map<String, dynamic> payload = decodeToken(token); // Decode the token
  String nameid = payload['nameid'];
  return nameid;
}