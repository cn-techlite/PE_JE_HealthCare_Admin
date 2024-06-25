// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../utils/app_buttons.dart';
import '../utils/colors.dart';
import '../utils/helper_functions.dart';

class ListBuildScreen extends StatefulWidget {
  const ListBuildScreen({super.key});

  @override
  State<ListBuildScreen> createState() => _ListBuildScreenState();
}

class _ListBuildScreenState extends State<ListBuildScreen> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          child: appButton("Stop", getScreenWidth(context), () {
            // printData("dhdhd", controller.position.hold(() {

            // }));
          }, AppColors.primary, false),
        ),
        appBar: AppBar(),
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            notification.scrollDelta;
            // printData("identifier", notification.toString());

            return true;
          },
          child: ListView.builder(
              controller: controller,
              itemCount: 200,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("index $index"),
                );
              }),
        ));
  }
}
