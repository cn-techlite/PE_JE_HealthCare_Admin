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
                      isBody: true,
                      fontSize: 8,
                      color: AppColors.primaryDark,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800),
                  const SizedBox(height: 10),
                  const AppText(
                      text:
                          "Please enter the your new password if you forget it, then click on forget password",
                      textAlign: TextAlign.start,
                      isBody: true,
                      fontSize: 14,
                      color: AppColors.primaryDark,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                  addVerticalSpacing(context, 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OTP Code",
                        style: TextStyle(
                          fontSize: fontSized(context, 80),
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Mulish",
                        ),
                      ),
                      GlobalTextField(
                        fieldName: 'OTP Code',
                        keyBoardType: TextInputType.number,
                        obscureText: false,
                        maxLength: 5,
                        textController: controller.codeController,
                        onChanged: (String? value) {
                          controller.otpOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        isBody: false,
                        text: "New Password",
                        textAlign: TextAlign.start,
                        fontSize: 80,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                      GlobalTextField(
                        fieldName: 'New Password',
                        keyBoardType: TextInputType.visiblePassword,
                        obscureText: true,
                        isEyeVisible: true,
                        textController: controller.newPasswordController,
                        onChanged: (String? value) {
                          controller.newPasswordOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        isBody: false,
                        text: "Confirm Password",
                        textAlign: TextAlign.start,
                        fontSize: 80,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                      GlobalTextField(
                        fieldName: 'Confirm Password',
                        keyBoardType: TextInputType.visiblePassword,
                        obscureText: true,
                        isEyeVisible: true,
                        textController: controller.confirmPasswordController,
                        onChanged: (String? value) {
                          controller.confirmPasswordOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 10),
                  controller.isOTPChanged.isEmpty ||
                          controller.isNewPasswordChanged.isEmpty ||
                          controller.isConfirmPasswordChanged.isEmpty ||
                          controller.isConfirmPasswordChanged !=
                              controller.isNewPasswordChanged
                      ? appButton(
                          "Update Password",
                          getScreenWidth(context),
                          () {},
                          AppColors.grey,
                          controller.isLoading,
                        )
                      : appButton(
                          "Update Password",
                          getScreenWidth(context),
                          () {
                            controller.onSubmit();
                          },
                          AppColors.primary,
                          controller.isLoading,
                        ),
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
