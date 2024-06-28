import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pasya/ui/customerMarket/data/market_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketService {
  Future<List<MarketModel>> getMarket() async {
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
            'https://pasya-api.agilf.dev/api/Market?PageNumber=1&PageSize=10'),
        headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'] as List;
      List<MarketModel> markets =
          List<MarketModel>.from(data.map((e) => MarketModel.fromJson(e)));
      return markets;
    } else {
      throw Exception('Failed to get Market');
    }
  }
}
