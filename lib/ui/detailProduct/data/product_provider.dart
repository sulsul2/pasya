import 'package:flutter/material.dart';
import 'package:pasya/ui/detailProduct/data/product_model.dart';
import 'package:pasya/ui/detailProduct/domain/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  void addToProduct(ProductModel item) {
    _productList.add(item);
    notifyListeners();
  }

  Future<void> getProduct(String id) async {
    try {
      List<ProductModel> products = await ProductService().getProductbyId(id);
      _productList = products;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void removeFromProduct(int id) {
    _productList.where((element) => element.id != id);
    notifyListeners();
  }
}
