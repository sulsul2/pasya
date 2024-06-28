import 'dart:convert';
import 'package:pasya/ui/cart/data/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  Future<CartModel> getCart(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer $token',
    };

    final response = await http.get(
        Uri.parse('https://pasya-api.agilf.dev/api/Cart/$id'),
        headers: headers);

    if (response.statusCode == 200) {
      return CartModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
