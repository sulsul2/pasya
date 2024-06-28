import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatModel {
  final int? id;
  final String? title;
  final String? message;
  final int? likes;
  final User? createdBy;
  final bool? isSolved;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ChatModel({
    required this.id,
    required this.title,
    required this.message,
    required this.likes,
    required this.createdBy,
    required this.isSolved,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as int?,
      title: json['tittle'] as String?,
      message: json['message'] as String?,
      likes: json['likes'] as int?,
      createdBy: json['createdBy'] != null ? User.fromJson(json['createdBy']) : null,
      isSolved: json['isSolved'] as bool?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? picture;
  final String? notificationToken;
  final int? status;
  final int? marketId;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.picture,
    required this.notificationToken,
    required this.status,
    required this.marketId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      picture: json['picture'] as String?,
      notificationToken: json['notificationToken'] as String?,
      status: json['status'] as int?,
      marketId: json['marketId'] as int?,
    );
  }
}