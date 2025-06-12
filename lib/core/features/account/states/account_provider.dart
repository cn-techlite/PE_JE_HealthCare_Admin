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
