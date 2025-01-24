// ignore_for_file: library_private_types_in_public_api

import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/users_response_model.dart';

class UserAvailabilityPage extends ConsumerStatefulWidget {
  const UserAvailabilityPage({
    super.key,
    required this.userChat,
  });
  final UserResponseModel userChat;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<UserAvailabilityPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _visibleSun = false;
  bool _visibleMon = false;
  bool _visibleTue = false;
  bool _visibleWed = false;
  bool _visibleThur = false;
  bool _visibleFri = false;
  bool _visibleSat = false;

  void _toggleSun() {
    setState(() {
      _visibleSun = !_visibleSun;
    });
  }

  void _toggleMon() {
    setState(() {
      _visibleMon = !_visibleMon;
    });
  }

  void _toggleTue() {
    setState(() {
      _visibleTue = !_visibleTue;
    });
  }

  void _toggleWed() {
    setState(() {
      _visibleWed = !_visibleWed;
    });
  }

  void _toggleThur() {
    setState(() {
      _visibleThur = !_visibleThur;
    });
  }

  void _toggleFri() {
    setState(() {
      _visibleFri = !_visibleFri;
    });
  }

  void _toggleSat() {
    setState(() {
      _visibleSat = !_visibleSat;
    });
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldMessengerState>();

    // var user = accountProviderd.userData;
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Scaffold(
          key: key,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            // toolbarHeight: 8.h,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: const AppText(
                text: "User Availability schedule",
                textAlign: TextAlign.center,
                fontSize: 15,
                isBody: false,
                color: AppColors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600),
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15, top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: "Check Availability Schedule",
                              textAlign: TextAlign.start,
                              fontSize: 13,
                              isBody: true,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.black,
                      thickness: .3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _toggleSun();
                            },
                            child: Card(
                              elevation: 4,
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const AppText(
                                        text: "Sunday",
                                        isBody: true,
                                        textAlign: TextAlign.start,
                                        fontSize: 13,
                                        color: AppColors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    Icon(
                                      size: 33,
                                      _visibleSun
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: AppColors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _visibleSun,
                            child: Container(
                              color: AppColors.white,
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      widget.userChat.sundayAvailability!
                                              .morningAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Morning",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  addVerticalSpacing(context, 180),
                                  Row(
                                    children: [
                                      widget.userChat.sundayAvailability!
                                              .nightAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Night",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpacing(context, 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _toggleMon();
                            },
                            child: Card(
                              elevation: 4,
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const AppText(
                                        text: "Monday",
                                        isBody: true,
                                        textAlign: TextAlign.start,
                                        fontSize: 13,
                                        color: AppColors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    Icon(
                                      size: 33,
                                      _visibleMon
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: AppColors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _visibleMon,
                            child: Container(
                              color: AppColors.white,
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      widget.userChat.mondayAvailability!
                                              .morningAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Morning",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  addVerticalSpacing(context, 180),
                                  Row(
                                    children: [
                                      widget.userChat.mondayAvailability!
                                              .nightAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          isBody: true,
                                          text: "Night",
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpacing(context, 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _toggleTue();
                            },
                            child: Card(
                              elevation: 4,
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const AppText(
                                        text: "Tuesday",
                                        isBody: true,
                                        textAlign: TextAlign.start,
                                        fontSize: 13,
                                        color: AppColors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    Icon(
                                      size: 33,
                                      _visibleTue
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: AppColors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _visibleTue,
                            child: Container(
                              color: AppColors.white,
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      widget.userChat.tuesdayAvailability!
                                              .morningAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Morning",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  addVerticalSpacing(context, 180),
                                  Row(
                                    children: [
                                      widget.userChat.tuesdayAvailability!
                                              .nightAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Night",
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          isBody: true,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpacing(context, 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _toggleWed();
                            },
                            child: Card(
                              elevation: 4,
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const AppText(
                                        text: "Wednesday",
                                        isBody: true,
                                        textAlign: TextAlign.start,
                                        fontSize: 13,
                                        color: AppColors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    Icon(
                                      size: 33,
                                      _visibleWed
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: AppColors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _visibleWed,
                            child: Container(
                              color: AppColors.white,
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      widget.userChat.wednesdayAvailability!
                                              .morningAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Morning",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  addVerticalSpacing(context, 180),
                                  Row(
                                    children: [
                                      widget.userChat.wednesdayAvailability!
                                              .nightAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Night",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpacing(context, 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _toggleThur();
                            },
                            child: Card(
                              elevation: 4,
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const AppText(
                                        text: "Thursday",
                                        isBody: true,
                                        textAlign: TextAlign.start,
                                        fontSize: 13,
                                        color: AppColors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    Icon(
                                      size: 33,
                                      _visibleThur
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: AppColors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _visibleThur,
                            child: Container(
                              color: AppColors.white,
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      widget.userChat.thursdayAvailability!
                                              .morningAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Morning",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  addVerticalSpacing(context, 180),
                                  Row(
                                    children: [
                                      widget.userChat.thursdayAvailability!
                                              .nightAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Night",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpacing(context, 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _toggleFri();
                            },
                            child: Card(
                              elevation: 4,
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const AppText(
                                        text: "Friday",
                                        isBody: true,
                                        textAlign: TextAlign.start,
                                        fontSize: 13,
                                        color: AppColors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    Icon(
                                      size: 33,
                                      _visibleFri
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: AppColors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _visibleFri,
                            child: Container(
                              color: AppColors.white,
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      widget.userChat.fridayAvailability!
                                              .morningAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Morning",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  addVerticalSpacing(context, 180),
                                  Row(
                                    children: [
                                      widget.userChat.fridayAvailability!
                                              .nightAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Night",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpacing(context, 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _toggleSat();
                            },
                            child: Card(
                              elevation: 4,
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const AppText(
                                        text: "Saturday",
                                        isBody: true,
                                        textAlign: TextAlign.start,
                                        fontSize: 13,
                                        color: AppColors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                    Icon(
                                      size: 33,
                                      _visibleSat
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: AppColors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _visibleSat,
                            child: Container(
                              color: AppColors.white,
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      widget.userChat.saturdayAvailability!
                                              .morningAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Morning",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  addVerticalSpacing(context, 180),
                                  Row(
                                    children: [
                                      widget.userChat.saturdayAvailability!
                                              .nightAvailability!
                                          ? Checkbox(
                                              value: true,
                                              onChanged: (value) {},
                                            )
                                          : Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Night",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpacing(context, 30),
                  ])),
        ));
  }
}
