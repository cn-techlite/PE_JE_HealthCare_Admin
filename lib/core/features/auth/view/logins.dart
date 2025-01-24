import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../components/architecture/mvc.dart';
import '../../../components/utils/app_buttons.dart';
import '../../../components/utils/colors.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/widgets/app_text.dart';
import '../../../components/widgets/input.dart';
import '../controller/forgot_password.dart';
import '../controller/login_controller.dart';
import 'dart:io' show Platform;

class LoginScreensView
    extends StatelessView<LoginScreens, LoginScreensController> {
  const LoginScreensView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        color: AppColors.white,
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                      text: "Welcome to PE & JE HealthCare Master App",
                      textAlign: TextAlign.start,
                      fontSize: 18,
                      isBody: false,
                      color: AppColors.primary,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700),
                  addVerticalSpacing(context, 10),
                  Input(
                    controller: controller.emailController,
                    hintText: "Your Email",
                    prefixIcon: Icons.person,
                    labelText: "Email",
                    keyboard: TextInputType.text,
                    validator: (value) {
                      String trimValue = controller.emailController.text.trim();
                      if (EmailValidator.validate(trimValue) == false) {
                        return 'enter a valid email';
                      }

                      return null;
                    },
                    toggleEye: () {},
                    onSaved: (value) {},
                    onTap: () {},
                    onChanged: (String? value) {},
                  ),
                  addVerticalSpacing(context, 24),
                  PasswordInput(
                    obscureText: controller.obscureText,
                    passwordIcon: GestureDetector(
                      onTap: () {
                        controller.obscureTextPassword();
                      },
                      child: Icon(
                        controller.obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.primary,
                      ),
                    ),
                    controller: controller.passwordController,
                    hintText: "Your Password",
                    prefixIcon: Icons.lock,
                    labelText: "Password",
                    keyboard: TextInputType.text,
                    onChanged: (String? value) {},
                    validator: (String? value) {
                      if (value!.isEmpty || value.length < 3) {
                        return "enter a valid password";
                      }
                      return null;
                    },
                    toggleEye: () {},
                    onSaved: (value) {},
                    onTap: () {},
                  ),
                  addVerticalSpacing(context, 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigateToRoute(
                              context, const ForgotPasswordScreen());
                        },
                        child: const AppText(
                            text: "Forgot Password?",
                            textAlign: TextAlign.end,
                            isBody: true,
                            fontSize: 18,
                            color: AppColors.primary,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  addVerticalSpacing(context, 24),
                  Platform.isIOS
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              checkColor: AppColors.white,
                              activeColor: AppColors.primary,
                              value: controller.isChecked,
                              onChanged: (value) {
                                controller.onChanged(value!);
                              },
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const AppText(
                                      text: "I Agree to the ",
                                      textAlign: TextAlign.center,
                                      fontSize: 32,
                                      color: AppColors.black,
                                      isBody: true,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                  GestureDetector(
                                    onTap: () {
                                      controller.urlString(
                                          "https://ganatesolutionsapps.com/terms-of-use/");
                                    },
                                    child: const AppText(
                                        text: "Terms & Conditions",
                                        decoration: TextDecoration.underline,
                                        textAlign: TextAlign.center,
                                        fontSize: 30,
                                        isBody: true,
                                        color: AppColors.primary,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const AppText(
                                      text: "&",
                                      textAlign: TextAlign.center,
                                      fontSize: 32,
                                      isBody: true,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.urlString(
                                          "https://ganatesolutionsapps.com/privacy-policy/");
                                    },
                                    child: const AppText(
                                        text: "Privacy Policy",
                                        decoration: TextDecoration.underline,
                                        textAlign: TextAlign.center,
                                        fontSize: 30,
                                        isBody: true,
                                        color: AppColors.primary,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              checkColor: AppColors.white,
                              activeColor: AppColors.primary,
                              value: controller.isChecked,
                              onChanged: (value) {
                                controller.onChanged(value!);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const AppText(
                                    text: "I Agree to the ",
                                    isBody: true,
                                    textAlign: TextAlign.center,
                                    fontSize: 32,
                                    color: AppColors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600),
                                GestureDetector(
                                  onTap: () {
                                    controller.urlString(
                                        "https://ganatesolutionsapps.com/terms-of-use/");
                                  },
                                  child: const AppText(
                                      text: "Terms & Conditions",
                                      isBody: true,
                                      decoration: TextDecoration.underline,
                                      textAlign: TextAlign.center,
                                      fontSize: 30,
                                      color: AppColors.primary,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const AppText(
                                    text: "&",
                                    textAlign: TextAlign.center,
                                    fontSize: 32,
                                    isBody: true,
                                    color: AppColors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.urlString(
                                        "https://ganatesolutionsapps.com/privacy-policy/");
                                  },
                                  child: const AppText(
                                      text: "Privacy Policy",
                                      decoration: TextDecoration.underline,
                                      textAlign: TextAlign.center,
                                      fontSize: 30,
                                      isBody: true,
                                      color: AppColors.primary,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                  addVerticalSpacing(context, 20),
                  appButton("LOG IN", getScreenWidth(context), () {
                    controller.loginUser();
                  }, AppColors.primary, controller.isLoading),
                  addVerticalSpacing(context, 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
