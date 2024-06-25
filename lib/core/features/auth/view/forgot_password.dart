import 'package:email_validator/email_validator.dart';
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
                          text: "Forgot \nPassword",
                          textAlign: TextAlign.start,
                          fontSize: 8,
                          color: AppColors.primaryDark,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800),
                      const SizedBox(height: 40),
                      const AppText(
                          text: "Email Address",
                          textAlign: TextAlign.start,
                          fontSize: 15,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                      const SizedBox(height: 8),
                      // const SizedBox(height: 48),
                      Input(
                        controller: controller.emailController,
                        fillColor: const Color.fromARGB(255, 243, 247, 245),
                        hintText: "Your Email",
                        prefixIcon: Icons.person,
                        labelText: "Email",
                        keyboard: TextInputType.text,
                        onChanged: (String? value) {},
                        validator: (value) {
                          String trimValue =
                              controller.emailController.text.trim();
                          if (EmailValidator.validate(trimValue) == false) {
                            return 'enter a valid email';
                          }

                          return null;
                        },
                        toggleEye: () {},
                        onSaved: (value) {},
                        onTap: () {},
                      ),
                      addVerticalSpacing(context, 5),
                      appButton("Continue", getScreenWidth(context), () {
                        controller.onSubmit();
                      }, AppColors.primary, controller.isLoading)
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
