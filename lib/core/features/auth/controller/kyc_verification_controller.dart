// ignore_for_file: use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/features/home/services/home_service.dart';
import 'package:flutter/foundation.dart';
import 'package:pe_je_healthcare_admin/core/features/home_screen.dart';

import '../../../components/helpers/globals.dart';
import '../../account/states/account_provider.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/utils/package_export.dart';
import '../services/auth_service.dart';
import '../view/kyc_verification_view.dart';

class KYCVerificationScreen extends ConsumerStatefulWidget {
  const KYCVerificationScreen({
    super.key,
  });
  @override
  ConsumerState<KYCVerificationScreen> createState() =>
      KYCVerificationScreenController();
}

class KYCVerificationScreenController
    extends ConsumerState<KYCVerificationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController phoneNo;
  late TextEditingController dateOfBirth;
  late TextEditingController locationAddress;
  late TextEditingController countryLocation;
  late TextEditingController addressPostCodes;
  late TextEditingController nextOfKin;
  final FocusNode? phoneNoFocusNode = FocusNode();
  final FocusNode? dateOfBirthFocusNode = FocusNode();
  final FocusNode? locationAddressFocusNode = FocusNode();
  final FocusNode? countryLocationFocusNode = FocusNode();
  final FocusNode? addressPostCodesFocusNode = FocusNode();
  final FocusNode? nextOfKinFocusNode = FocusNode();

  List<String> languages = [];
  String? sex;
  final String completed = "Yes";
  List<String> sexList = [
    'Male',
    'Female',
  ];

  bool saveButtonPressed = false;
  bool isLoading = false;
  late AccountProvider authProviders;

  @override
  void initState() {
    super.initState();
    phoneNo = TextEditingController();
    dateOfBirth = TextEditingController();
    locationAddress = TextEditingController();
    countryLocation = TextEditingController();
    addressPostCodes = TextEditingController();
    nextOfKin = TextEditingController();
    authProviders = ref.read(accountProvider);
  }

  @override
  void dispose() {
    super.dispose();
    phoneNo.dispose();
    dateOfBirth.dispose();
    locationAddress.dispose();
    countryLocation.dispose();
    addressPostCodes.dispose();
    nextOfKin.dispose();
  }

  bool isChecked = false;
  urlString(String? url) async {
    final link = Uri.parse(url!);
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw 'Could not launch $url';
    }
  }

  onChanged(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }

  selectSex(String value) {
    setState(() {
      sex = value;
      if (kDebugMode) {
        print(sex);
      }
    });
  }

  final format = DateFormat("dd MMM, yyyy");

  userRegister() async {
    setState(() {
      saveButtonPressed = true;
    });
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      bool isValid = await AuthService().updateProfileInfo(
          userId: globals.userId.toString(),
          phoneNo: phoneNo.text.trim(),
          address: locationAddress.text.trim(),
          dateOfBirth: dateOfBirth.text.trim(),
          sex: sex.toString(),
          nationality: countryLocation.text.trim(),
          addressPostCodes: addressPostCodes.text.trim());
      if (isValid) {
        setState(() {
          isLoading = false;
        });
        await HomeServices().sendNotification(
          title: "KYC Verification",
          body: "You have Successfully Done KYC Verification",
          notificationType: "KYC Verification",
        );
        await AuthService().updateDeviceToken();
        navigateAndRemoveUntilRoute(context, const HomeScreenPage());
      } else {
        setState(() {
          isLoading = false;
        });
        showInfoAlertWithAction(
            context, "Error", "An Error Occurred, Please Try Again", () {});
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return KYCVerificationScreenView(this);
  }
}
