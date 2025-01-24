// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/input.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/users_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/services/home_service.dart';

class SelectUserPage extends ConsumerStatefulWidget {
  final List<UserResponseModel> users;
  final String userId;
  final String dayString;
  final bool isNight;

  const SelectUserPage(
      {super.key,
      required this.users,
      required this.userId,
      required this.dayString,
      required this.isNight});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<SelectUserPage> {
  List<UserResponseModel> selectedUsers = [];
  List<UserResponseModel> searchUsers = [];
  TextEditingController searchTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedUsers = widget.users;
    searchUsers = widget.users;
  }

  searchProducts(String? search) {
    List<UserResponseModel> searchList = [];
    searchList.addAll(searchUsers);
    if (search!.isNotEmpty) {
      List<UserResponseModel> searchResults = [];
      for (var item in searchList) {
        if (item.firstName!.toLowerCase().contains(search.toLowerCase())) {
          searchResults.add(item);
        } else if (item.lastName!
            .toLowerCase()
            .contains(search.toLowerCase())) {
          searchResults.add(item);
        } else if (item.email!.toLowerCase().contains(search.toLowerCase())) {
          searchResults.add(item);
        } else if (item.address!.toLowerCase().contains(search.toLowerCase())) {
          searchResults.add(item);
        }
      }
      setState(() {
        selectedUsers = searchResults;
      });

      return;
    } else {
      selectedUsers = searchUsers;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          backgroundColor: AppColors.primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(top: 70),
            color: AppColors.primary,
            //  height: 300.h,
            width: getScreenWidth(context),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SerachInput(
                    controller: searchTEC,
                    hintText: "Search name, email, address etc.",
                    labelText: "Search",
                    keyboard: TextInputType.text,
                    onChanged: (String? value) {
                      searchProducts(value!);
                    },
                    validator: (value) {
                      return null;
                    },
                    toggleEye: () {},
                    onSaved: (value) {},
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: selectedUsers.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 0, bottom: 0),
                    child: Image.asset(
                      "assets/images/logo_path.png",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const AppText(
                      text: "Nothing to show here",
                      isBody: true,
                      textAlign: TextAlign.start,
                      fontSize: 21,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                  const AppText(
                      text:
                          "You have not been assigned to any service user yet.",
                      textAlign: TextAlign.center,
                      isBody: true,
                      fontSize: 26,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                ],
              ),
            )
          : ListView.builder(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.only(top: 10),
              itemCount: selectedUsers.length,
              itemBuilder: (context, index) {
                var userChat = selectedUsers[index];
                return GestureDetector(
                  onTap: () async {
                    widget.isNight == true
                        ? await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const AppText(
                                    text: "Assign User",
                                    isBody: true,
                                    textAlign: TextAlign.center,
                                    fontSize: 18,
                                    color: AppColors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                content: const AppText(
                                    text:
                                        "Are you sure you want to assign to this account? This action is irreversible.",
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
                                        String deviceToken = "";
                                        for (var token
                                            in userChat.deviceTokenModels!) {
                                          deviceToken =
                                              token.deviceTokenId.toString();
                                        }

                                        final isValid = await HomeServices()
                                            .updateServiceUser(
                                                serviceUserId: widget.userId,
                                                nightUserId:
                                                    userChat.id.toString(),
                                                nightUserName:
                                                    "${userChat.firstName} ${userChat.lastName}",
                                                dayString: widget.dayString);
                                        if (isValid) {
                                          await HomeServices().sendNotificationUser(
                                              userDeviceToken: deviceToken,
                                              title: "New Task",
                                              body:
                                                  "You have been assigned to a new task",
                                              notificationType: "task",
                                              userId: userChat.id.toString());
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "User Added Successfully")));
                                          Navigator.pop(context);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Failed to add user")));
                                        }
                                      }),
                                  CupertinoDialogAction(
                                      child: const Text("Cancel"),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      }),
                                ],
                              );
                            })
                        : await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const AppText(
                                    text: "Assign User",
                                    isBody: true,
                                    textAlign: TextAlign.center,
                                    fontSize: 18,
                                    color: AppColors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                content: const AppText(
                                    text:
                                        "Are you sure you want to assign to this account? This action is irreversible.",
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
                                        String deviceToken = "";
                                        for (var token
                                            in userChat.deviceTokenModels!) {
                                          deviceToken =
                                              token.deviceTokenId.toString();
                                        }

                                        final isValid = await HomeServices()
                                            .updateServiceUser(
                                                serviceUserId: widget.userId,
                                                morningUserId:
                                                    userChat.id.toString(),
                                                morningUserName:
                                                    "${userChat.firstName} ${userChat.lastName}",
                                                dayString: widget.dayString);
                                        if (isValid) {
                                          await HomeServices().sendNotificationUser(
                                              userDeviceToken: deviceToken,
                                              title: "New Task",
                                              body:
                                                  "You have been assigned to a new task",
                                              notificationType: "task",
                                              userId: userChat.id.toString());
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "User Added Successfully")));
                                          Navigator.pop(context);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Failed to add user")));
                                        }
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
                  child: Card(
                    elevation: 4,
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                backgroundImage: userChat.profilePicture
                                        .toString()
                                        .isEmpty
                                    ? const NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                                    // ignore: unnecessary_null_comparison
                                    : userChat.profilePicture == null
                                        ? const NetworkImage(
                                            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                                        : NetworkImage(userChat.profilePicture
                                            .toString())),
                          ),
                          const SizedBox(width: 10),
                          AppText(
                              text:
                                  "${userChat.firstName} ${userChat.lastName}",
                              textAlign: TextAlign.start,
                              isBody: true,
                              fontSize: 12,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          const Spacer(),
                          // ignore: prefer_const_constructors
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
