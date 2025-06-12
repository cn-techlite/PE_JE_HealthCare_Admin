import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../components/architecture/mvc.dart';
import '../../../components/utils/app_buttons.dart';
import '../../../components/utils/colors.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/widgets/app_text.dart';
import '../../../components/widgets/input.dart';
import '../controller/forgot_password.dart';
import '../controller/login_controller.dart';

class LoginScreensView
    extends StatelessView<LoginScreens, LoginScreensController> {
  const LoginScreensView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.of(context).textScaler;
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
                  addVerticalSpacing(context, 35),
                  GlobalTextField(
                    fieldName: 'Email',
                    keyBoardType: TextInputType.emailAddress,
                    obscureText: false,
                    textController: controller.emailController,
                    onChanged: (String? value) {
                      controller.emailOnChanged(value!);
                    },
                  ),
                  addVerticalSpacing(context, 2),
                  GlobalTextField(
                    fieldName: 'Password',
                    obscureText: true,
                    isEyeVisible: true,
                    isNotePad: false,
                    keyBoardType: TextInputType.visiblePassword,
                    textController: controller.passwordController,
                    onChanged: (String? value) {
                      controller.passwordOnChanged(value!);
                    },
                  ),
                  addVerticalSpacing(context, 5),
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
                            fontSize: 40,
                            color: AppColors.primary,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  addVerticalSpacing(context, 4),
                  Row(
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
                        child: Text.rich(
                          textScaler: textScaler,
                          TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              color: AppColors.black,
                              fontSize: fontSized(context, 35),
                            ),
                            text: "I Agree to the ",
                            children: <TextSpan>[
                              TextSpan(
                                text: "Terms & Conditions",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter",
                                  color: AppColors.primary,
                                  fontSize: fontSized(context, 35),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.urlString(
                                      "https://ganatesolutionsapps.com/terms-of-use/",
                                    );
                                  },
                              ),
                              TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter",
                                  fontSize: fontSized(context, 35),
                                ),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter",
                                  color: AppColors.primary,
                                  fontSize: fontSized(context, 35),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.urlString(
                                      "https://ganatesolutionsapps.com/privacy-policy/",
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 20),
                  controller.isEmailChanged.isEmpty ||
                          controller.isPasswordChanged.isEmpty ||
                          controller.isChecked == false
                      ? appButton(
                          "LOG IN",
                          getScreenWidth(context),
                          () {},
                          AppColors.grey,
                          controller.isLoading,
                        )
                      : appButton(
                          "LOG IN",
                          getScreenWidth(context),
                          () {
                            controller.loginUser();
                          },
                          AppColors.primary,
                          controller.isLoading,
                        ),
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
