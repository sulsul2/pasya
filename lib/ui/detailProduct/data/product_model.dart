import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String priceUnit;
  final int price;
  final int stock;
  final int status;

  const ProductModel(
      {required this.id,
      required this.description,
      required this.priceUnit,
      required this.name,
      required this.price,
      required this.stock,
      required this.status});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      priceUnit: json['priceUnit'],
      price: json['price'],
      stock: json['stock'],
      status: json['status'],
    );
  }

  toJson() {
    return {
      'id': id,
      'description': description,
      'priceUnit': priceUnit,
      'name': name,
      'price': price,
      'stock': stock,
      'status': status,
    };
  }

  @override
  List<Object?> get props =>
      [id, description, name, priceUnit, price, stock, status];
}
