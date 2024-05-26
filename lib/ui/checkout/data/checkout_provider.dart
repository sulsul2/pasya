import 'package:flutter/foundation.dart';
import './checkout_model.dart';

class CheckoutCardProvider with ChangeNotifier {
  final List<CheckoutCardModel> _checkoutCards = [];

  List<CheckoutCardModel> get checkoutCards => _checkoutCards;

  void addCheckoutCard(CheckoutCardModel checkoutCard) {
    _checkoutCards.add(checkoutCard);
    notifyListeners();
  }

  void removeCheckoutCard(CheckoutCardModel checkoutCard) {
    _checkoutCards.remove(checkoutCard);
    notifyListeners();
  }
}