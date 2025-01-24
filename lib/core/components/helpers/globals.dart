import 'dart:convert';

import 'package:pe_je_healthcare_admin/core/components/helpers/notification_service.dart';
import '../../features/auth/model/login_response_model.dart';
import '../utils/constants.dart';
import '../utils/package_export.dart';
import 'endpoints.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

class AppGlobals {
  factory AppGlobals() => instance;

  AppGlobals._();

  static final AppGlobals instance = AppGlobals._();

  String? isLoggedIn;
  int? isViewed;
  StopWatchTimer? stopWatchTimer;
  String? userEmail = "";
  String? userPassword = "";
  String? token = "";
  String? userId = "";
  String? userName = "";
  String? deviceToken = "";

  Future<void> init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = await getFromLocalStorage(name: "userId") ?? "";
    token = await getFromLocalStorage(name: "token") ?? "";
    userEmail = await getFromLocalStorage(name: "userEmail") ?? "";
    userPassword = await getFromLocalStorage(name: "userPassword") ?? "";
    userId = await getFromLocalStorage(name: "userId") ?? "";
    userName = await getFromLocalStorage(name: "userName") ?? "";
    deviceToken = await getFromLocalStorage(name: "deviceToken") ?? "";
    isViewed = preferences.getInt('onBoard');
    isLoggedIn = preferences.getString('isLoggedIn') ?? "";

    isViewed = preferences.getInt('onBoard');
    isLoggedIn = preferences.getString('isLoggedIn') ?? "";
    printData("userId", userId);
    printData("UserEmail", userEmail);
    printData("Token", token);
    printData("deviceToken", deviceToken);
  }

  Future<void> login() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String url = Endpoints.usersLoginUrl;
    var stingUrl = Uri.parse(Endpoints.baseUrl + url);
    String userPassword = await getFromLocalStorage(name: "userPassword") ?? "";
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final msg = jsonEncode({
        "email": userEmail,
        "password": userPassword,
      });
      http.Response response =
          await http.post(stingUrl, body: msg, headers: headers);
      printData("dataResponse", response.body);
      printData("URL", stingUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(jsonDecode(response.body));
        setToLocalStorage(name: "token", data: loginResponseModel.token!);
        setToLocalStorage(name: "userEmail", data: loginResponseModel.email!);
        setToLocalStorage(name: "userId", data: loginResponseModel.userId!);
        setToLocalStorage(name: "userName", data: loginResponseModel.fullName!);
        printData("verify", loginResponseModel.email);
        await init();
      } else if (response.statusCode == 401) {
        printData("Error", response.body);
        preferences.remove("token");
        preferences.remove("userEmail");
        preferences.remove("userId");
        preferences.remove("InfoCompleted");
        preferences.remove("userPassword");
        await init();
      } else {
        printData("errors", response.body);
        printData("Error", response.body);
        preferences.remove("token");
        preferences.remove("userEmail");
        preferences.remove("userId");
        preferences.remove("InfoCompleted");
        preferences.remove("userPassword");
        await init();
      }
    } catch (e) {
      rethrow;
    }
  }

  void dispose() {}
}

AppGlobals globals = getIt.get<AppGlobals>();
Future<void> setupLocator() async {
// Register dependencies

  getIt.registerLazySingleton(() => NotificationService());
}
