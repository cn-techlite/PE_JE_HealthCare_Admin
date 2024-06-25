import 'package:flutter/material.dart';

bottomSheetPopUp({
  required Widget child,
  required BuildContext ctx,
  double? height,
}) {
  return showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      // useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14.0),
        ),
      ),
      builder: (context) {
        return Container(
            margin: const EdgeInsets.all(20), height: height, child: child);
      });
}
