import 'package:flutter/material.dart';
import 'package:pasya/ui/customerMarket/data/market_model.dart';
import 'package:pasya/ui/customerMarket/domain/market_service.dart';

class MarketProvider extends ChangeNotifier {
  List<MarketModel> _marketList = [];

  List<MarketModel> get marketList => _marketList;

  void addToMarket(MarketModel item) {
    _marketList.add(item);
    notifyListeners();
  }

  Future<void> getMarket() async {
    try {
      List<MarketModel> markets = await MarketService().getMarket();
      _marketList = markets;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void removeFromMarket(int id) {
    _marketList.where((element) => element.id != id);
    notifyListeners();
  }
}
