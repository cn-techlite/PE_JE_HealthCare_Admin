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
  final String? email;
  final String? surName;
  final String? firstName;
  final String? staffCode;
  final String? phoneNo;
  final String? imagePath;
  final String? sex;
  final String? state;
  final String? locality;
  final String? address;
  final String? branch;
  final String? datePublished;
  final String? adminType;
  final DateTime? createdAt;

  RegisterResponseModel({
    this.id,
    this.email,
    this.surName,
    this.firstName,
    this.staffCode,
    this.phoneNo,
    this.imagePath,
    this.sex,
    this.state,
    this.locality,
    this.address,
    this.branch,
    this.datePublished,
    this.adminType,
    this.createdAt,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        id: json["id"],
        email: json["email"],
        surName: json["surName"],
        firstName: json["firstName"],
        staffCode: json["staffCode"],
        phoneNo: json["phoneNo"],
        imagePath: json["imagePath"],
        sex: json["sex"],
        state: json["state"],
        locality: json["locality"],
        address: json["address"],
        branch: json["branch"],
        datePublished: json["datePublished"],
        adminType: json["adminType"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "surName": surName,
        "firstName": firstName,
        "staffCode": staffCode,
        "phoneNo": phoneNo,
        "imagePath": imagePath,
        "sex": sex,
        "state": state,
        "locality": locality,
        "address": address,
        "branch": branch,
        "datePublished": datePublished,
        "adminType": adminType,
        "createdAt": createdAt?.toIso8601String(),
      };
}
