// To parse this JSON data, do
//
//     final serviceUserResponseModel = serviceUserResponseModelFromJson(jsonString);

import 'dart:convert';

List<ServiceUserResponseModel> serviceUserResponseModelFromJson(String str) =>
    List<ServiceUserResponseModel>.from(
        json.decode(str).map((x) => ServiceUserResponseModel.fromJson(x)));

String serviceUserResponseModelToJson(List<ServiceUserResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceUserResponseModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? dateOfBirth;
  final String? imageProfile;
  final String? communication;
  final String? mobilization;
  final String? washingAndDressing;
  final String? medication;
  final String? eyesight;
  final String? socialactivities;
  final String? fallRisk;
  final String? foodAndFluid;
  final DateTime? createdAt;
  final DateTime? reviewDateAt;
  final Day? monday;
  final Day? tuesday;
  final Day? wednesday;
  final Day? thursday;
  final Day? friday;
  final Day? saturday;
  final Day? sunday;

  ServiceUserResponseModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.dateOfBirth,
    this.imageProfile,
    this.communication,
    this.mobilization,
    this.washingAndDressing,
    this.medication,
    this.eyesight,
    this.socialactivities,
    this.fallRisk,
    this.foodAndFluid,
    this.createdAt,
    this.reviewDateAt,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory ServiceUserResponseModel.fromJson(Map<String, dynamic> json) =>
      ServiceUserResponseModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        address: json["address"],
        dateOfBirth: json["dateOfBirth"],
        imageProfile: json["imageProfile"],
        communication: json["communication"],
        mobilization: json["mobilization"],
        washingAndDressing: json["washingAndDressing"],
        medication: json["medication"],
        eyesight: json["eyesight"],
        socialactivities: json["socialactivities"],
        fallRisk: json["fallRisk"],
        foodAndFluid: json["foodAndFluid"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        reviewDateAt: json["reviewDateAt"] == null
            ? null
            : DateTime.parse(json["reviewDateAt"]),
        monday: json["monday"] == null ? null : Day.fromJson(json["monday"]),
        tuesday: json["tuesday"] == null ? null : Day.fromJson(json["tuesday"]),
        wednesday:
            json["wednesday"] == null ? null : Day.fromJson(json["wednesday"]),
        thursday:
            json["thursday"] == null ? null : Day.fromJson(json["thursday"]),
        friday: json["friday"] == null ? null : Day.fromJson(json["friday"]),
        saturday:
            json["saturday"] == null ? null : Day.fromJson(json["saturday"]),
        sunday: json["sunday"] == null ? null : Day.fromJson(json["sunday"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address": address,
        "dateOfBirth": dateOfBirth,
        "imageProfile": imageProfile,
        "communication": communication,
        "mobilization": mobilization,
        "washingAndDressing": washingAndDressing,
        "medication": medication,
        "eyesight": eyesight,
        "socialactivities": socialactivities,
        "fallRisk": fallRisk,
        "foodAndFluid": foodAndFluid,
        "createdAt": createdAt?.toIso8601String(),
        "reviewDateAt": reviewDateAt?.toIso8601String(),
        "monday": monday?.toJson(),
        "tuesday": tuesday?.toJson(),
        "wednesday": wednesday?.toJson(),
        "thursday": thursday?.toJson(),
        "friday": friday?.toJson(),
        "saturday": saturday?.toJson(),
        "sunday": sunday?.toJson(),
      };
}

class Day {
  final String? id;
  final String? morningVisitId;
  final String? nightVisitId;
  final String? morningVisitName;
  final String? nightVisitName;
  final String? morningNotes;
  final String? nightNotes;
  final DateTime? morningDate;
  final DateTime? nightDate;
  final String? servicesUserDataModelId;

  Day({
    this.id,
    this.morningVisitId,
    this.nightVisitId,
    this.morningVisitName,
    this.nightVisitName,
    this.morningNotes,
    this.nightNotes,
    this.morningDate,
    this.nightDate,
    this.servicesUserDataModelId,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["id"],
        morningVisitId: json["morningVisitId"],
        nightVisitId: json["nightVisitId"],
        morningVisitName: json["morningVisitName"],
        nightVisitName: json["nightVisitName"],
        morningNotes: json["morningNotes"],
        nightNotes: json["nightNotes"],
        morningDate: json["morningDate"] == null
            ? null
            : DateTime.parse(json["morningDate"]),
        nightDate: json["nightDate"] == null
            ? null
            : DateTime.parse(json["nightDate"]),
        servicesUserDataModelId: json["servicesUserDataModelId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "morningVisitId": morningVisitId,
        "nightVisitId": nightVisitId,
        "morningVisitName": morningVisitName,
        "nightVisitName": nightVisitName,
        "morningNotes": morningNotes,
        "nightNotes": nightNotes,
        "morningDate": morningDate?.toIso8601String(),
        "nightDate": nightDate?.toIso8601String(),
        "servicesUserDataModelId": servicesUserDataModelId,
      };
}
