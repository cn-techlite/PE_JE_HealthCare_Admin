import 'package:pe_je_healthcare_admin/core/components/routes/route.dart';
import 'package:flutter/material.dart';
import '../../features/auth/controller/login_controller.dart';
import '../../features/auth/view/get_started.dart';
import '../../features/home_screen.dart';
import '../helpers/globals.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RootRoutes.login:
      return MaterialPageRoute(builder: (context) => const LoginScreens());
    case RootRoutes.getStarted:
      return MaterialPageRoute(builder: (context) => const GetStartedScreen());
    case RootRoutes.tab:
      return MaterialPageRoute(builder: (context) => const HomeScreenPage());

    default:
      {
        return _errorRoute();
      }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Page not found!'),
      ),
    );
  });
}

Future<String> initialRoute() async {
  // printData("userId", globals.user!.id);
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var userToken = await getFromLocalStorage(name: token);
  // int? isviewed = prefs.getInt('onBoard');
  return globals.userId!.isEmpty ? RootRoutes.getStarted : RootRoutes.tab;
}
