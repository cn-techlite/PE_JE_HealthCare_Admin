// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/features/auth/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../../components/utils/colors.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';
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
                addVerticalSpacing(context, 5),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 37,
                          backgroundImage: NetworkImage(
                            user?.imagePath == null ||
                                    user!.imagePath.toString().isEmpty
                                ? image.toString()
                                : user.imagePath.toString(),
                          ),
                        ),
                      ),
                      addHorizontalSpacing(5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "${user!.firstName} ${user.surName}",
                            textAlign: TextAlign.start,
                            fontSize: 22,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            isBody: true,
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            text: user.email.toString(),
                            textAlign: TextAlign.start,
                            fontSize: 23,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            isBody: true,
                            fontWeight: FontWeight.w400,
                          ),
                          AppText(
                            text: user.staffCode.toString(),
                            textAlign: TextAlign.start,
                            fontSize: 23,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            isBody: true,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: AppColors.grey,
                  thickness: 1,
                ),
                addVerticalSpacing(context, 4),
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
                addVerticalSpacing(context, 3),
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
