import 'package:pe_je_healthcare_admin/core/components/helpers/firebase_constants.dart';

import '../../../components/utils/package_export.dart';

class UserModel {
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
  final bool? proofOfAddressCheck;
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
  final AvailabilityDays? availabilityDays;
  final Timestamp? timestamp;
  final String? datePublished;

  UserModel({
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
    required this.availabilityDays,
    this.timestamp,
    this.datePublished,
  });

  factory UserModel.fromDocument(DocumentSnapshot documentSnapshot) {
    String id = documentSnapshot.get(FirestoreConstants.id) ?? "";
    String uniqueNo = documentSnapshot.get(FirestoreConstants.uniqueNo) ?? "";
    String firstName = documentSnapshot.get(FirestoreConstants.firstName) ?? "";
    String lastName = documentSnapshot.get(FirestoreConstants.lastName) ?? "";
    String email = documentSnapshot.get(FirestoreConstants.email) ?? "";
    String phoneNo = documentSnapshot.get(FirestoreConstants.phoneNo) ?? "";
    String profilePicture =
        documentSnapshot.get(FirestoreConstants.profilePicture) ?? "";
    String address = documentSnapshot.get(FirestoreConstants.address) ?? "";
    String sex = documentSnapshot.get(FirestoreConstants.sex) ?? "";
    String dateOfBirth =
        documentSnapshot.get(FirestoreConstants.dateOfBirth) ?? "";
    String addressPostCodes =
        documentSnapshot.get(FirestoreConstants.addressPostCodes) ?? "";
    String bankAccName =
        documentSnapshot.get(FirestoreConstants.bankAccName) ?? "";
    String bankAccNo = documentSnapshot.get(FirestoreConstants.bankAccNo) ?? "";
    String bankSortCode =
        documentSnapshot.get(FirestoreConstants.bankSortCode) ?? "";
    String dbsCode = documentSnapshot.get(FirestoreConstants.dbsCode) ?? "";
    String workExperience =
        documentSnapshot.get(FirestoreConstants.workExperience) ?? "";
    String insuranceNo =
        documentSnapshot.get(FirestoreConstants.insuranceNo) ?? "";
    String nationality =
        documentSnapshot.get(FirestoreConstants.nationality) ?? "";
    String nextOfKin = documentSnapshot.get(FirestoreConstants.nextOfKin) ?? "";
    String nextOfKinPhoneNo =
        documentSnapshot.get(FirestoreConstants.nextOfKinPhoneNo) ?? "";
    String proofOfAddress =
        documentSnapshot.get(FirestoreConstants.proofOfAddress) ?? "";
    bool proofOfAddressCheck =
        documentSnapshot.get(FirestoreConstants.proofOfAddressCheck) ?? "";
    String referenceEmail =
        documentSnapshot.get(FirestoreConstants.referenceEmail1) ?? "";
    String referenceEmail2 =
        documentSnapshot.get(FirestoreConstants.referenceEmail2) ?? "";
    String dbsFile = documentSnapshot.get(FirestoreConstants.dBSFile) ?? "";
    bool dbsFileCheck =
        documentSnapshot.get(FirestoreConstants.dBSFileCheck) ?? false;
    String trainingCertificates =
        documentSnapshot.get(FirestoreConstants.trainingCertificates) ?? "";
    bool trainingCertificatesChecked =
        documentSnapshot.get(FirestoreConstants.trainingCertificatesChecked) ??
            false;
    bool allDocumentsCheck =
        documentSnapshot.get(FirestoreConstants.allDocumentsCheck) ?? false;
    String cvUpload = documentSnapshot.get(FirestoreConstants.cvUpload) ?? "";
    bool agreed = documentSnapshot.get(FirestoreConstants.agreed) ?? false;
    bool infoCompleted =
        documentSnapshot.get(FirestoreConstants.infoCompleted) ?? false;
    bool hasGoneHoliday =
        documentSnapshot.get(FirestoreConstants.hasGoneHoliday) ?? false;
    String holidayStartDate =
        documentSnapshot.get(FirestoreConstants.holidayStartDate) ?? "";
    String holidayEndDate =
        documentSnapshot.get(FirestoreConstants.holidayEndDate) ?? "";
    AvailabilityDays availabilityDays = AvailabilityDays.fromJson(
        documentSnapshot.get(FirestoreConstants.availabilityDays) ?? {});
    Timestamp timestamp = documentSnapshot.get(FirestoreConstants.timestamp);
    String datePublished =
        documentSnapshot.get(FirestoreConstants.datePublished) ?? "";

    return UserModel(
      id: id,
      uniqueNo: uniqueNo,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNo: phoneNo,
      profilePicture: profilePicture,
      address: address,
      sex: sex,
      dateOfBirth: dateOfBirth,
      addressPostCodes: addressPostCodes,
      bankAccName: bankAccName,
      bankAccNo: bankAccNo,
      bankSortCode: bankSortCode,
      dbsCode: dbsCode,
      workExperience: workExperience,
      insuranceNo: insuranceNo,
      nationality: nationality,
      nextOfKin: nextOfKin,
      nextOfKinPhoneNo: nextOfKinPhoneNo,
      proofOfAddress: proofOfAddress,
      proofOfAddressCheck: proofOfAddressCheck,
      referenceEmail: referenceEmail,
      referenceEmail2: referenceEmail2,
      dbsFile: dbsFile,
      dbsFileCheck: dbsFileCheck,
      trainingCertificates: trainingCertificates,
      trainingCertificatesChecked: trainingCertificatesChecked,
      allDocumentsCheck: allDocumentsCheck,
      cvUpload: cvUpload,
      agreed: agreed,
      infoCompleted: infoCompleted,
      hasGoneHoliday: hasGoneHoliday,
      holidayStartDate: holidayStartDate,
      holidayEndDate: holidayEndDate,
      availabilityDays: availabilityDays,
      timestamp: timestamp,
      datePublished: datePublished,
    );
  }
}

class AvailabilityDays {
  final DayAvailability monday;
  final DayAvailability tuesday;
  final DayAvailability wednesday;
  final DayAvailability thursday;
  final DayAvailability friday;
  final DayAvailability saturday;
  final DayAvailability sunday;

  AvailabilityDays({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory AvailabilityDays.fromJson(Map<String, dynamic> json) =>
      AvailabilityDays(
        monday: DayAvailability.fromJson(json["Monday"] ?? {}),
        tuesday: DayAvailability.fromJson(json["Tuesday"] ?? {}),
        wednesday: DayAvailability.fromJson(json["Wednesday"] ?? {}),
        thursday: DayAvailability.fromJson(json["Thursday"] ?? {}),
        friday: DayAvailability.fromJson(json["Friday"] ?? {}),
        saturday: DayAvailability.fromJson(json["Saturday"] ?? {}),
        sunday: DayAvailability.fromJson(json["Sunday"] ?? {}),
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

class DayAvailability {
  final bool? morning;
  final bool? night;

  DayAvailability({
    this.morning,
    this.night,
  });

  factory DayAvailability.fromJson(Map<String, dynamic> json) =>
      DayAvailability(
        morning: json["Morning"],
        night: json["Night"],
      );

  Map<String, dynamic> toJson() => {"Morning": morning, "Night": night};
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

  factory DeviceTokenModel.fromDocument(DocumentSnapshot documentSnapshot) {
    String id = documentSnapshot.get(FirestoreConstants.id) ?? "";
    String deviceTokenId =
        documentSnapshot.get(FirestoreConstants.deviceTokenId) ?? "";
    String usersDataModelTableId =
        documentSnapshot.get(FirestoreConstants.usersDataModelTableId) ?? "";

    return DeviceTokenModel(
      id: id,
      deviceTokenId: deviceTokenId,
      usersDataModelTableId: usersDataModelTableId,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "deviceTokenId": deviceTokenId,
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
  final Timestamp? timestamp;

  WorkExperienceHistory({
    this.id,
    this.employerName,
    this.positionHeld,
    this.workStartDate,
    this.workEndDate,
    this.usersDataModelTableId,
    this.timestamp,
  });

  factory WorkExperienceHistory.fromDocument(
      DocumentSnapshot documentSnapshot) {
    String id = documentSnapshot.get(FirestoreConstants.id) ?? "";
    String employerName =
        documentSnapshot.get(FirestoreConstants.employerName) ?? "";
    String positionHeld =
        documentSnapshot.get(FirestoreConstants.positionHeld) ?? "";
    String workStartDate =
        documentSnapshot.get(FirestoreConstants.workStartDate) ?? "";
    String workEndDate =
        documentSnapshot.get(FirestoreConstants.workEndDate) ?? "";
    String usersDataModelTableId =
        documentSnapshot.get(FirestoreConstants.usersDataModelTableId) ?? "";
    Timestamp timestamp = documentSnapshot.get(FirestoreConstants.timestamp);

    return WorkExperienceHistory(
      id: id,
      employerName: employerName,
      positionHeld: positionHeld,
      workStartDate: workStartDate,
      workEndDate: workEndDate,
      usersDataModelTableId: usersDataModelTableId,
      timestamp: timestamp,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "employerName": employerName,
        "positionHeld": positionHeld,
        "workStartDate": workStartDate,
        "workEndDate": workEndDate,
        "usersDataModelTableId": usersDataModelTableId,
      };
}
