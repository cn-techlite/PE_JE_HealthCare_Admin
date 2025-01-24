// ignore_for_file: use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/features/account/services/account_services.dart';

import '../../../components/utils/constants.dart';
import '../../../components/utils/package_export.dart';
import '../model/user_response_model.dart';

abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountSuccess extends AccountState {
  RegisterResponseModel userData;

  AccountSuccess({required this.userData});
}

class AccountFailure extends AccountState {
  final String error;

  AccountFailure(this.error);

  @override
  String toString() {
    return 'AuthFailure: $error';
  }
}

class AccountNotifier extends StateNotifier<AccountState> {
  final AccountService services;
  RegisterResponseModel? userData;

  AccountNotifier({required this.services}) : super(AccountInitial());

  getAccount() async {
    try {
      if (!mounted) {
        state = AccountLoading();
        return;
      }
      RegisterResponseModel response2 = await services.getUserData();
      userData = response2;
      state = AccountSuccess(userData: response2);
    } on Exception catch (e) {
      state = AccountFailure(e.toString());
    }
  }

  updateUser(
      {String? firstName,
      String? lastName,
      String? phoneNo,
      String? imagePath,
      String? sex,
      String? userState,
      String? locality,
      String? address,
      String? branch,
      required BuildContext context}) async {
    try {
      if (!mounted) {
        state = AccountLoading();
        return;
      }
      var response = await services.updateUsers(
        firstName: firstName,
        lastName: lastName,
        phoneNo: phoneNo,
        imagePath: imagePath,
        address: address,
        sex: sex,
        state: userState,
        locality: locality,
        branch: branch,
      );
      if (response) {
        if (!mounted) return;
        state = AccountSuccess(userData: userData!);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User Updated Successfully")));
      } else {
        state = AccountFailure("User Not Found");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User Not Found")));
      }
    } on Exception catch (e) {
      state = AccountFailure(e.toString());
    }
  }

  Future<void> handleSignOut() async {
    removeFromLocalStorage(name: "token");
    removeFromLocalStorage(name: "userEmail");
    removeFromLocalStorage(name: "userId");
    removeFromLocalStorage(name: "InfoCompleted");
    removeFromLocalStorage(name: "userPassword");
  }
}

final streamRepositoryProvider =
    Provider<AccountService>((ref) => AccountService());
final accountProvider =
    StateNotifierProvider<AccountNotifier, AccountState>((ref) {
  final AccountService service = AccountService();
  return AccountNotifier(services: service);
});
