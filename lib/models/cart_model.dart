import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final int id;
  final String photoUrl;
  final String name;
  final int price;
  final int count;
  final bool status;
  final int tipe;

  const CartModel(
      {required this.id,
      required this.photoUrl,
      required this.name,
      required this.price,
      required this.count,
      this.status = false,
      required this.tipe});

  @override
  List<Object?> get props => [id, photoUrl, name, price, count];
}
