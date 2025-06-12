// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';

import 'package:pe_je_healthcare_admin/core/components/helpers/base_service_upload.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/custom_snackbar.dart';
import 'package:pe_je_healthcare_admin/core/features/account/services/account_services.dart';

import '../../../components/utils/app_buttons.dart';
import '../../../components/utils/colors.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';
import '../../../components/widgets/input.dart';
import '../model/user_response_model.dart';
import '../states/account_provider.dart';

class AccountDetailsPage extends ConsumerStatefulWidget {
  const AccountDetailsPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<AccountDetailsPage> {
  String selectedCarType = "";
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _phoneNo;
  late TextEditingController _locationAddress;
  late TextEditingController _locality;
  late TextEditingController _state;

  bool isProcessing = false;

  bool isLoading = false;

  late AccountNotifier accountProviders;
  late RegisterResponseModel user;

  bool isSwitchedHoliday = false;

  @override
  void initState() {
    _phoneNo = TextEditingController();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _locationAddress = TextEditingController();
    _state = TextEditingController();
    _locality = TextEditingController();

    accountProviders = ref.read(accountProvider.notifier);
    accountProviders.getAccount();
    setState(() {
      user = accountProviders.userData!;
    });
    userDetails();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNo.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _locationAddress.dispose();
    _state.dispose();
    _locality.dispose();
    super.dispose();
  }

  userDetails() {
    setState(() {
      _firstName.text = "${user.firstName}";
      _lastName.text = "${user.surName}";
      _phoneNo.text = user.phoneNo.toString();
      _locationAddress.text = user.address.toString();
      _state.text = user.state.toString();
      _locality.text = user.locality.toString();
    });
  }

  File? pickedCv2;
  String imageFile = "";
  void handleCVUpload2() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          pickedCv2 = File(image.path.toString());
          imageFile = image.path.toString();
        });
      }
      String imageUrl = await ApiService.upload(image!.path);
      AccountService().updateUsers(imagePath: imageUrl);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget buildTop(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 0, right: 0, top: 20),
                    child: pickedCv2 == null
                        ? GestureDetector(
                            onTap: () async {
                              handleCVUpload2();
                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 47,
                                backgroundImage: NetworkImage(
                                  user.imagePath == null ||
                                          user.imagePath.toString().isEmpty
                                      ? image
                                      : user.imagePath.toString(),
                                ),
                              ),
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
                                      left: 0,
                                      right: 0,
                                    ),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.grey,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 47,
                                        backgroundImage: FileImage(pickedCv2!),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  const Positioned(
                    top: 96,
                    left: 50,
                    right: 20,
                    child: Icon(
                      Icons.camera_alt,
                      color: AppColors.primary,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpacing(context, 2),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: ExpansionTile(
                backgroundColor: AppColors.white,
                collapsedBackgroundColor: AppColors.white,
                collapsedIconColor: AppColors.primary,
                iconColor: AppColors.primary,
                textColor: AppColors.primary,
                collapsedTextColor: AppColors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                        text: "Name",
                        textAlign: TextAlign.start,
                        fontSize: 23,
                        isBody: true,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    AppText(
                        text: "${user.firstName} ${user.surName}",
                        textAlign: TextAlign.start,
                        fontSize: 23,
                        isBody: true,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                children: [
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalTextField(
                                fieldName: 'First Name',
                                keyBoardType: TextInputType.name,
                                removeSpace: false,
                                obscureText: false,
                                textController: _firstName,
                                onChanged: (String? value) {},
                              ),
                              addVerticalSpacing(context, 5),
                              GlobalTextField(
                                fieldName: 'Last Name',
                                keyBoardType: TextInputType.name,
                                removeSpace: false,
                                obscureText: false,
                                textController: _lastName,
                                onChanged: (String? value) {},
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpacing(context, 3),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 35.0, right: 35.0),
                          child: appButton(
                            "Update",
                            getScreenWidth(context),
                            () async {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                var response =
                                    await AccountService().updateUsers(
                                  firstName: _firstName.text.trim(),
                                  lastName: _lastName.text.trim(),
                                );
                                if (response.statusCode == 201 ||
                                    response.statusCode == 200) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  navigateBack(context);
                                  showCustomSnackbar(
                                    context,
                                    title: "User Update",
                                    content: "User Updated Successfully",
                                    type: SnackbarType.success,
                                    isTopPosition: false,
                                  );
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  navigateBack(context);
                                  showCustomSnackbar(
                                    context,
                                    title: "Update User Error",
                                    content: response.body,
                                    type: SnackbarType.error,
                                    isTopPosition: false,
                                  );
                                }
                              }
                            },
                            AppColors.primary,
                            isLoading,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: const AppText(
                  text: "Email",
                  textAlign: TextAlign.start,
                  fontSize: 23,
                  isBody: true,
                  color: AppColors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
              subtitle: AppText(
                  text: "${user.email}",
                  textAlign: TextAlign.start,
                  fontSize: 23,
                  isBody: true,
                  color: AppColors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
                size: 15,
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: ExpansionTile(
                backgroundColor: AppColors.white,
                collapsedBackgroundColor: AppColors.white,
                collapsedIconColor: AppColors.primary,
                iconColor: AppColors.primary,
                textColor: AppColors.primary,
                collapsedTextColor: AppColors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                        text: "Phone Number",
                        textAlign: TextAlign.start,
                        isBody: true,
                        fontSize: 23,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    AppText(
                        text: "${user.phoneNo}",
                        isBody: true,
                        textAlign: TextAlign.start,
                        fontSize: 23,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                children: [
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalTextField(
                                fieldName: "Phone Number",
                                keyBoardType: TextInputType.phone,
                                obscureText: false,
                                textController: _phoneNo,
                                onChanged: (String? value) {},
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpacing(context, 3),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 35.0, right: 35.0),
                          child: appButton(
                            "Update",
                            getScreenWidth(context),
                            () async {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                var response =
                                    await AccountService().updateUsers(
                                  phoneNo: _phoneNo.text.trim(),
                                );
                                if (response.statusCode == 201 ||
                                    response.statusCode == 200) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  navigateBack(context);
                                  showCustomSnackbar(
                                    context,
                                    title: "User Update",
                                    content: "User Updated Successfully",
                                    type: SnackbarType.success,
                                    isTopPosition: false,
                                  );
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  navigateBack(context);
                                  showCustomSnackbar(
                                    context,
                                    title: "Update User Error",
                                    content: response.body,
                                    type: SnackbarType.error,
                                    isTopPosition: false,
                                  );
                                }
                              }
                            },
                            AppColors.primary,
                            isLoading,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              title: const AppText(
                text: "Sex",
                textAlign: TextAlign.start,
                fontSize: 23,
                color: AppColors.black,
                fontStyle: FontStyle.normal,
                isBody: true,
                fontWeight: FontWeight.bold,
              ),
              subtitle: AppText(
                text: "${user.sex}",
                textAlign: TextAlign.start,
                fontSize: 23,
                color: AppColors.black,
                isBody: true,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
                size: 15,
              ),
            ),
            ListTile(
              onTap: () {},
              title: const AppText(
                text: "Branch",
                textAlign: TextAlign.start,
                fontSize: 23,
                color: AppColors.black,
                fontStyle: FontStyle.normal,
                isBody: true,
                fontWeight: FontWeight.bold,
              ),
              subtitle: AppText(
                text: "${user.branch}",
                textAlign: TextAlign.start,
                fontSize: 23,
                color: AppColors.black,
                isBody: true,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
                size: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: ExpansionTile(
                backgroundColor: AppColors.white,
                collapsedBackgroundColor: AppColors.white,
                collapsedIconColor: AppColors.primary,
                iconColor: AppColors.primary,
                textColor: AppColors.primary,
                collapsedTextColor: AppColors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "Address",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      color: AppColors.black,
                      isBody: true,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                      text: "${user.address}",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      isBody: true,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                children: [
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalTextField(
                                fieldName: "Address",
                                keyBoardType: TextInputType.name,
                                removeSpace: false,
                                obscureText: false,
                                textController: _locationAddress,
                                onChanged: (String? value) {},
                              ),
                              addVerticalSpacing(context, 3),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 35.0,
                                  right: 35.0,
                                ),
                                child: appButton(
                                  "Update",
                                  getScreenWidth(context),
                                  () async {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      var response =
                                          await AccountService().updateUsers(
                                        address: _locationAddress.text.trim(),
                                      );
                                      if (response.statusCode == 201 ||
                                          response.statusCode == 200) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        navigateBack(context);
                                        showCustomSnackbar(
                                          context,
                                          title: "User Update",
                                          content: "User Updated Successfully",
                                          type: SnackbarType.success,
                                          isTopPosition: false,
                                        );
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        navigateBack(context);
                                        showCustomSnackbar(
                                          context,
                                          title: "Update User Error",
                                          content: response.body,
                                          type: SnackbarType.error,
                                          isTopPosition: false,
                                        );
                                      }
                                    }
                                  },
                                  AppColors.primary,
                                  isLoading,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: ExpansionTile(
                backgroundColor: AppColors.white,
                collapsedBackgroundColor: AppColors.white,
                collapsedIconColor: AppColors.primary,
                iconColor: AppColors.primary,
                textColor: AppColors.primary,
                collapsedTextColor: AppColors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "City",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      color: AppColors.black,
                      isBody: true,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                      text: "${user.locality}",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      isBody: true,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                children: [
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalTextField(
                                fieldName: "City",
                                keyBoardType: TextInputType.name,
                                removeSpace: false,
                                obscureText: false,
                                textController: _locality,
                                onChanged: (String? value) {},
                              ),
                              addVerticalSpacing(context, 3),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 35.0,
                                  right: 35.0,
                                ),
                                child: appButton(
                                  "Update",
                                  getScreenWidth(context),
                                  () async {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      var response =
                                          await AccountService().updateUsers(
                                        locality: _locality.text.trim(),
                                      );
                                      if (response.statusCode == 201 ||
                                          response.statusCode == 200) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        navigateBack(context);
                                        showCustomSnackbar(
                                          context,
                                          title: "User Update",
                                          content: "User Updated Successfully",
                                          type: SnackbarType.success,
                                          isTopPosition: false,
                                        );
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        navigateBack(context);
                                        showCustomSnackbar(
                                          context,
                                          title: "Update User Error",
                                          content: response.body,
                                          type: SnackbarType.error,
                                          isTopPosition: false,
                                        );
                                      }
                                    }
                                  },
                                  AppColors.primary,
                                  isLoading,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: ExpansionTile(
                backgroundColor: AppColors.white,
                collapsedBackgroundColor: AppColors.white,
                collapsedIconColor: AppColors.primary,
                iconColor: AppColors.primary,
                textColor: AppColors.primary,
                collapsedTextColor: AppColors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "State",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      color: AppColors.black,
                      isBody: true,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                      text: "${user.state}",
                      textAlign: TextAlign.start,
                      fontSize: 23,
                      isBody: true,
                      color: AppColors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                children: [
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalTextField(
                                fieldName: "State",
                                keyBoardType: TextInputType.name,
                                removeSpace: false,
                                obscureText: false,
                                textController: _locationAddress,
                                onChanged: (String? value) {},
                              ),
                              addVerticalSpacing(context, 3),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 35.0,
                                  right: 35.0,
                                ),
                                child: appButton(
                                  "Update",
                                  getScreenWidth(context),
                                  () async {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      var response =
                                          await AccountService().updateUsers(
                                        state: _state.text.trim(),
                                      );
                                      if (response.statusCode == 201 ||
                                          response.statusCode == 200) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        navigateBack(context);
                                        showCustomSnackbar(
                                          context,
                                          title: "User Update",
                                          content: "User Updated Successfully",
                                          type: SnackbarType.success,
                                          isTopPosition: false,
                                        );
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        navigateBack(context);
                                        showCustomSnackbar(
                                          context,
                                          title: "Update User Error",
                                          content: response.body,
                                          type: SnackbarType.error,
                                          isTopPosition: false,
                                        );
                                      }
                                    }
                                  },
                                  AppColors.primary,
                                  isLoading,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    //  final key = GlobalKey<ScaffoldMessengerState>();

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            // toolbarHeight: 8.h,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            // ignore: prefer_const_constructors
            title: AppText(
                text: "Profile Updates",
                textAlign: TextAlign.center,
                fontSize: 19,
                isBody: true,
                color: AppColors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600),
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
          body: buildTop(context),
        ));
  }
}
