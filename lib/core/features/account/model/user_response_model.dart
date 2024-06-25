// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) =>
    json.encode(data.toJson());

class RegisterResponseModel {
  final String? id;
  final String? firstName;
  final String? surName;
  final String? email;
  final String? phoneNo;
  final String? imagePath;
  final String? staffCode;
  final String? sex;
  final DateTime? createdAt;

  RegisterResponseModel({
    this.id,
    this.firstName,
    this.surName,
    this.email,
    this.phoneNo,
    this.imagePath,
    this.staffCode,
    this.sex,
    this.createdAt,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        id: json["id"],
        firstName: json["firstName"],
        surName: json["surName"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        imagePath: json["imagePath"],
        staffCode: json["staffCode"],
        sex: json["sex"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "surName": surName,
        "email": email,
        "phoneNo": phoneNo,
        "imagePath": imagePath,
        "staffCode": staffCode,
        "sex": sex,
        "createdAt": createdAt?.toIso8601String(),
      };
}
