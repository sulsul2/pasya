import 'package:flutter/material.dart';
import 'package:pasya/ui/detailMarket/data/shop_model.dart';
import 'package:pasya/ui/detailMarket/domain/shop_service.dart';

class ShopProvider extends ChangeNotifier {
  List<ShopModel> _shopList = [];

  List<ShopModel> get shopList => _shopList;

  void addToShop(ShopModel item) {
    _shopList.add(item);
    notifyListeners();
  }

  Future<void> getShop(int id) async {
    try {
      List<ShopModel> shops = await ShopService().getShop(id);
      _shopList = shops;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void removeFromShop(String id) {
    _shopList.where((element) => element.id != id);
    notifyListeners();
  }
}
