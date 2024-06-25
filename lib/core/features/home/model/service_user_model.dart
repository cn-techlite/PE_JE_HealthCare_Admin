import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../components/helpers/firebase_constants.dart';

class ServiceUserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dateOfBirth;
  final String? address;
  final String? imageProfile;
  final String? eyesight;
  final String? communication;
  final String? medication;
  final String? mobilization;
  final String? washingAndDressing;
  final String? socialActivities;
  final String? fallRisk;
  final String? foodAndFluid;
  final Timestamp? timestamp;
  final String? datePublished;
  final DaysSchedules? timeSchedule;

  ServiceUserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.address,
    this.imageProfile,
    this.eyesight,
    this.communication,
    this.medication,
    this.mobilization,
    this.washingAndDressing,
    this.socialActivities,
    this.fallRisk,
    this.foodAndFluid,
    this.timestamp,
    this.datePublished,
    this.timeSchedule,
  });
  factory ServiceUserModel.fromDocument(DocumentSnapshot documentSnapshot) {
    String id = documentSnapshot.get(FirestoreConstants.id) ?? "";
    String firstName = documentSnapshot.get(FirestoreConstants.firstName) ?? "";
    String lastName = documentSnapshot.get(FirestoreConstants.lastName) ?? "";
    String email = documentSnapshot.get(FirestoreConstants.email) ?? "";
    String dateOfBirth =
        documentSnapshot.get(FirestoreConstants.dateOfBirth) ?? "";
    String address = documentSnapshot.get(FirestoreConstants.address) ?? "";
    String imageProfile =
        documentSnapshot.get(FirestoreConstants.imageProfile) ?? "";
    String eyesight = documentSnapshot.get(FirestoreConstants.eyesight) ?? "";
    String communication =
        documentSnapshot.get(FirestoreConstants.communication) ?? "";
    String medication =
        documentSnapshot.get(FirestoreConstants.medication) ?? "";
    String mobilization =
        documentSnapshot.get(FirestoreConstants.mobilization) ?? "";
    String washingAndDressing =
        documentSnapshot.get(FirestoreConstants.washingAndDressing) ?? "";
    String socialActivities =
        documentSnapshot.get(FirestoreConstants.socialActivities) ?? "";
    String fallRisk = documentSnapshot.get(FirestoreConstants.fallRisk) ?? "";
    String foodAndFluid =
        documentSnapshot.get(FirestoreConstants.foodAndFluid) ?? "";
    Timestamp timestamp = documentSnapshot.get(FirestoreConstants.timestamp);
    String datePublished =
        documentSnapshot.get(FirestoreConstants.datePublished);
    DaysSchedules timeSchedule = DaysSchedules.fromJson(
        documentSnapshot.get(FirestoreConstants.daysSchedules));
    return ServiceUserModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      dateOfBirth: dateOfBirth,
      address: address,
      imageProfile: imageProfile,
      eyesight: eyesight,
      communication: communication,
      medication: medication,
      mobilization: mobilization,
      washingAndDressing: washingAndDressing,
      socialActivities: socialActivities,
      fallRisk: fallRisk,
      foodAndFluid: foodAndFluid,
      timestamp: timestamp,
      datePublished: datePublished,
      timeSchedule: timeSchedule,
    );
  }
}

class DaysSchedules {
  final HourModel monday;
  final HourModel tuesday;
  final HourModel wednesday;
  final HourModel thursday;
  final HourModel friday;
  final HourModel saturday;
  final HourModel sunday;

  DaysSchedules({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory DaysSchedules.fromJson(Map<String, dynamic> json) => DaysSchedules(
        monday: HourModel.fromJson(json["Monday"] ?? {}),
        tuesday: HourModel.fromJson(json["Tuesday"] ?? {}),
        wednesday: HourModel.fromJson(json["Wednesday"] ?? {}),
        thursday: HourModel.fromJson(json["Thursday"] ?? {}),
        friday: HourModel.fromJson(json["Friday"] ?? {}),
        saturday: HourModel.fromJson(json["Saturday"] ?? {}),
        sunday: HourModel.fromJson(json["Sunday"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "Monday": monday.toJson(),
        "Tuesday": tuesday.toJson(),
        "Wednesday": wednesday.toJson(),
        "Thursday": thursday.toJson(),
        "Friday": friday.toJson(),
        "Saturday": saturday.toJson(),
        "Sunday": sunday.toJson(),
      };
}

class HourModel {
  final String? morningVisitId;
  final String? nightVisitId;
  final String? morningVisitName;
  final String? nightVisitName;
  final String? morningNotes;
  final String? nightNotes;
  final Timestamp? morningDate;
  final Timestamp? nightDate;

  HourModel({
    this.morningVisitId,
    this.nightVisitId,
    this.morningVisitName,
    this.nightVisitName,
    this.morningNotes,
    this.nightNotes,
    this.morningDate,
    this.nightDate,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) => HourModel(
        morningVisitId: json["MorningVisitId"],
        nightVisitId: json["NightVisitId"],
        morningVisitName: json["MorningVisitName"],
        nightVisitName: json["NightVisitName"],
        morningNotes: json["MorningNotes"],
        nightNotes: json["NightNotes"],
        morningDate: json["MorningDate"],
        nightDate: json["NightDate"],
      );

  Map<String, dynamic> toJson() => {
        "MorningVisitId": morningVisitId,
        "NightVisitId": nightVisitId,
        "MorningVisitName": morningVisitName,
        "NightVisitName": nightVisitName,
        "MorningNotes": morningNotes,
        "NightNotes": nightNotes,
        "MorningDate": morningDate,
        "NightDate": nightDate,
      };
}
