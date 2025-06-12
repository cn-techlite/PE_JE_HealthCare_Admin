// To parse this JSON data, do
//
//     final adminResponseModel = adminResponseModelFromJson(jsonString);

import 'dart:convert';

List<AdminResponseModel> adminResponseModelFromJson(String str) =>
    List<AdminResponseModel>.from(
        json.decode(str).map((x) => AdminResponseModel.fromJson(x)));

String adminResponseModelToJson(List<AdminResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminResponseModel {
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

  AdminResponseModel({
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

  AdminResponseModel copyWith({
    String? id,
    String? email,
    String? surName,
    String? firstName,
    String? staffCode,
    String? phoneNo,
    String? imagePath,
    String? sex,
    String? state,
    String? locality,
    String? address,
    String? branch,
    String? datePublished,
    String? adminType,
    DateTime? createdAt,
  }) =>
      AdminResponseModel(
        id: id ?? this.id,
        email: email ?? this.email,
        surName: surName ?? this.surName,
        firstName: firstName ?? this.firstName,
        staffCode: staffCode ?? this.staffCode,
        phoneNo: phoneNo ?? this.phoneNo,
        imagePath: imagePath ?? this.imagePath,
        sex: sex ?? this.sex,
        state: state ?? this.state,
        locality: locality ?? this.locality,
        address: address ?? this.address,
        branch: branch ?? this.branch,
        datePublished: datePublished ?? this.datePublished,
        adminType: adminType ?? this.adminType,
        createdAt: createdAt ?? this.createdAt,
      );

  factory AdminResponseModel.fromJson(Map<String, dynamic> json) =>
      AdminResponseModel(
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
