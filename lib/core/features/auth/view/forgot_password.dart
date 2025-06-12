import 'package:flutter/material.dart';

import '../../../components/architecture/mvc.dart';
import '../../../components/utils/app_buttons.dart';
import '../../../components/utils/colors.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/widgets/app_text.dart';
import '../../../components/widgets/input.dart';
import '../controller/forgot_password.dart';

class ForgotPasswordView
    extends StatelessView<ForgotPasswordScreen, ForgotPasswordController> {
  const ForgotPasswordView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      const AppText(
                        text: "Forgot Password",
                        textAlign: TextAlign.start,
                        isBody: true,
                        fontSize: 38,
                        color: AppColors.primaryDark,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w800,
                      ),
                      const AppText(
                        isBody: true,
                        text: "Enter your email address",
                        textAlign: TextAlign.start,
                        fontSize: 38,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 40),
                      const AppText(
                        text: "Email Address",
                        textAlign: TextAlign.start,
                        isBody: true,
                        fontSize: 35,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                      GlobalTextField(
                        fieldName: 'Email',
                        keyBoardType: TextInputType.emailAddress,
                        obscureText: false,
                        textController: controller.emailController,
                        onChanged: (String? value) {
                          controller.emailOnChanged(value!);
                        },
                      ),
                      addVerticalSpacing(context, 5),
                      controller.isEmailChanged.isNotEmpty
                          ? appButton(
                              "Send OTP",
                              getScreenWidth(context),
                              () {
                                controller.onSubmit();
                              },
                              AppColors.primary,
                              controller.isLoading,
                            )
                          : appButton(
                              "Continue",
                              getScreenWidth(context),
                              () {
                                controller.onSubmit();
                              },
                              AppColors.primary,
                              controller.isLoading,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
