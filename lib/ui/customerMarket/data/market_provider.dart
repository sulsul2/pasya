import 'package:flutter/material.dart';
import 'package:pasya/ui/customerMarket/data/market_model.dart';

class MarketProvider extends ChangeNotifier {
  final List<MarketModel> _marketList = [];

  List<MarketModel> get marketList => _marketList;

  void addToMarket(MarketModel item) {
    _marketList.add(item);
    notifyListeners();
  }

  // Future<void> getMarket() async {
  //   try {
  //     List<MarketModel> Markets = await MarketService().getMarket();
  //     _marketList = Markets;
  //     notifyListeners();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  void removeFromMarket(int id) {
    _marketList.where((element) => element.id != id);
    notifyListeners();
  }
}
