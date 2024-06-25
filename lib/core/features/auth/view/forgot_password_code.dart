import '../../../components/architecture/mvc.dart';
import '../../../components/utils/app_buttons.dart';
import '../../../components/utils/colors.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';
import '../../../components/widgets/input.dart';
import '../controller/forgot_password_code.dart';

class ForgotPasswordCodeScreenView extends StatelessView<
    ForgotPasswordCodeScreen, ForgotPasswordCodeController> {
  const ForgotPasswordCodeScreenView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SizedBox(
        height: getScreenHeight(context),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 18.0,
                top: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const AppText(
                      text: "Create New \nPassword",
                      textAlign: TextAlign.start,
                      fontSize: 8,
                      color: AppColors.primaryDark,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800),
                  const SizedBox(height: 10),
                  const AppText(
                      text:
                          "Please enter the your new password if you forget it, then click on forget password",
                      textAlign: TextAlign.start,
                      fontSize: 14,
                      color: AppColors.primaryDark,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                  addVerticalSpacing(context, 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "New Password",
                          textAlign: TextAlign.start,
                          fontSize: 15,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                      const SizedBox(height: 8),
                      PasswordInput(
                        obscureText: controller.obscureText,
                        fillColor: const Color.fromARGB(255, 243, 247, 245),
                        focusNode: controller.newPasswordFocusNode,
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
                        controller: controller.newPasswordController,
                        hintText: "New Password",
                        prefixIcon: Icons.lock,
                        labelText: "New Password",
                        keyboard: TextInputType.text,
                        onChanged: (String? value) {},
                        validator: (String? value) {
                          if (value!.isEmpty || value.length < 3) {
                            return "enter a valid password";
                          } else if (value.length < 8) {
                            return "password must be 8 characters";
                          } else if (!controller.passValid.hasMatch(value)) {
                            return "password must contain at least one uppercase letter, one lowercase letter, one number";
                          }
                          return null;
                        },
                        toggleEye: () {},
                        onSaved: (value) {},
                        onTap: () {},
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Confirm Password",
                          textAlign: TextAlign.start,
                          fontSize: 15,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                      const SizedBox(height: 8),
                      PasswordInput(
                        obscureText: controller.obscureConfirmPassword,
                        focusNode: controller.confirmPasswordFocusNode,
                        fillColor: const Color.fromARGB(255, 243, 247, 245),
                        passwordIcon: GestureDetector(
                          onTap: () {
                            controller.obscureTextConfirmPassword();
                          },
                          child: Icon(
                            controller.obscureConfirmPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                        controller: controller.confirmPasswordController,
                        hintText: "Confirm Password",
                        prefixIcon: Icons.lock,
                        labelText: "Confirm Password",
                        keyboard: TextInputType.text,
                        onChanged: (String? value) {},
                        validator: (String? value) {
                          if (value!.isEmpty || value.length < 3) {
                            return "enter a valid password";
                          } else if (controller.newPasswordController.text !=
                              controller.confirmPasswordController.text) {
                            return "password do not match";
                          }
                          return null;
                        },
                        toggleEye: () {},
                        onSaved: (value) {},
                        onTap: () {},
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 50),
                  appButton("Update Password", getScreenWidth(context), () {
                    controller.onSubmit();
                  }, AppColors.primary, controller.isLoading),
                  addVerticalSpacing(context, 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
