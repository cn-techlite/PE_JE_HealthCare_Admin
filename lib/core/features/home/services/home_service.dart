import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pe_je_healthcare_admin/core/components/extension/error_handling.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/notification_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/service_user_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/users_response_model.dart';
import '../../../components/helpers/endpoints.dart';
import '../../../components/helpers/globals.dart';
import '../../../components/utils/constants.dart';

class HomeServices {
  final cache = DefaultCacheManager();
  Future<String> upload(String file) async {
    String imagePath = "";
    var stingUrl = Uri.parse("${Endpoints.baseUrl}${Endpoints.uploadUrl}");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${globals.token}'
    };
    var request = http.MultipartRequest('POST', stingUrl);
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath(
      'Image',
      file,
    ));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      if (kDebugMode) {
        print(data);
      }
      imagePath = data['imagePath'].toString();
    }
    return imagePath;
  }

  Future<List<ServiceUserResponseModel>> getAllServiceUserData1() async {
    List<ServiceUserResponseModel> data = [];
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      var url = Uri.parse("${Endpoints.baseUrl}ServiceUser");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData('User List', response.body);
        data = serviceUserResponseModelFromJson(response.body);
        printData('User List2', data);
        return data;
      } else {
        printData('User List Error', response.body);
      }
    } catch (e) {
      rethrow;
    }
    return data;
  }

  Future<List<ServiceUserResponseModel>> getAllServiceUserData() async {
    List<ServiceUserResponseModel> data = [];
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
      };
      var url = Uri.parse("${Endpoints.baseUrl}ServiceUser");
      final response =
          await cache.downloadFile(url.toString(), authHeaders: headers2);

      if (response.file.existsSync()) {
        String file = await response.file.readAsString();

        // Validate file content
        if (file.isNotEmpty && (file.startsWith('{') || file.startsWith('['))) {
          try {
            var data1 = serviceUserResponseModelFromJson(file);
            data = data1;
            printData('All Gas Station', file);
            return data;
          } catch (e) {
            printData('All Gas Station Parsing Error', e.toString());
            return Future.error('Invalid JSON format');
          }
        } else {
          response.file.deleteSync();
          var data1 = serviceUserResponseModelFromJson(file);
          data = data1;
          printData('All Gas Station', file);
          return data;
        }
      } else {
        printData('File not found', response.file.path);
        return [];
      }
    } catch (e) {
      printData('Error', e.toString());
      return Future.error(handleHttpError(e));
    }
  }

  Stream<List<ServiceUserResponseModel>> getAllStreamServiceUserData1() async* {
    List<ServiceUserResponseModel> data = [];
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      var url = Uri.parse("${Endpoints.baseUrl}ServiceUsers");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final item = json.decode(response.body);
        data = serviceUserResponseModelFromJson(response.body);
        printData('User List', response.body);
        yield data;
      } else {
        printData('User List Error', response.body);
      }
    } catch (e) {
      rethrow;
    }
    yield data;
  }

  Stream<List<ServiceUserResponseModel>> getAllStreamServiceUserData() async* {
    List<ServiceUserResponseModel> data = [];
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
      };
      var url = Uri.parse("${Endpoints.baseUrl}ServiceUser");
      final response =
          await cache.downloadFile(url.toString(), authHeaders: headers2);

      if (response.file.existsSync()) {
        String file = await response.file.readAsString();

        // Validate file content
        if (file.isNotEmpty && (file.startsWith('{') || file.startsWith('['))) {
          try {
            var data1 = serviceUserResponseModelFromJson(file);
            data = data1;
            printData('All Service User', file);
            yield data;
          } catch (e) {
            printData('All Gas Station Parsing Error', e.toString());
            yield* Stream.error('Invalid JSON format');
          }
        } else {
          response.file.deleteSync();
          var data1 = serviceUserResponseModelFromJson(file);
          data = data1;
          printData('All Service User', file);
          yield data;
        }
      } else {
        printData('File not found', response.file.path);
        yield [];
      }
    } catch (e) {
      printData('Error', e.toString());
      yield* Stream.error(handleHttpError(e));
    }
  }

  // Notification
  Future<bool> sendNotification({
    required String title,
    required String body,
    required String notificationType,
  }) async {
    try {
      var stingUrl = Uri.parse("${Endpoints.baseUrl}Notifications");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
        'userId': globals.userId.toString(),
      };
      final msg = jsonEncode(
        {
          "title": title,
          "body": body,
          "deviceToken": globals.deviceToken.toString(),
          "notificationType": notificationType,
        },
      );
      http.Response response =
          await http.post(stingUrl, body: msg, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        return true;
      } else {
        printData("Error", response.body);
        printData("Error3", globals.userId);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> sendNotificationUser({
    required String title,
    required String body,
    required String notificationType,
    required String userDeviceToken,
    required String userId,
  }) async {
    try {
      var stingUrl = Uri.parse("${Endpoints.baseUrl}Notifications");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
        'userId': userId,
      };
      final msg = jsonEncode(
        {
          "title": title,
          "body": body,
          "deviceToken": userDeviceToken,
          "notificationType": notificationType,
        },
      );
      http.Response response =
          await http.post(stingUrl, body: msg, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        return true;
      } else {
        printData("Error", response.body);
        printData("Error3", userId);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<NotificationResponseModel> getNotificationData(
      {required String id}) async {
    NotificationResponseModel data = NotificationResponseModel();
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      var url = Uri.parse("${Endpoints.baseUrl}Notifications/$id");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final item = json.decode(response.body);
        data = NotificationResponseModel.fromJson(
            item); // Mapping json response to our data model
        printData('Notification Details', data);
        return data;
      } else {
        printData('Notification Details Error', response.body);
        return data;
      }
    } catch (e) {
      printData('Error', e.toString());
      return Future.error(handleHttpError(e));
    }
  }

  Future<List<NotificationResponseModel>> getAllNotificationData() async {
    List<NotificationResponseModel> data = [];
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
      };
      var url = Uri.parse("${Endpoints.baseUrl}Notifications");
      final response =
          await cache.downloadFile(url.toString(), authHeaders: headers2);

      if (response.file.existsSync()) {
        String file = await response.file.readAsString();

        // Validate file content
        if (file.isNotEmpty && (file.startsWith('{') || file.startsWith('['))) {
          try {
            var data1 = notificationResponseModelFromJson(file);
            data = data1;
            printData('All Notification', file);
            return data;
          } catch (e) {
            printData('All Notification Parsing Error', e.toString());
            return Future.error('Invalid JSON format');
          }
        } else {
          response.file.deleteSync();
          var data1 = notificationResponseModelFromJson(file);
          data = data1;
          printData('All Notification', file);
          return data;
        }
      } else {
        printData('File not found', response.file.path);
        return [];
      }
    } catch (e) {
      printData('Error', e.toString());
      return Future.error(handleHttpError(e));
    }
  }

  Future<bool> addServiceUser({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
    required String dateOfBirth,
    required String imageProfile,
    required String communication,
    required String mobilization,
    required String washingAndDressing,
    required String medication,
    required String eyesight,
    required String socialActivities,
    required String fallRisk,
    required String foodAndFluid,
  }) async {
    try {
      var stingUrl = Uri.parse("${Endpoints.baseUrl}ServiceUser");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
      };
      final msg = jsonEncode(
        {
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
          "socialactivities": socialActivities,
          "fallRisk": fallRisk,
          "foodAndFluid": foodAndFluid,
        },
      );
      http.Response response =
          await http.post(stingUrl, body: msg, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateServiceUser({
    required String serviceUserId,
    String? firstName,
    String? lastName,
    String? email,
    String? address,
    String? dateOfBirth,
    String? imageProfile,
    String? communication,
    String? mobilization,
    String? washingAndDressing,
    String? medication,
    String? eyesight,
    String? socialActivities,
    String? fallRisk,
    String? foodAndFluid,
    String? dayString,
    String? morningUserId,
    String? morningUserName,
    String? nightUserId,
    String? nightUserName,
  }) async {
    try {
      var stingUrl =
          Uri.parse("${Endpoints.baseUrl}ServiceUser/$serviceUserId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
      };
      final msg = jsonEncode(
        {
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
          "socialactivities": socialActivities,
          "fallRisk": fallRisk,
          "foodAndFluid": foodAndFluid,
          dayString: {
            "morningVisitId": morningUserId,
            "nightVisitId": nightUserId,
            "morningVisitName": morningUserName,
            "nightVisitName": nightUserId
          }
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        return true;
      } else {
        printData("Error", response.body);
        printData("Error3", serviceUserId);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> deleteServiceUser({required String id}) async {
    try {
      var stingUrl = Uri.parse("${Endpoints.baseUrl}ServiceUser/$id");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      http.Response response = await http.delete(stingUrl, headers: headers);
      printData("dataResponse", response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("successRegister", response.body);

        return response;
      } else {
        printData("Error", response.body);
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }

// User List

  Future<List<UserResponseModel>> getAllUserData() async {
    List<UserResponseModel> data = [];
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
      };
      var url = Uri.parse("${Endpoints.baseUrl}AuthUsers");
      final response =
          await cache.downloadFile(url.toString(), authHeaders: headers2);

      if (response.file.existsSync()) {
        String file = await response.file.readAsString();

        // Validate file content
        if (file.isNotEmpty && (file.startsWith('{') || file.startsWith('['))) {
          try {
            var data1 = userResponseModelFromJson(file);
            data = data1;
            printData('All User Data', file);
            return data;
          } catch (e) {
            printData('All User Parsing Error', e.toString());
            return Future.error('Invalid JSON format');
          }
        } else {
          response.file.deleteSync();
          var data1 = userResponseModelFromJson(file);
          data = data1;
          printData('All User Data', file);
          return data;
        }
      } else {
        printData('File not found', response.file.path);
        return [];
      }
    } catch (e) {
      printData('Error', e.toString());
      return Future.error(handleHttpError(e));
    }
  }

  Stream<List<UserResponseModel>> getAllStreamUserData() async* {
    List<UserResponseModel> data = [];
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
      };
      var url = Uri.parse("${Endpoints.baseUrl}AuthUsers");
      final response =
          await cache.downloadFile(url.toString(), authHeaders: headers2);

      if (response.file.existsSync()) {
        String file = await response.file.readAsString();

        // Validate file content
        if (file.isNotEmpty && (file.startsWith('{') || file.startsWith('['))) {
          try {
            var data1 = userResponseModelFromJson(file);
            data = data1;
            printData('All User Data', file);
            yield data;
          } catch (e) {
            printData('All User Data Parsing Error', e.toString());
            yield* Stream.error('Invalid JSON format');
          }
        } else {
          response.file.deleteSync();
          var data1 = userResponseModelFromJson(file);
          data = data1;
          printData('All User', file);
          yield data;
        }
      } else {
        printData('File not found', response.file.path);
        yield [];
      }
    } catch (e) {
      printData('Error', e.toString());
      yield* Stream.error(handleHttpError(e));
    }
  }

  Future<http.Response> deleteUser({required String id}) async {
    try {
      var stingUrl = Uri.parse("${Endpoints.baseUrl}AuthUsers/$id");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      http.Response response = await http.delete(stingUrl, headers: headers);
      printData("dataResponse", response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("successRegister", response.body);

        return response;
      } else {
        printData("Error", response.body);
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }
}
