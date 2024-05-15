import 'package:equatable/equatable.dart';

class ShopModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String picture;
  // final String address;
  // final String phoneNumber;

  const ShopModel({
    required this.id,
    required this.name,
    required this.picture,
    required this.email,
    // required this.address,
    // required this.phoneNumber,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      email: json['email'],
      // address: json['address'],
      // phoneNumber: json['phoneNumber'],
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'email': email,
      // 'address': address,
      // 'phoneNumber': phoneNumber
    };
  }

  @override
  List<Object?> get props => [id, picture, name, email];
}
