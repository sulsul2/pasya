import 'dart:convert';
import 'package:pasya/ui/cart/data/cart_model.dart';
import 'package:http/http.dart' as http;

class CartService {
  Future<CartModel> getCart(int id) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJhMjJlZjkzYy0yNWQwLTRmNjItYmE2Ny1kNjhhZWI4NDVjZTMiLCJ1bmlxdWVfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJyb2xlIjoiQWRtaW4iLCJuYmYiOjE3MTU2MDk3OTQsImV4cCI6MTcxODIwMTc5NCwiaWF0IjoxNzE1NjA5Nzk0LCJpc3MiOiJMZW1vblNvbHV0aW9ucyIsImF1ZCI6IlBBU1lBIn0.Zi5cUup-t7RV4Qr6hv1nwFw9fsbq5hsO5cgbV6hyu-4',
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
