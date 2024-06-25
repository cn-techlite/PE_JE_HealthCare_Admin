import 'dart:convert';
import 'dart:math';
import 'package:pe_je_healthcare_admin/core/components/helpers/globals.dart';

import 'package:http/http.dart' as http;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../components/helpers/endpoints.dart';
import '../../../components/utils/constants.dart';
import '../../../components/utils/package_export.dart';
import '../model/login_response_model.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateException,
  authenticateCanceled,
}

class AuthProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final SignInWithApple appleSignIn = SignInWithApple();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  String userId = "";
  String reUserId = "";
  String imagePath = "";

  Status _status = Status.uninitialized;

  Status get status => _status;

  String? getUserFirebaseId() {
    return globals.userId;
  }

  Future<bool> isLoggedIn() async {
    bool isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn && globals.userId?.isNotEmpty == true) {
      return true;
    } else {
      return false;
    }
  }

  void google({
    required String userId,
    required String name,
    required String email,
    required String photoUrl,
  }) async {
    var stingUrl = Uri.parse(Endpoints.baseUrl + Endpoints.usersUrl);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final msg = jsonEncode(
      {
        "lastName": "",
        "firstName": name,
        "email": email,
        "password": userId,
      },
    );
    http.Response response =
        await http.post(stingUrl, body: msg, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(jsonDecode(response.body));
      setToLocalStorage(name: "token", data: loginResponseModel.token!);
      setToLocalStorage(name: "userEmail", data: loginResponseModel.email!);
      setToLocalStorage(name: "userPassword", data: userId);
      setToLocalStorage(name: "userId", data: loginResponseModel.userId!);
      printData("Login Success", loginResponseModel);
      globals.init();
    }
    // await globals.userDetails();
  }

  Future<bool> userExists(String uid) async => (await firebaseFirestore
          .collection('UsersCollection')
          .where("Uid", isEqualTo: uid)
          .get())
      .docs
      .isNotEmpty;

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  void handleException() {
    _status = Status.authenticateException;
    notifyListeners();
  }

  Future<void> handleSignOut() async {
    _status = Status.uninitialized;
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
    removeFromLocalStorage(name: "userId");
  }
}

final authProvider = ChangeNotifierProvider<AuthProvider>(
  (ref) => AuthProvider(),
);
