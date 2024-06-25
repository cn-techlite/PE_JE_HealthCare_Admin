// ignore_for_file: use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/helpers/globals.dart';
import 'package:pe_je_healthcare_admin/core/features/auth/states/auth_provider.dart'
    as d;

import '../services/auth_service.dart';
import '../states/auth_provider.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/utils/package_export.dart';

import '../../home_screen.dart';
import '../view/logins.dart';

class LoginScreens extends ConsumerStatefulWidget {
  const LoginScreens({super.key});

  @override
  ConsumerState<LoginScreens> createState() => LoginScreensController();
}

class LoginScreensController extends ConsumerState<LoginScreens> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  d.AuthProvider? authProviders;
  String? email = "";
  String? password = "";
  bool saveButtonPressed = false;
  int currentIndex = 0;
  bool switchvalue = false;
  bool isLoading = false;
  String isCompleted = "";
  // late Login login;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    authProviders = ref.read(authProvider);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool isChecked = false;
  urlString(String? url) async {
    final link = Uri.parse(url!);
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw 'Could not launch $url';
    }
  }

  onChanged(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }

  obscureTextPassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  loginUser() async {
    setState(() {
      saveButtonPressed = true;
    });
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.ethernet) ||
          connectivityResult.contains(ConnectivityResult.vpn) ||
          connectivityResult.contains(ConnectivityResult.bluetooth) ||
          connectivityResult.contains(ConnectivityResult.other)) {
        if (isChecked == true) {
          final res = await AuthService.userLogin(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              cxt: context);

          if (res.statusCode == 200 || res.statusCode == 201) {
            setState(() {
              isLoading = false;
            });
            await globals.init();
            navigateAndReplaceRoute(context, const HomeScreenPage());
          } else {
            setState(() {
              isLoading = false;
            });
            showInfoAlertWithAction(
                context, "Invalid User", "Incorrect Email or Password", () {});
          }
        } else {
          setState(() {
            isLoading = false;
          });
          showInfoAlertWithAction(context, "Terms & Conditions",
              "Please accept terms & conditions", () {});
        }
      } else {
        setState(() {
          isLoading = false;
        });
        showInfoAlertWithAction(
            context, "Network Connection", "No Internet Connection", () {});
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreensView(this);
  }
}
