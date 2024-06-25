import 'package:pe_je_healthcare_admin/core/features/account/model/available_model.dart';
import 'package:pe_je_healthcare_admin/core/features/account/services/account_services.dart';

import '../../../components/utils/constants.dart';
import '../../../components/utils/package_export.dart';
import '../model/user_response_model.dart';

class AccountProvider with ChangeNotifier {
  RegisterResponseModel userData = RegisterResponseModel();

  bool haveData = false;
  bool loading = false;
  final AccountService _services = AccountService();

  getPostData(context) async {
    haveData = true;
    // notifyListeners();
    userData = await _services.getUserData();
    haveData = false;
    notifyListeners();
  }

  updateProfileImage({
    required context,
    required String userId,
    required String imageFile,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateProfilePics(
      userId: userId,
      imageFile: imageFile,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  updateNames({
    required context,
    required String userId,
    required String firstName,
    required String lastName,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateNames(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updatePhone(
      {required context,
      required String userId,
      required String phoneNo}) async {
    loading = true;
    notifyListeners();
    await _services.updatePhoneNo(
      userId: userId,
      phoneNo: phoneNo,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateProofOfAddress(
      {required context,
      required String userId,
      required String imageFile}) async {
    loading = true;
    notifyListeners();
    await _services.updateProofOfAddress(
      userId: userId,
      imageFile: imageFile,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateAddress({
    required context,
    required String userId,
    required String address,
    required String addressPostCodes,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateAddress(
        userId: userId, address: address, addressPostCodes: addressPostCodes);
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateNationality(
      {required context,
      required String userId,
      required String nationality}) async {
    loading = true;
    notifyListeners();
    await _services.updateNationality(userId: userId, nationality: nationality);
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateBankDetails({
    required context,
    required String userId,
    required String bankName,
    required String accountNumber,
    required String bankSortCode,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateBankDetails(
        userId: userId,
        bankName: bankName,
        accountNumber: accountNumber,
        bankSortCode: bankSortCode);
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateNextOfKin({
    required context,
    required String userId,
    required String nextOfKin,
    required String nextOfKinPhoneNo,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateNextOfKin(
      userId: userId,
      nextOfKin: nextOfKin,
      nextOfKinPhoneNo: nextOfKinPhoneNo,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateWorkExperience(
      {required context,
      required String userId,
      required String workExperience}) async {
    loading = true;
    notifyListeners();
    await _services.updateWorkExperience(
      userId: userId,
      workExperience: workExperience,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateInsuranceNo(
      {required context,
      required String userId,
      required String insuranceNo}) async {
    loading = true;
    notifyListeners();
    await _services.updateInsuranceNo(
      userId: userId,
      insuranceNo: insuranceNo,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateReferenceEmail({
    required context,
    required String userId,
    required String referenceEmail1,
    required String referenceEmail2,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateReferenceEmail(
      userId: userId,
      referenceEmail1: referenceEmail1,
      referenceEmail2: referenceEmail2,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateDBS({
    required context,
    required String userId,
    required String dbsCode,
    required String dbsFile,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateDBS(
      userId: userId,
      dbsCode: dbsCode,
      dbsFile: dbsFile,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateTrainingCertificate(
      {required context,
      required String userId,
      required String imageFile}) async {
    loading = true;
    notifyListeners();
    await _services.updateTrainingCertificate(
      userId: userId,
      imageFile: imageFile,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateAgreement({
    required context,
    required String userId,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateAgreement(
      userId: userId,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateCvUpload(
      {required context,
      required String userId,
      required String imageFile}) async {
    loading = true;
    notifyListeners();
    await _services.updateCvUpload(
      userId: userId,
      imageFile: imageFile,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateHolidays({
    required context,
    required String userId,
    required String startDate,
    required String endDate,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateHolidays(
      userId: userId,
      startDate: startDate,
      endDate: endDate,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateHolidayStatus({
    required context,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateHolidayValue();
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateAvailability({
    required context,
    required String userId,
    required UpdateAvailableModel available,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateAvailability(
      userId: userId,
      available: available,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  void updateWorkHistory({
    required context,
    required String userId,
    required String companyName,
    required String positionHeld,
    required String workStartDate,
    required String workEndDate,
  }) async {
    loading = true;
    notifyListeners();
    await _services.updateWorkHistory(
      userId: userId,
      companyName: companyName,
      positionHeld: positionHeld,
      workStartDate: workStartDate,
      workEndDate: workEndDate,
    );
    getPostData(context);
    loading = false;
    notifyListeners();
  }

  Future<void> handleSignOut() async {
    removeFromLocalStorage(name: "token");
    removeFromLocalStorage(name: "userEmail");
    removeFromLocalStorage(name: "userId");
    removeFromLocalStorage(name: "InfoCompleted");
    removeFromLocalStorage(name: "userPassword");
  }
}

final accountProvider = ChangeNotifierProvider<AccountProvider>(
  (ref) => AccountProvider(),
);
final streamRepo = Provider<AccountService>((ref) => AccountService());
