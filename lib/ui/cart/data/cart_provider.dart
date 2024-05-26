import 'package:flutter/material.dart';
import 'package:pasya/ui/cart/data/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _cartList = [
    const CartModel(
      id: 1,
      photoUrl: 'assets/ayam_mentah.png',
      name: 'Ayam 1/2 Kg',
      price: 10000,
      count: 2,
      tipe: 1,
      status: true,
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
  void chageCount(int id, bool isAdd) {
    CartModel temp = _cartList.firstWhere((element) => element.id == id);
    int index = _cartList.indexOf(temp);
    CartModel updatedCartModel = CartModel(
        id: temp.id,
        photoUrl: temp.photoUrl,
        name: temp.name,
        price: temp.price,
        count:  isAdd? temp.count+1 :
                (temp.count > 1 ? temp.count-1:temp.count), // Increase the count
        tipe: temp.tipe,
        status: temp.status);
    _cartList[index] = updatedCartModel;
    notifyListeners();
  }
  double get totalPrice {
    return _cartList
        .where((cartItem) => cartItem.status == true)
        .fold(0, (previousValue, cartItem) => previousValue + (cartItem.price * cartItem.count));
  }
}
