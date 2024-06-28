import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pasya/ui/detailProduct/data/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  Future<List<ProductModel>> getProduct() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer $token',
    };

    final response = await http.get(
        Uri.parse(
            'https://pasya-api.agilf.dev/api/Product?PageNumber=1&PageSize=10'),
        headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'] as List;
      List<ProductModel> products =
          List<ProductModel>.from(data.map((e) => ProductModel.fromJson(e)));
      return products;
    } else {
      throw Exception('Failed to get product');
    }
  }

  Future<List<ProductModel>> getProductbyId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer $token',
    };

    final response = await http.get(
        Uri.parse(
            'https://pasya-api.agilf.dev/api/User/$id/products?PageNumber=1&PageSize=10'),
        headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'] as List;
      List<ProductModel> products =
          List<ProductModel>.from(data.map((e) => ProductModel.fromJson(e)));
      return products;
    } else {
      throw Exception('Failed to get product');
    }
  }
}
