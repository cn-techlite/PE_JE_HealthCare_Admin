import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pe_je_healthcare_admin/core/components/extension/error_handling.dart';
import '../../../components/helpers/endpoints.dart';
import '../../../components/helpers/globals.dart';
import '../../../components/utils/constants.dart';

import '../model/user_response_model.dart';

class AccountService {
  Future<RegisterResponseModel> getUserData() async {
    RegisterResponseModel data = RegisterResponseModel();
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      var url = Uri.parse("${Endpoints.baseUrl}${Endpoints.usersUrl}/profile");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final item = json.decode(response.body);
        data = RegisterResponseModel.fromJson(
            item); // Mapping json response to our data model
        printData('User Details', data);
        printData("User Response", response.body);
        return data;
      } else {
        printData('User Details Error', response.body);
      }
    } catch (e) {
      printData('Error', e.toString());
      return Future.error(handleHttpError(e));
    }
    return data;
  }

  Future<http.Response> updateUsers({
    String? firstName,
    String? lastName,
    String? phoneNo,
    String? imagePath,
    String? sex,
    String? state,
    String? locality,
    String? address,
    String? branch,
  }) async {
    try {
      var stingUrl =
          Uri.parse("${Endpoints.baseUrl}${Endpoints.usersUrl}/update-user");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "firstName": firstName,
          "lastName": lastName,
          "phoneNo": phoneNo,
          "imagePath": imagePath,
          "sex": sex,
          "state": state,
          "locality": locality,
          "address": address,
          "branch": branch,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getUserData();
        return response;
      } else {
        printData("Error", response.body);
        return response;
      }
    } catch (e) {
      printData('Error', e.toString());
      return Future.error(handleHttpError(e));
    }
  }

  Future<http.Response> addFeedBack({
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
        return response;
      } else {
        printData("Error", response.body);
        return response;
      }
    } catch (e) {
      printData('Error', e.toString());
      return Future.error(handleHttpError(e));
    }
  }
}
