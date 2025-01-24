// ignore_for_file: override_on_non_overriding_member, library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/helpers/globals.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/app_buttons.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/input.dart';
import 'package:pe_je_healthcare_admin/core/features/account/states/account_provider.dart';
import 'package:pe_je_healthcare_admin/core/features/auth/controller/login_controller.dart';
import 'package:pe_je_healthcare_admin/core/features/auth/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

class DeleteAccountPage extends ConsumerStatefulWidget {
  const DeleteAccountPage({
    super.key,
    required this.imageUrl,
    required this.name,
  });
  final String imageUrl;
  final String name;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<DeleteAccountPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController reason;
  final focusReason = FocusNode();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    reason = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    reason.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountProviderd = ref.read(accountProvider.notifier);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
              )),
          backgroundColor: AppColors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Container(
            height: getScreenHeight(context),
            width: getScreenWidth(context),
            color: AppColors.white,
            child: SingleChildScrollView(
                child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(23.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: AppText(
                          text: "Delete Account",
                          isBody: false,
                          textAlign: TextAlign.start,
                          fontSize: 15,
                          color: AppColors.red,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 57,
                            backgroundImage: widget.imageUrl.toString().isEmpty
                                ? const NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                                // ignore: unnecessary_null_comparison
                                : widget.imageUrl == null
                                    ? const NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                                    : NetworkImage(widget.imageUrl.toString())),
                      ),
                    ),
                    Center(
                      child: AppText(
                          text: widget.name.toString(),
                          textAlign: TextAlign.start,
                          fontSize: 19,
                          isBody: true,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: AppText(
                          text: "${globals.userEmail}",
                          textAlign: TextAlign.start,
                          fontSize: 22,
                          isBody: true,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal),
                    ),
                    addVerticalSpacing(context, 20),
                    const AppText(
                        text:
                            "Please provide a reason for deleting your account. We will be sad to see you go.",
                        textAlign: TextAlign.start,
                        isBody: true,
                        fontSize: 20,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500),
                    const SizedBox(
                      height: 20,
                    ),
                    DescriptionInput(
                      controller: reason,
                      hintText: "Write a reason for deleting your account",
                      labelText: "Reason",
                      focusNode: focusReason,
                      keyboard: TextInputType.text,
                      maxLength: 200,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Empty Field';
                        }
                        return null;
                      },
                      toggleEye: () {},
                      onSaved: (value) {},
                      onTap: () {},
                      onChanged: (String? value) {},
                    ),
                    addVerticalSpacing(context, 30),
                    appButton("Delete My Account", getScreenWidth(context),
                        () async {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        setState(() {
                          isLoading = true;
                        });
                        await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const AppText(
                                    text: "Delete Account",
                                    isBody: true,
                                    textAlign: TextAlign.center,
                                    fontSize: 18,
                                    color: AppColors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                content: const AppText(
                                    text:
                                        "Are you sure you want to delete your account? This action is irreversible.",
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
                                        bool isValid =
                                            await AuthService().deleteUser();
                                        if (isValid) {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          accountProviderd.handleSignOut();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Account deleted successfully')));

                                          navigateAndRemoveUntilRoute(
                                              context, const LoginScreens());
                                        } else {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'An error occurred, please try again later')));
                                        }
                                      }),
                                  CupertinoDialogAction(
                                      child: const Text("Cancel"),
                                      onPressed: () {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.of(context).pop(false);
                                      }),
                                ],
                              );
                            });
                      }
                    }, AppColors.primary, isLoading),
                    addVerticalSpacing(context, 20),
                  ],
                ),
              ),
            ))));
  }
}
