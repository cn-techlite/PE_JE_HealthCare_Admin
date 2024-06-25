import 'package:another_flushbar/flushbar.dart';

import '../utils/package_export.dart';

showErrorMsg({
  cxt,
  msg,
}) {
  Flushbar(
    title: 'Alert',
    message: msg,
    duration: const Duration(seconds: 5),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.red,
    titleColor: Colors.white,
    messageColor: Colors.white,
    //showProgressIndicator: true,
    flushbarStyle: FlushbarStyle.FLOATING,
    icon: const Icon(
      Icons.info_outline,
      color: Colors.white,
    ),
  ).show(cxt);
}

showWarningMsg({cxt, msg, email}) {
  Flushbar(
    title: 'Alert',
    message: msg,
    mainButton: InkWell(
      onTap: () {
        // navigateToRoute(
        //     cxt,
        //     ConfirmEmailAddressScreen(
        //       email: email,
        //       fromLogin: true,
        //     ));
      },
      child: const Text(
        "Verify here",
        style: TextStyle(color: Colors.white),
      ),
    ),
    duration: const Duration(seconds: 5),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.yellowAccent.shade700,
    titleColor: Colors.white,
    messageColor: Colors.white,
    //showProgressIndicator: true,
    flushbarStyle: FlushbarStyle.FLOATING,
    icon: const Icon(
      Icons.info_outline,
      color: Colors.white,
    ),
  ).show(cxt);
}

showSuccessMsg({
  cxt,
  msg,
}) {
  Flushbar(
    title: 'Alert',
    message: msg,
    //   showProgressIndicator: true,
    duration: const Duration(seconds: 5),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.green,
    titleColor: Colors.white,
    messageColor: Colors.white,
    flushbarStyle: FlushbarStyle.FLOATING,
    icon: const Icon(
      Icons.done_rounded,
      color: Colors.white,
    ),
  ).show(cxt);
}
