// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

Future selectTime({BuildContext? context, TimeOfDay? selectedTime}) async {
  final pickedS = await showTimePicker(
    context: context!,
    initialTime: selectedTime!,
  );

  if (pickedS != null && pickedS != selectedTime) {
    return pickedS;
  }
}

Future buildMaterialDatePicker(
    {BuildContext? context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate}) async {
  final picked = await showDatePicker(
      context: context!,
      initialDate: initialDate!,
      firstDate: firstDate!,
      lastDate: lastDate!,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.grey,
            splashColor: Colors.black,
            textTheme: const TextTheme(
              titleMedium: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
            ),
            colorScheme: const ColorScheme.light(
                primary: AppColors.primary,
                onSecondary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: Colors.black,
                secondary: Colors.black),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ?? const Text(""),
        );
      });
  if (picked != null && picked != initialDate) {
    return picked;
  }
}

/// This builds cupertino date picker in iOS
Future buildCupertinoDatePicker(
  BuildContext context,
  DateTime initialDate,
) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newdate) {},
              use24hFormat: true,
              maximumDate: DateTime(2018, 12, 30),
              minimumYear: 2010,
              maximumYear: 2018,
              minuteInterval: 1,
              mode: CupertinoDatePickerMode.dateAndTime,
            ));
      });
}
