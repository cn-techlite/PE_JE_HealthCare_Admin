// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/features/home/services/home_service.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/service_users/add_service_users.dart';
import 'package:pe_je_healthcare_admin/core/features/home_screen.dart';

import '../../../components/widgets/custom_snackbar.dart';

class AddServiceUserScreen extends ConsumerStatefulWidget {
  const AddServiceUserScreen({
    super.key,
  });
  @override
  ConsumerState<AddServiceUserScreen> createState() =>
      AddServiceUserScreenController();
}

class AddServiceUserScreenController
    extends ConsumerState<AddServiceUserScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController address;
  late TextEditingController dateOfBirth;
  late TextEditingController communication;
  late TextEditingController mobilization;
  late TextEditingController washingAndDressing;
  late TextEditingController medication;
  late TextEditingController eyesight;
  late TextEditingController socialActivities;
  late TextEditingController fallRisk;
  late TextEditingController foodAndFluid;
  final FocusNode? firstNameFocusNode = FocusNode();
  final FocusNode? lastNameFocusNode = FocusNode();
  final FocusNode? emailFocusNode = FocusNode();
  final FocusNode? addressFocusNode = FocusNode();
  final FocusNode? dateOfBirthFocusNode = FocusNode();
  final FocusNode? communicationFocusNode = FocusNode();
  final FocusNode? mobilizationFocusNode = FocusNode();
  final FocusNode? washingAndDressingFocusNode = FocusNode();
  final FocusNode? medicationFocusNode = FocusNode();
  final FocusNode? eyesightFocusNode = FocusNode();
  final FocusNode? socialActivitiesFocusNode = FocusNode();
  final FocusNode? fallRiskFocusNode = FocusNode();
  final FocusNode? foodAndFluidFocusNode = FocusNode();
  String imageProfile = "";

  bool saveButtonPressed = false;
  bool isLoading = false;
  File? pickedCv2;
  String? imageUrl;
  void handleCVUpload2() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        String extension = image.path.split(".").last;
        String targetPath = "${Directory.systemTemp.path}/temp.$extension";
        final compressedImage = await FlutterImageCompress.compressAndGetFile(
          image.path,
          targetPath,
          quality: 50,
        );
        setState(() {
          pickedCv2 = File(compressedImage!.path.toString());
          imageUrl = pickedCv2!.path;
        });
      }
      String image1 = await HomeServices().upload(imageUrl.toString());
      debugPrint(image1);
      setState(() {
        imageProfile = image1;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    dateOfBirth = TextEditingController();
    communication = TextEditingController();
    mobilization = TextEditingController();
    washingAndDressing = TextEditingController();
    medication = TextEditingController();
    eyesight = TextEditingController();
    socialActivities = TextEditingController();
    fallRisk = TextEditingController();
    foodAndFluid = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    address.dispose();
    dateOfBirth.dispose();
    communication.dispose();
    mobilization.dispose();
    washingAndDressing.dispose();
    medication.dispose();
    eyesight.dispose();
    socialActivities.dispose();
    fallRisk.dispose();
    foodAndFluid.dispose();
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
      bool isValid = await HomeServices().addServiceUser(
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          address: address.text.trim(),
          dateOfBirth: dateOfBirth.text.trim(),
          imageProfile: imageProfile,
          communication: communication.text.trim(),
          mobilization: mobilization.text.trim(),
          washingAndDressing: washingAndDressing.text.trim(),
          medication: medication.text.trim(),
          eyesight: eyesight.text.trim(),
          socialActivities: socialActivities.text.trim(),
          fallRisk: fallRisk.text.trim(),
          foodAndFluid: foodAndFluid.text.trim());
      if (isValid) {
        setState(() {
          isLoading = false;
        });
        navigateAndRemoveUntilRoute(context, const HomeScreenPage());
      } else {
        setState(() {
          isLoading = false;
        });
        showCustomSnackbar(context,
            title: "Service User",
            content: "Error in Adding Service Users",
            type: SnackbarType.error,
            isTopPosition: false);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AddServiceUserScreenView(this);
  }
}
