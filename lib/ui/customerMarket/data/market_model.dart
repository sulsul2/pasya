import 'package:equatable/equatable.dart';

class MarketModel extends Equatable {
  final int id;
  final String name;
  final String address;
  final String image;
  final String description;

  const MarketModel({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.description,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) {
    return MarketModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      address: json['address'],
      description: json['description'],
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'address': address,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, image, name, address, description];
}
