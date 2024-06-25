import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pe_je_healthcare_admin/core/features/account/model/available_model.dart';
import '../../../components/helpers/endpoints.dart';
import '../../../components/helpers/globals.dart';
import '../../../components/utils/constants.dart';
import '../../../components/utils/package_export.dart';

import '../model/user_response_model.dart';

class AccountService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<RegisterResponseModel> getUserData() async {
    RegisterResponseModel data = RegisterResponseModel();
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      var url = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/${globals.userId}");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final item = json.decode(response.body);
        data = RegisterResponseModel.fromJson(
            item); // Mapping json response to our data model
        printData('User Details', data);
        return data;
      } else {
        printData('User Details Error', response.body);
      }
    } catch (e) {
      rethrow;
    }
    return data;
  }

  Future<bool> updateProfilePics({
    required String imageFile,
    required String userId,
  }) async {
    try {
      var stingUrl =
          Uri.parse("${Endpoints.baseUrl}${Endpoints.profileImageUrl}/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };

      var request = http.MultipartRequest('PUT', stingUrl);
      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('Image', imageFile));
      var response = await request.send();
      String respStr = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", respStr);
        getUserData();
        return true;
      } else {
        printData("Error", respStr);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateNames({
    required String userId,
    required String firstName,
    required String lastName,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-names/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "firstName": firstName,
          "lastName": lastName,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updatePhoneNo({
    required String userId,
    required String phoneNo,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-phone-no/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "phoneNo": phoneNo,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateProofOfAddress({
    required String imageFile,
    required String userId,
  }) async {
    try {
      var stingUrl =
          Uri.parse("${Endpoints.baseUrl}update-proof-of-address/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };

      var request = http.MultipartRequest('PUT', stingUrl);
      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('Image', imageFile));
      var response = await request.send();
      String respStr = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", respStr);
        getUserData();
        return true;
      } else {
        printData("Error", respStr);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateAddress({
    required String userId,
    required String address,
    required String addressPostCodes,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-address/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "address": address,
          "postCodes": addressPostCodes,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateNationality({
    required String userId,
    required String nationality,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-nationality/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "nationality": nationality,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateBankDetails({
    required String userId,
    required String bankName,
    required String accountNumber,
    required String bankSortCode,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-bank-details/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "bankName": bankName,
          "accountNumber": accountNumber,
          "bankSortCode": bankSortCode,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateNextOfKin({
    required String userId,
    required String nextOfKin,
    required String nextOfKinPhoneNo,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-next-of-kin/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "nextOfKin": nextOfKin,
          "nextOfKinPhoneNo": nextOfKinPhoneNo,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateWorkExperience({
    required String userId,
    required String workExperience,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-work-experience/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "workExperience": workExperience,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateInsuranceNo({
    required String userId,
    required String insuranceNo,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-insurance-no/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "insuranceNo": insuranceNo,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateReferenceEmail({
    required String userId,
    required String referenceEmail1,
    required String referenceEmail2,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-reference-email/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "referenceEmail1": referenceEmail1,
          "referenceEmail2": referenceEmail2,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateDBS({
    required String userId,
    required String dbsCode,
    required String dbsFile,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-dbs/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {"dbsCode": dbsCode, "dbsFile": dbsFile},
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateTrainingCertificate({
    required String imageFile,
    required String userId,
  }) async {
    try {
      var stingUrl =
          Uri.parse("${Endpoints.baseUrl}update-training-certificates/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };

      var request = http.MultipartRequest('PUT', stingUrl);
      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('Image', imageFile));
      var response = await request.send();
      String respStr = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", respStr);
        getUserData();
        return true;
      } else {
        printData("Error", respStr);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateAgreement({
    required String userId,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-agreed/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };

      http.Response response = await http.put(stingUrl, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateCvUpload({
    required String imageFile,
    required String userId,
  }) async {
    try {
      var stingUrl = Uri.parse("${Endpoints.baseUrl}update-cv-upload/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };

      var request = http.MultipartRequest('PUT', stingUrl);
      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('Image', imageFile));
      var response = await request.send();
      String respStr = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", respStr);
        getUserData();
        return true;
      } else {
        printData("Error", respStr);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateHolidays({
    required String userId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-holidays/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "startDate": startDate,
          "endDate": endDate,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateHolidayValue() async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-has-gone-holiday/${globals.userId}");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };

      http.Response response = await http.put(stingUrl, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateAvailability({
    required String userId,
    required UpdateAvailableModel available,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/update-availability/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode({
        "monday": {
          "morning": available.monday!.morning,
          "night": available.monday!.night
        },
        "tuesday": {
          "morning": available.tuesday!.morning,
          "night": available.tuesday!.night
        },
        "wednesday": {
          "morning": available.wednesday!.morning,
          "night": available.wednesday!.night
        },
        "thursday": {
          "morning": available.thursday!.morning,
          "night": available.thursday!.night
        },
        "friday": {
          "morning": available.friday!.morning,
          "night": available.friday!.night
        },
        "saturday": {
          "morning": available.saturday!.morning,
          "night": available.saturday!.night
        },
        "sunday": {
          "morning": available.sunday!.morning,
          "night": available.sunday!.night
        },
      });
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateWorkHistory({
    required String userId,
    required String companyName,
    required String positionHeld,
    required String workStartDate,
    required String workEndDate,
  }) async {
    try {
      var stingUrl = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/add-work-history/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "employerName": companyName,
          "positionHeld": positionHeld,
          "workStartDate": workStartDate,
          "workEndDate": workEndDate
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addFeedBack({
    required String feedback,
    required String phoneNo,
  }) async {
    try {
      var stingUrl = Uri.parse("${Endpoints.baseUrl}Info/feedback");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "name": globals.userName,
          "email": globals.userEmail,
          "feedback": feedback,
          "phoneNo": phoneNo
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
