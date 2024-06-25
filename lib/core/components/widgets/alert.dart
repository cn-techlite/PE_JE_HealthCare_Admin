// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

//     }
SuccessAlert(
    {String? title,
    String? content,
    BuildContext? context,
    Function()? onTap}) {
  return showDialog(
      context: context!,
      builder: (BuildContext context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              title: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset('assets/images/sucessMark.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    title!,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF9E00)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      content!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2788E9)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: onTap ?? () => Navigator.of(context).pop(),
                    child: SizedBox(
                      width: 300,
                      height: 52,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              // content: Column(
              //   children: [

              //   ],
              // ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              // actions: <Widget>[

              // ],
            ),
          ));
}

Alert({
  String? title,
  Widget? content,
  BuildContext? context,
  String? yesText,
  String? noText = 'Ok',
  Function()? onYes,
  Function()? onNo,
}) {
  return showDialog(
      context: context!,
      builder: (BuildContext context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              // title: Text(
              //   title!,
              //   style: const TextStyle(color: Color(0xFFFF9E00)),
              // ),
              content: content,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              // actions: <Widget>[
              //   if (yesText != null)
              //     TextButton(
              //       child: Text(
              //         '$yesText',
              //         style: TextStyle(color: Color(0xFF2788E9)),
              //       ),
              //       onPressed: onYes,
              //     ),
              //   TextButton(
              //       child: Text(
              //         noText!,
              //         style: TextStyle(color: Color(0xFF2788E9)),
              //       ),
              //       onPressed: onNo ?? () => Navigator.of(context).pop()),
              // ],
            ),
          ));
}

class OptionAlert extends StatelessWidget {
  /// This method is responsible for creating an alert dialog the user

  String? title;
  String? content;
  String? yesText;
  String? noText;
  Function()? onYes;

  OptionAlert(
      {super.key,
      this.title,
      this.content,
      this.onYes,
      this.yesText,
      this.noText = 'Ok'});

  @override
  Widget build(BuildContext? context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        title: Text(
          title!,
          style: const TextStyle(color: Color(0xFFFF9E00)),
        ),
        content: Text(
          content!,
          style: const TextStyle(color: Color(0xFF2788E9)),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        actions: <Widget>[
          TextButton(
            onPressed: onYes,
            child: Text(
              '$yesText',
              style: const TextStyle(color: Color(0xFF2788E9)),
            ),
          ),
          TextButton(
            child: Text(
              noText!,
              style: const TextStyle(color: Color(0xFF2788E9)),
            ),
            onPressed: () {
              Navigator.of(context!).pop();
            },
          ),
        ],
      ),
    );
  }
}
