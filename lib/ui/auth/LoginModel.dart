class LoginModel {
  final bool isSuccess;
  final int statusCode;
  final String message;
  final int timestamp;
  final String token;
  final String expired;

  LoginModel({
    required this.isSuccess,
    required this.statusCode,
    required this.message,
    required this.timestamp,
    required this.token,
    required this.expired,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      isSuccess: json['isSuccess'],
      statusCode: json['statusCode'],
      message: json['message'],
      timestamp: json['timestamp'],
      token: json['data']['token'],
      expired: json['data']['expired'],
    );
  }
}