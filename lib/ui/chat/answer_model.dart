class AnswerModel {
  final int id;
  final String message;
  final int likes;
  final AnsweredBy answeredBy;
  final int discussionId;
  final DateTime createdAt;
  final DateTime updatedAt;

  AnswerModel({
    required this.id,
    required this.message,
    required this.likes,
    required this.answeredBy,
    required this.discussionId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'],
      message: json['message'],
      likes: json['likes'],
      answeredBy: AnsweredBy.fromJson(json['answeredBy']),
      discussionId: json['discussionId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class AnsweredBy {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String picture;
  final String notificationToken;
  final int status;
  final int marketId;

  AnsweredBy({
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

  factory AnsweredBy.fromJson(Map<String, dynamic> json) {
    return AnsweredBy(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      picture: json['picture'],
      notificationToken: json['notificationToken'],
      status: json['status'],
      marketId: json['marketId'],
    );
  }
}