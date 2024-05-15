import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pasya/ui/detailMarket/data/shop_model.dart';

class ShopService {
  Future<List<ShopModel>> getShop(int id) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJhMjJlZjkzYy0yNWQwLTRmNjItYmE2Ny1kNjhhZWI4NDVjZTMiLCJ1bmlxdWVfbmFtZSI6IkFkbWluIiwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJyb2xlIjoiQWRtaW4iLCJuYmYiOjE3MTU2MDk3OTQsImV4cCI6MTcxODIwMTc5NCwiaWF0IjoxNzE1NjA5Nzk0LCJpc3MiOiJMZW1vblNvbHV0aW9ucyIsImF1ZCI6IlBBU1lBIn0.Zi5cUup-t7RV4Qr6hv1nwFw9fsbq5hsO5cgbV6hyu-4',
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