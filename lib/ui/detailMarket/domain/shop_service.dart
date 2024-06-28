import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pasya/ui/detailMarket/data/shop_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopService {
  Future<List<ShopModel>> getShop(int id) async {
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
            'https://pasya-api.agilf.dev/api/Market/GetUsers?marketId=$id'),
        headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'] as List;
      List<ShopModel> shops =
          List<ShopModel>.from(data.map((e) => ShopModel.fromJson(e)));
      return shops;
    } else {
      throw Exception('Failed to get Shop');
    }
  }
}
