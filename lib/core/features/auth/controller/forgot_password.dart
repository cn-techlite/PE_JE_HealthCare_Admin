// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/custom_snackbar.dart';
import '../../../components/utils/helper_functions.dart';
import '../services/auth_service.dart';
import '../view/forgot_password.dart';
import 'forgot_password_code.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => ForgotPasswordController();
}

class ForgotPasswordController extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool saveButtonPressed = false;

  onSubmit() async {
    setState(() {
      saveButtonPressed = true;
    });
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });

      final res = await AuthService.reSendPasswordCode(
          email: emailController.text.trim(), cxt: context);
      if (res.statusCode == 200 || res.statusCode == 201) {
        setState(() {
          isLoading = false;
        });
        navigateToRoute(
            context,
            ForgotPasswordCodeScreen(
              email: emailController.text.trim(),
            ));
      } else {
        setState(() {
          isLoading = false;
        });
        showCustomSnackbar(context,
            title: "User Exist",
            content: "Email Does Not Exist",
            type: SnackbarType.error,
            isTopPosition: false);
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordView(this);
  }
}
