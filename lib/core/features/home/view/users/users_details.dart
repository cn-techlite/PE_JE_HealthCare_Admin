// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/users_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/states/home_provider.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/users/user_availablity.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/users/user_work_history.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/users/view_users_asigned.dart';
import '../../../../components/utils/package_export.dart';

class UserDetailsPage extends ConsumerStatefulWidget {
  const UserDetailsPage({
    super.key,
    required this.userChat,
  });

  final UserResponseModel userChat;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<UserDetailsPage> {
  late HomeNotifier homeProviders;

  @override
  void initState() {
    homeProviders = ref.read(homeProvider.notifier);
    homeProviders.getAllUsersData();
    homeProviders.allUserData;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildItem(BuildContext context, UserResponseModel userChat) {
    // Timestamp? t = userChat.timestamp;
    DateTime d = userChat.createdAt!;
    String time = DateFormat.yMMMd().add_jm().format(d);
    return ListView(
      physics: const ScrollPhysics(),
      children: <Widget>[
        addVerticalSpacing(context, 20),
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 57,
                backgroundImage: userChat.profilePicture.toString().isEmpty
                    ? const NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                    // ignore: unnecessary_null_comparison
                    : userChat.profilePicture == null
                        ? const NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                        : NetworkImage(userChat.profilePicture.toString())),
          ),
        ),
        addVerticalSpacing(context, 50),
        GestureDetector(
          onTap: () {
            navigateToRoute(
                context,
                ViewUserAssignedServiceUser(
                  id: userChat.id.toString(),
                ));
          },
          child: const AppText(
              text: "View Task Users",
              textAlign: TextAlign.center,
              isBody: true,
              fontSize: 14,
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        addVerticalSpacing(context, 50),
        Center(
          child: AppText(
              text: "${userChat.firstName} ${userChat.lastName}",
              textAlign: TextAlign.start,
              fontSize: 19,
              isBody: true,
              color: AppColors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        Center(
          child: AppText(
              text: "${userChat.email}",
              textAlign: TextAlign.start,
              fontSize: 19,
              isBody: true,
              color: AppColors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        Center(
          child: AppText(
              text: "${userChat.phoneNo}",
              textAlign: TextAlign.start,
              isBody: true,
              fontSize: 19,
              color: AppColors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        Center(
          child: RichText(
            text: TextSpan(
              text: "D.O.B:",
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                  fontSize: fontSized(context, 16)),
              children: <TextSpan>[
                TextSpan(
                    text: " ${userChat.dateOfBirth}",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 20))),
              ],
            ),
          ),
        ),
        Center(
          child: RichText(
            text: TextSpan(
              text: "Date Created: ",
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                  fontSize: fontSized(context, 16)),
              children: <TextSpan>[
                TextSpan(
                    text: time,
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 20))),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        addVerticalSpacing(context, 20),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Card(
            elevation: 1,
            color: AppColors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: "Address: ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 16)),
                    children: <TextSpan>[
                      TextSpan(
                          text: "${widget.userChat.address}",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 20))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Card(
            elevation: 1,
            color: AppColors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: "Post Code: ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 16)),
                    children: <TextSpan>[
                      TextSpan(
                          text: "${widget.userChat.addressPostCodes}",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 20))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Card(
            elevation: 1,
            color: AppColors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: "Bank Name: ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 16)),
                    children: <TextSpan>[
                      TextSpan(
                          text: "${widget.userChat.bankAccName}",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 20))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Card(
            elevation: 1,
            color: AppColors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: "Account No: ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 16)),
                    children: <TextSpan>[
                      TextSpan(
                          text: "${widget.userChat.bankAccNo}",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 20))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Card(
            elevation: 1,
            color: AppColors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: "Sort Code: ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 16)),
                    children: <TextSpan>[
                      TextSpan(
                          text: "${widget.userChat.bankSortCode}",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 20))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Card(
            elevation: 1,
            color: AppColors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: "Holiday Status: ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 16)),
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.userChat.hasGoneHoliday == true
                              ? "On Holiday"
                              : "Active",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 15))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Card(
            elevation: 1,
            color: AppColors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: "Holiday Start Date: ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 16)),
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.userChat.hasGoneHoliday == true
                              ? "${widget.userChat.holidayStartDate}"
                              : "Active",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 20))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Card(
            elevation: 1,
            color: AppColors.white,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: "Holiday End Date: ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 16)),
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.userChat.hasGoneHoliday == true
                              ? "${widget.userChat.holidayEndDate}"
                              : "Active",
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 20))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        addVerticalSpacing(context, 50),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const AppText(
                              text: "Delete User",
                              isBody: true,
                              textAlign: TextAlign.center,
                              fontSize: 18,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          content: const AppText(
                              text:
                                  "Are you sure you want to delete this user? This action cannot be undone.",
                              textAlign: TextAlign.center,
                              isBody: true,
                              fontSize: 15,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                          actions: [
                            CupertinoDialogAction(
                                child: const Text("Proceed"),
                                onPressed: () async {
                                  homeProviders.deleteUser(
                                      context: context,
                                      userId: userChat.id.toString());
                                  Navigator.pop(context);
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
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.red,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: AppText(
                        text: "Delete User",
                        isBody: true,
                        textAlign: TextAlign.start,
                        fontSize: 19,
                        color: AppColors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  navigateToRoute(
                      context,
                      ViewUserWorkHistory(
                        userChat: userChat,
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: AppText(
                        text: "Work History",
                        isBody: true,
                        textAlign: TextAlign.start,
                        fontSize: 19,
                        color: AppColors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {},
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.green,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: AppText(
                        text: "Verify User",
                        isBody: true,
                        textAlign: TextAlign.start,
                        fontSize: 19,
                        color: AppColors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        addVerticalSpacing(context, 50),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldMessengerState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        // toolbarHeight: 8.h,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const AppText(
            text: "User Details",
            textAlign: TextAlign.center,
            isBody: true,
            fontSize: 21,
            color: AppColors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            child: GestureDetector(
              onTap: () {
                navigateToRoute(
                    context,
                    UserAvailabilityPage(
                      userChat: widget.userChat,
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: AppText(
                      text: "View Availability",
                      textAlign: TextAlign.start,
                      isBody: true,
                      fontSize: 21,
                      color: AppColors.primary,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      key: key,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        child: buildItem(context, widget.userChat),
      ),
    );
  }
}
