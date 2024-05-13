import 'package:equatable/equatable.dart';

class MarketModel extends Equatable {
  final int id;
  final String photoUrl;
  final String name;
  final int price;
  final int count;
  final bool status;
  final int tipe;

  const MarketModel(
      {required this.id,
      required this.photoUrl,
      required this.name,
      required this.price,
      required this.count,
      this.status = false,
      required this.tipe});

  factory MarketModel.fromJson(Map<String, dynamic> json) {
    return MarketModel(
      id: json['id'],
      photoUrl: json['photoUrl'],
      name: json['name'],
      price: json['price'],
      count: json['count'],
      status: json['status'],
      tipe: json['tipe'],
    );
  }

  toJson() {
    return {
      'id': id,
      'photoUrl': photoUrl,
      'name': name,
      'price': price,
      'count': count,
      'status': status,
      'tipe': tipe,
    };
  }

  @override
  List<Object?> get props => [id, photoUrl, name, price, count];
}
