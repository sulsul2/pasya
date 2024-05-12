import 'package:flutter/material.dart';
import 'package:pasya/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _cartList = [
    const CartModel(
      id: 1,
      photoUrl: 'assets/ayam_mentah.png',
      name: 'Product A',
      price: 20000,
      count: 2,
      tipe: 1,
      status: false,
    )
  ];

  List<CartModel> get cartList => _cartList;

  void addToCart(CartModel item) {
    _cartList.add(item);
    notifyListeners();
  }

  void removeFromCart(int id) {
    _cartList.where((element) => element.id != id);
    notifyListeners();
  }

  void changeStatusCart(int id) {
    CartModel temp = _cartList.where((element) => element.id == id).first;
    int index = _cartList.indexOf(temp);
    CartModel temp2 = CartModel(
        id: temp.id,
        photoUrl: temp.photoUrl,
        name: temp.name,
        price: temp.price,
        count: temp.count,
        tipe: temp.tipe,
        status: !temp.status);
    _cartList.removeAt(index);
    _cartList.insert(index, temp2);
    notifyListeners();
  }
}
