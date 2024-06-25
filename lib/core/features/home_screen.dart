// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:ui';

import 'package:pe_je_healthcare_admin/core/components/helpers/globals.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/features/account/views/account_page.dart';
import 'package:pe_je_healthcare_admin/core/features/home/states/home_provider.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/service_users/service_user_page.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/users/users_list.dart';

import '../components/utils/colors.dart';
import '../components/utils/package_export.dart';
import 'account/states/account_provider.dart';

class HomeScreenPage extends ConsumerStatefulWidget {
  const HomeScreenPage({
    super.key,
  });

  @override
  _NavBarfeaturestate createState() => _NavBarfeaturestate();
}

class _NavBarfeaturestate extends ConsumerState<HomeScreenPage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    final provider = ref.read(accountProvider);
    provider.getPostData(context);
    final users = ref.read(homeProvider);
    users.getAllUsersData(context);
    users.getAllServiceUserData(context);
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      provider.getPostData(context);
      users.getAllUsersData(context);
      users.getAllServiceUserData(context);
    });
  }

  Future<bool> _onPopInvoked(bool isPop) async {
    return (await showDialog(
          context: context,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              title: const Text(
                'Exit App',
                style: TextStyle(color: AppColors.primary),
              ),
              content: const Text(
                'Do you want to exit the app?',
                style: TextStyle(color: AppColors.primary),
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'No',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            ),
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, WidgetRef ref, Widget? child) {
      final provider = ref.read(accountProvider);
      provider.getPostData(context);
      provider.userData;
      final users = ref.read(homeProvider);
      users.getAllUsersData(context);
      users.getAllServiceUserData(context);
      return PopScope(
        onPopInvoked: _onPopInvoked,
        canPop: false,
        child: Scaffold(
          body: Container(
            height: getScreenHeight(context),
            width: getScreenWidth(context),
            color: AppColors.white,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpacing(context, 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: AppText(
                        text: "Welcome to PE & JE Health Care Services",
                        textAlign: TextAlign.center,
                        fontSize: 12,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                  ),
                  addVerticalSpacing(context, 10),
                  Container(
                    height: 210,
                    width: getScreenWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: AppColors.primary,
                      image: const DecorationImage(
                          image: AssetImage("assets/images/home_image.png"),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpacing(context, 30),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 100.0),
                          child: GestureDetector(
                            onTap: () {
                              navigateToRoute(context, const AccountPage());
                            },
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, bottom: 15.0),
                                child: AppText(
                                    text: "  Hi ${globals.userName}",
                                    textAlign: TextAlign.start,
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  addVerticalSpacing(context, 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigateToRoute(context, const ServiceUserPage());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 245, 221, 237),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 35.0, bottom: 35.0, right: 15, left: 15),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/service_user.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  addVerticalSpacing(context, 30),
                                  const AppText(
                                      text: "Visit Service Users",
                                      textAlign: TextAlign.start,
                                      fontSize: 19,
                                      color: AppColors.primary,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            navigateToRoute(context, const UserListPage());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 245, 221, 237),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 35.0, bottom: 35.0, right: 15, left: 15),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/holiday.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  addVerticalSpacing(context, 30),
                                  const AppText(
                                      text: "All Users List",
                                      textAlign: TextAlign.start,
                                      fontSize: 19,
                                      color: AppColors.primary,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpacing(context, 5),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
