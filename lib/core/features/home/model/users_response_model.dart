// To parse this JSON data, do
//
//     final userResponseModel = userResponseModelFromJson(jsonString);

import 'dart:convert';

List<UserResponseModel> userResponseModelFromJson(String str) =>
    List<UserResponseModel>.from(
        jsonDecode(str).map((x) => UserResponseModel.fromJson(x)));

String userResponseModelToJson(List<UserResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserResponseModel {
  final String? id;
  final String? uniqueNo;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNo;
  final String? profilePicture;
  final String? address;
  final String? sex;
  final String? dateOfBirth;
  final String? addressPostCodes;
  final String? bankAccName;
  final String? bankAccNo;
  final String? bankSortCode;
  final String? dbsCode;
  final String? workExperience;
  final String? insuranceNo;
  final String? nationality;
  final String? nextOfKin;
  final String? nextOfKinPhoneNo;
  final String? proofOfAddress;
  final String? proofOfAddressCheck;
  final String? referenceEmail;
  final String? referenceEmail2;
  final String? dbsFile;
  final bool? dbsFileCheck;
  final String? trainingCertificates;
  final bool? trainingCertificatesChecked;
  final bool? allDocumentsCheck;
  final String? cvUpload;
  final bool? agreed;
  final bool? infoCompleted;
  final bool? hasGoneHoliday;
  final String? holidayStartDate;
  final String? holidayEndDate;
  final String? religion;
  final DayAvailability? mondayAvailability;
  final DayAvailability? tuesdayAvailability;
  final DayAvailability? wednesdayAvailability;
  final DayAvailability? thursdayAvailability;
  final DayAvailability? fridayAvailability;
  final DayAvailability? saturdayAvailability;
  final DayAvailability? sundayAvailability;
  final List<WorkExperienceHistory>? workExperienceHistory;
  final List<DeviceTokenModel>? deviceTokenModels;
  final DateTime? createdAt;

  UserResponseModel({
    this.id,
    this.uniqueNo,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNo,
    this.profilePicture,
    this.address,
    this.sex,
    this.dateOfBirth,
    this.addressPostCodes,
    this.bankAccName,
    this.bankAccNo,
    this.bankSortCode,
    this.dbsCode,
    this.workExperience,
    this.insuranceNo,
    this.nationality,
    this.nextOfKin,
    this.nextOfKinPhoneNo,
    this.proofOfAddress,
    this.proofOfAddressCheck,
    this.referenceEmail,
    this.referenceEmail2,
    this.dbsFile,
    this.dbsFileCheck,
    this.trainingCertificates,
    this.trainingCertificatesChecked,
    this.allDocumentsCheck,
    this.cvUpload,
    this.agreed,
    this.infoCompleted,
    this.hasGoneHoliday,
    this.holidayStartDate,
    this.holidayEndDate,
    this.religion,
    this.mondayAvailability,
    this.tuesdayAvailability,
    this.wednesdayAvailability,
    this.thursdayAvailability,
    this.fridayAvailability,
    this.saturdayAvailability,
    this.sundayAvailability,
    this.workExperienceHistory,
    this.deviceTokenModels,
    this.createdAt,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        id: json["id"] ?? "",
        uniqueNo: json["uniqueNo"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        email: json["email"] ?? "",
        phoneNo: json["phoneNo"] ?? "",
        profilePicture: json["profilePicture"] ?? "",
        address: json["address"] ?? "",
        sex: json["sex"] ?? "",
        dateOfBirth: json["dateOfBirth"] ?? "",
        addressPostCodes: json["addressPostCodes"] ?? "",
        bankAccName: json["bankAccName"] ?? "",
        bankAccNo: json["bankAccNo"] ?? "",
        bankSortCode: json["bankSortCode"] ?? "",
        dbsCode: json["dbsCode"] ?? "",
        workExperience: json["workExperience"] ?? "",
        insuranceNo: json["insuranceNo"] ?? "",
        nationality: json["nationality"] ?? "",
        nextOfKin: json["nextOfKin"] ?? "",
        nextOfKinPhoneNo: json["nextOfKinPhoneNo"] ?? "",
        proofOfAddress: json["proofOfAddress"] ?? "",
        proofOfAddressCheck: json["proofOfAddressCheck"] ?? "",
        referenceEmail: json["referenceEmail"] ?? "",
        referenceEmail2: json["referenceEmail2"] ?? "",
        dbsFile: json["dbsFile"] ?? "",
        dbsFileCheck: json["dbsFileCheck"] ?? false,
        trainingCertificates: json["trainingCertificates"] ?? "",
        trainingCertificatesChecked:
            json["trainingCertificatesChecked"] ?? false,
        allDocumentsCheck: json["allDocumentsCheck"] ?? false,
        cvUpload: json["cvUpload"] ?? "",
        agreed: json["agreed"] ?? false,
        infoCompleted: json["infoCompleted"] ?? false,
        hasGoneHoliday: json["hasGoneHoliday"] ?? false,
        holidayStartDate: json["holidayStartDate"] ?? "",
        holidayEndDate: json["holidayEndDate"] ?? "",
        religion: json["religion"] ?? "",
        mondayAvailability: json["mondayAvailability"] == null
            ? null
            : DayAvailability.fromJson(json["mondayAvailability"]),
        tuesdayAvailability: json["tuesdayAvailability"] == null
            ? null
            : DayAvailability.fromJson(json["tuesdayAvailability"]),
        wednesdayAvailability: json["wednesdayAvailability"] == null
            ? null
            : DayAvailability.fromJson(json["wednesdayAvailability"]),
        thursdayAvailability: json["thursdayAvailability"] == null
            ? null
            : DayAvailability.fromJson(json["thursdayAvailability"]),
        fridayAvailability: json["fridayAvailability"] == null
            ? null
            : DayAvailability.fromJson(json["fridayAvailability"]),
        saturdayAvailability: json["saturdayAvailability"] == null
            ? null
            : DayAvailability.fromJson(json["saturdayAvailability"]),
        sundayAvailability: json["sundayAvailability"] == null
            ? null
            : DayAvailability.fromJson(json["sundayAvailability"]),
        workExperienceHistory: json["workExperienceHistory"] == null
            ? []
            : List<WorkExperienceHistory>.from(json["workExperienceHistory"]!
                .map((x) => WorkExperienceHistory.fromJson(x))),
        deviceTokenModels: json["deviceTokenModels"] == null
            ? []
            : List<DeviceTokenModel>.from(json["deviceTokenModels"]!
                .map((x) => DeviceTokenModel.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uniqueNo": uniqueNo,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNo": phoneNo,
        "profilePicture": profilePicture,
        "address": address,
        "sex": sex,
        "dateOfBirth": dateOfBirth,
        "addressPostCodes": addressPostCodes,
        "bankAccName": bankAccName,
        "bankAccNo": bankAccNo,
        "bankSortCode": bankSortCode,
        "dbsCode": dbsCode,
        "workExperience": workExperience,
        "insuranceNo": insuranceNo,
        "nationality": nationality,
        "nextOfKin": nextOfKin,
        "nextOfKinPhoneNo": nextOfKinPhoneNo,
        "proofOfAddress": proofOfAddress,
        "proofOfAddressCheck": proofOfAddressCheck,
        "referenceEmail": referenceEmail,
        "referenceEmail2": referenceEmail2,
        "dbsFile": dbsFile,
        "dbsFileCheck": dbsFileCheck,
        "trainingCertificates": trainingCertificates,
        "trainingCertificatesChecked": trainingCertificatesChecked,
        "allDocumentsCheck": allDocumentsCheck,
        "cvUpload": cvUpload,
        "agreed": agreed,
        "infoCompleted": infoCompleted,
        "hasGoneHoliday": hasGoneHoliday,
        "holidayStartDate": holidayStartDate,
        "holidayEndDate": holidayEndDate,
        "religion": religion,
        "mondayAvailability": mondayAvailability?.toJson(),
        "tuesdayAvailability": tuesdayAvailability?.toJson(),
        "wednesdayAvailability": wednesdayAvailability?.toJson(),
        "thursdayAvailability": thursdayAvailability?.toJson(),
        "fridayAvailability": fridayAvailability?.toJson(),
        "saturdayAvailability": saturdayAvailability?.toJson(),
        "sundayAvailability": sundayAvailability?.toJson(),
        "workExperienceHistory": workExperienceHistory == null
            ? []
            : List<dynamic>.from(workExperienceHistory!.map((x) => x.toJson())),
        "deviceTokenModels": deviceTokenModels == null
            ? []
            : List<dynamic>.from(deviceTokenModels!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
      };
}

class DeviceTokenModel {
  final String? id;
  final String? deviceTokenId;
  final String? usersDataModelTableId;

  DeviceTokenModel({
    this.id,
    this.deviceTokenId,
    this.usersDataModelTableId,
  });

  factory DeviceTokenModel.fromJson(Map<String, dynamic> json) =>
      DeviceTokenModel(
        id: json["id"] ?? "",
        deviceTokenId: json["deviceTokenId"] ?? "",
        usersDataModelTableId: json["usersDataModelTableId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deviceTokenId": deviceTokenId,
        "usersDataModelTableId": usersDataModelTableId,
      };
}

class DayAvailability {
  final String? id;
  final bool? morningAvailability;
  final bool? nightAvailability;
  final String? usersDataModelTableId;

  DayAvailability({
    this.id,
    this.morningAvailability,
    this.nightAvailability,
    this.usersDataModelTableId,
  });

  factory DayAvailability.fromJson(Map<String, dynamic> json) =>
      DayAvailability(
        id: json["id"] ?? "",
        morningAvailability: json["morningAvailability"] ?? false,
        nightAvailability: json["nightAvailability"] ?? false,
        usersDataModelTableId: json["usersDataModelTableId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "morningAvailability": morningAvailability,
        "nightAvailability": nightAvailability,
        "usersDataModelTableId": usersDataModelTableId,
      };
}

class WorkExperienceHistory {
  final String? id;
  final String? employerName;
  final String? positionHeld;
  final String? workStartDate;
  final String? workEndDate;
  final String? usersDataModelTableId;

  WorkExperienceHistory({
    this.id,
    this.employerName,
    this.positionHeld,
    this.workStartDate,
    this.workEndDate,
    this.usersDataModelTableId,
  });

  factory WorkExperienceHistory.fromJson(Map<String, dynamic> json) =>
      WorkExperienceHistory(
        id: json["id"] ?? "",
        employerName: json["employerName"] ?? "",
        positionHeld: json["positionHeld"] ?? "",
        workStartDate: json["workStartDate"] ?? "",
        workEndDate: json["workEndDate"] ?? "",
        usersDataModelTableId: json["usersDataModelTableId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employerName": employerName,
        "positionHeld": positionHeld,
        "workStartDate": workStartDate,
        "workEndDate": workEndDate,
        "usersDataModelTableId": usersDataModelTableId,
      };
}
