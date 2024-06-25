// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  final String? token;
  final String? refreshToken;
  final String? email;
  final String? userId;
  final String? userType;
  final bool? emailVerified;
  final bool? phoneVerified;
  final String? fullName;
  final DateTime? refreshTokenExpiryTime;

  LoginResponseModel({
    this.token,
    this.refreshToken,
    this.email,
    this.userId,
    this.userType,
    this.emailVerified,
    this.phoneVerified,
    this.fullName,
    this.refreshTokenExpiryTime,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        token: json["token"],
        refreshToken: json["refreshToken"],
        email: json["email"],
        userId: json["userId"],
        userType: json["userType"],
        emailVerified: json["emailVerified"],
        phoneVerified: json["phoneVerified"],
        fullName: json["fullName"],
        refreshTokenExpiryTime: json["refreshTokenExpiryTime"] == null
            ? null
            : DateTime.parse(json["refreshTokenExpiryTime"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "email": email,
        "userId": userId,
        "userType": userType,
        "emailVerified": emailVerified,
        "phoneVerified": phoneVerified,
        "fullName": fullName,
        "refreshTokenExpiryTime": refreshTokenExpiryTime?.toIso8601String(),
      };
}
