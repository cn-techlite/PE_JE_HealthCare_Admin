import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future navigateTo(
      {@required BuildContext? context,
      @required String? routeName,
      dynamic arguments}) async {
    try {
      return await Navigator.pushNamed(context!, routeName!,
          arguments: arguments);
    } catch (e) {
      rethrow;
    }
  }

  Future navigateToWithBuilder(
      {@required BuildContext? context, dynamic widget}) async {
    try {
      return Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => widget,
          fullscreenDialog: true,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future navigateToAndCleanUntil(
      {@required BuildContext? context,
      @required String? routeName,
      @required String? lastRouteName,
      dynamic arguments}) async {
    try {
      return Navigator.pushNamedAndRemoveUntil(
          context!, routeName!, ModalRoute.withName(lastRouteName!),
          arguments: arguments);
    } catch (e) {
      rethrow;
    }
  }

  Future navigateToAndClean(
      {@required BuildContext? context, @required String? routeName}) async {
    try {
      return Navigator.pushNamedAndRemoveUntil(
          context!, routeName!, (route) => false);
    } catch (e) {
      rethrow;
    }
  }

  Future navigateToAsReplacement(
      {@required BuildContext? context,
      @required String? routeName,
      dynamic arguments}) async {
    try {
      return Navigator.pushReplacementNamed(context!, routeName!,
          arguments: arguments);
    } catch (e) {
      rethrow;
    }
  }

  dynamic navigateBack({@required BuildContext? context}) {
    try {
      return Navigator.pop(context!);
    } catch (e) {
      rethrow;
    }
  }
}
