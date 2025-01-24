// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';

import 'package:pe_je_healthcare_admin/core/components/helpers/base_service_upload.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/features/auth/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../../components/utils/colors.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';
import '../services/account_services.dart';
import '../states/account_provider.dart';
import 'help_support_page.dart';
import 'notification_page.dart';
import 'personal_detail_page.dart';
import 'privacy_policy_page.dart';
import 'terms_of_service_page.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<AccountPage> {
  String selectedCarType = "";

  late AccountNotifier provider;
  @override
  void initState() {
    super.initState();
    provider = ref.read(accountProvider.notifier);
    provider.getAccount();
    provider.userData;
  }

  @override
  void dispose() {
    super.dispose();
  }

  File? pickedCv2;
  String imageFile = "";

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
        });
      }
      String imageHandling = await ApiService.upload(
        pickedCv2!.absolute.path.toString(),
      );
      AccountService().updateUsers(imagePath: imageHandling);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldMessengerState>();
    final accountProviderd = ref.read(accountProvider.notifier);
    accountProviderd.getAccount();
    var user = accountProviderd.userData;
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Scaffold(
          key: key,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            //toolbarHeight: 8.h,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: AppColors.white, size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const AppText(
                text: "Profile",
                textAlign: TextAlign.center,
                fontSize: 19,
                color: AppColors.white,
                fontStyle: FontStyle.normal,
                isBody: true,
                fontWeight: FontWeight.w600),
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                addVerticalSpacing(context, 50),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 0, right: 0, top: 20),
                              child: pickedCv2 == null
                                  ? GestureDetector(
                                      onTap: () async {
                                        handleCVUpload2();
                                      },
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 37,
                                            backgroundImage: user!.imagePath
                                                    .toString()
                                                    .isEmpty
                                                ? const NetworkImage(
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                                                // ignore: unnecessary_null_comparison
                                                : user.imagePath == null
                                                    ? const NetworkImage(
                                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                                                    : NetworkImage(user
                                                        .imagePath
                                                        .toString())),
                                      ),
                                    )
                                  : Center(
                                      child: Stack(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              handleCVUpload2();
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0, right: 0),
                                              child: CircleAvatar(
                                                radius: 40,
                                                backgroundColor: Colors.grey,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 37,
                                                  backgroundImage:
                                                      FileImage(pickedCv2!),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                          const Positioned(
                              top: 70,
                              left: 50,
                              right: 50,
                              child: Icon(Icons.camera_alt,
                                  color: AppColors.primary, size: 30)),
                        ],
                      ),
                      addVerticalSpacing(context, 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: "${user!.firstName} ${user.surName}",
                              textAlign: TextAlign.start,
                              fontSize: 22,
                              isBody: true,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          AppText(
                              text: user.email.toString(),
                              textAlign: TextAlign.start,
                              isBody: true,
                              fontSize: 23,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                          AppText(
                              text: user.staffCode.toString(),
                              textAlign: TextAlign.start,
                              isBody: true,
                              fontSize: 23,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: AppColors.grey,
                  thickness: 1,
                ),
                addVerticalSpacing(context, 40),
                ListTile(
                  leading: Image.asset("assets/images/account_icon.png",
                      height: 20, width: 20, color: AppColors.primary),
                  title: const AppText(
                      text: "Personal Details",
                      textAlign: TextAlign.start,
                      fontSize: 22,
                      isBody: false,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  subtitle: const AppText(
                      text: "Information about you",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      isBody: true,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  onTap: () {
                    navigateToRoute(context, const AccountDetailsPage());
                  },
                ),
                ListTile(
                  leading: Image.asset("assets/images/notification_icon.png",
                      height: 18, width: 18, color: AppColors.primary),
                  title: const AppText(
                      text: "Notifications",
                      textAlign: TextAlign.start,
                      fontSize: 22,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      isBody: false,
                      fontWeight: FontWeight.w600),
                  subtitle: const AppText(
                      text: "Change your notification settings",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      color: AppColors.black,
                      isBody: true,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  onTap: () {
                    navigateToRoute(context, const NotificationsPage());
                  },
                ),
                ListTile(
                  leading: Image.asset("assets/images/helpL_icon.png",
                      height: 20, width: 20, color: AppColors.primary),
                  title: const AppText(
                      text: "Help and Support",
                      textAlign: TextAlign.start,
                      isBody: false,
                      fontSize: 22,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  subtitle: const AppText(
                      text: "Get enquiries or complaints",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      color: AppColors.black,
                      isBody: true,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  onTap: () {
                    navigateToRoute(context, const HelpAndSupportPage());
                  },
                ),
                ListTile(
                  leading: Image.asset("assets/images/helpL_icon.png",
                      height: 18, width: 18, color: AppColors.primary),
                  title: const AppText(
                      text: "Terms of Service",
                      textAlign: TextAlign.start,
                      isBody: false,
                      fontSize: 22,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  subtitle: const AppText(
                      text: "What you must know",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      isBody: true,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  onTap: () {
                    navigateToRoute(context, const TermsOfServicePage());
                  },
                ),
                ListTile(
                  leading: Image.asset("assets/images/privacy.png",
                      height: 18, width: 18, color: AppColors.primary),
                  title: const AppText(
                      text: "Privacy Policy",
                      textAlign: TextAlign.start,
                      fontSize: 22,
                      isBody: false,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  subtitle: const AppText(
                      text: "How we protect your information",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      isBody: true,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  onTap: () {
                    navigateToRoute(context, const PrivacyPolicyPage());
                  },
                ),
                addVerticalSpacing(context, 30),
                ListTile(
                  onTap: () async {
                    await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const AppText(
                                text: "Sign Out of PE & JE HealthCare",
                                textAlign: TextAlign.center,
                                fontSize: 22,
                                isBody: false,
                                color: AppColors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                            content: const AppText(
                                text:
                                    "Do you want to sign out of PE & JE HealthCare App?",
                                textAlign: TextAlign.center,
                                fontSize: 22,
                                isBody: true,
                                color: AppColors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal),
                            actions: [
                              CupertinoDialogAction(
                                  child: const Text("Proceed"),
                                  onPressed: () async {
                                    accountProviderd.handleSignOut();
                                    navigateAndRemoveUntilRoute(
                                        context, const LoginScreens());
                                  }),
                              CupertinoDialogAction(
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  }),
                            ],
                          );
                        });
                  },
                  leading: Image.asset(
                    "assets/images/logout_icon.png",
                    height: 23,
                    width: 23,
                  ),
                  title: const AppText(
                      text: "Logout",
                      textAlign: TextAlign.start,
                      isBody: true,
                      fontSize: 22,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ],
          ),
        ));
  }
}
