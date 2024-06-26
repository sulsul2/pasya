import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pasya/providers/login_provider.dart';

Future<Map<String, dynamic>> fetchUserData() async {
    // Get the token
    final String token = await getToken();

    // Extract userId from the token (assuming getUserIdFromToken is a function that does this)
    final String userId = getUserIdFromToken(token);

    // Define the headers
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
      Uri.parse('https://pasya-api.agilf.dev/api/User/$userId'),
      headers: headers,
    );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON.
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    if (jsonResponse['isSuccess']) {
      // Access the data in the success response
      Map<String, dynamic> userData = jsonResponse['data'];
      print('User data: $userData');
      return userData;
    } else {
      print('Request failed with message: ${jsonResponse['message']}');
      throw Exception('Request failed with message: ${jsonResponse['message']}');
    }
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load user data');
  }
}
Future<void> uploadImage() async {
  final storageRef = FirebaseStorage.instance.ref();
  // Create a reference to "mountains.jpg"
  final mountainsRef = storageRef.child("mountains.jpg");

  // Create a reference to 'images/mountains.jpg'
  final mountainImagesRef = storageRef.child("images/mountains.jpg");
  
  // While the file names are the same, the references point to different files
  assert(mountainsRef.name == mountainImagesRef.name);
  assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
}