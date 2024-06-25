import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pinput/pinput.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../components/architecture/mvc.dart';
import '../../../components/helpers/globals.dart';
import '../../../components/utils/app_buttons.dart';
import '../../../components/utils/colors.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/widgets/app_text.dart';
import '../controller/confirm_email.dart';

class ConfirmEmailAddressView extends StatelessView<ConfirmEmailAddressScreen,
    ConfirmEmailAddressController> {
  const ConfirmEmailAddressView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              right: 24.0, bottom: 24, left: 24, top: 100),
          child: Column(
            children: [
              const AppText(
                  text: "Verify your email address",
                  textAlign: TextAlign.start,
                  fontSize: 20,
                  color: AppColors.primary,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "A verification code has been sent to your email ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: fontSized(context, 22),
                        fontFamily: "Inter",
                      ),
                    ),
                    TextSpan(
                      text: widget.fromLogin == false
                          ? widget.email
                          : widget.email,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: fontSized(context, 22),
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ),

              //const SizedBox(height: 8),

              const SizedBox(height: 60),
              Pinput(
                length: 5,
                controller: controller.pinPutController,
                onCompleted: (value) => controller.submit(),
                onChanged: (value) {
                  controller.getPin(value);
                },
              ),
              const SizedBox(height: 32),
              IgnorePointer(
                ignoring: controller.pin.isEmpty || controller.pin.length < 5,
                child: controller.isLoading
                    ? const SpinKitThreeBounce(
                        color: AppColors.primary,
                        size: 16,
                      )
                    : appButtons(
                        "VERIFY MAIL",
                        getScreenWidth(context),
                        () {
                          controller.submit();
                        },
                        controller.pin.isEmpty || controller.pin.length < 5
                            ? AppColors.grey
                            : AppColors.primary,
                      ),
              ),

              const SizedBox(height: 50),
              StreamBuilder<int>(
                stream: globals.stopWatchTimer!.rawTime,
                initialData: 0,
                builder: (context, snap) {
                  final value = snap.data;
                  final displayTime = StopWatchTimer.getDisplayTime(
                    value!,
                    milliSecond: false,
                    minute: false,
                    hours: false,
                  );
                  return Text(
                    '$displayTime seconds',
                    style: TextStyle(
                      color: globals.stopWatchTimer!.isRunning
                          ? AppColors.primary
                          : AppColors.white,
                    ),
                  );
                },
              ),
              addVerticalSpacing(context, 50),
              TextButton(
                onPressed: globals.stopWatchTimer!.isRunning
                    ? null
                    : () => controller.resendCode(),
                child: const Text('Resend mail'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
