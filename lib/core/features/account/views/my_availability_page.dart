// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:pe_je_healthcare_admin/core/components/helpers/firebase_constants.dart';
import 'package:pe_je_healthcare_admin/core/components/helpers/globals.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/features/account/model/available_model.dart';
import 'package:pe_je_healthcare_admin/core/features/account/states/account_provider.dart';
import '../../../components/utils/colors.dart';
import '../../../components/widgets/app_text.dart';

class MyAvailabilityPage extends ConsumerStatefulWidget {
  const MyAvailabilityPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<MyAvailabilityPage> {
  late AccountProvider dataProvider;
  bool isSunMorning = false;
  bool isSunNight = false;
  bool isMonMorning = false;
  bool isMonNight = false;
  bool isTuesMorning = false;
  bool isTuesNight = false;
  bool isWedMorning = false;
  bool isWedNight = false;
  bool isThurMorning = false;
  bool isThurNight = false;
  bool isFriMorning = false;
  bool isFriNight = false;
  bool isSatMorning = false;
  bool isSatNight = false;

  @override
  void initState() {
    _showUserDialog();
    dataProvider = ref.read(accountProvider);
    // dataProvider.getPostData(context);
    // dataProvider.userData;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _showUserDialog() async {
    FirebaseFirestore.instance
        .collection(FirestoreConstants.pathUsersCollection)
        .doc(globals.userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          isSunMorning =
              documentSnapshot['AvailabilityDays']['Sunday']['Morning'];
          isSunNight = documentSnapshot['AvailabilityDays']['Sunday']['Night'];
          isMonMorning =
              documentSnapshot['AvailabilityDays']['Monday']['Morning'];
          isMonNight = documentSnapshot['AvailabilityDays']['Monday']['Night'];
          isTuesMorning =
              documentSnapshot['AvailabilityDays']['Tuesday']['Morning'];
          isTuesNight =
              documentSnapshot['AvailabilityDays']['Tuesday']['Night'];
          isWedMorning =
              documentSnapshot['AvailabilityDays']['Wednesday']['Morning'];
          isWedNight =
              documentSnapshot['AvailabilityDays']['Wednesday']['Night'];
          isThurMorning =
              documentSnapshot['AvailabilityDays']['Thursday']['Morning'];
          isThurNight =
              documentSnapshot['AvailabilityDays']['Thursday']['Night'];
          isFriMorning =
              documentSnapshot['AvailabilityDays']['Friday']['Morning'];
          isFriNight = documentSnapshot['AvailabilityDays']['Friday']['Night'];
          isSatMorning =
              documentSnapshot['AvailabilityDays']['Saturday']['Morning'];
          isSatNight =
              documentSnapshot['AvailabilityDays']['Saturday']['Night'];
        });
        if (kDebugMode) {
          print('Document exists on the database');
        }
      }
    });
    if (kDebugMode) {
      print(isSatNight);
    }
  }

  var textValue = 'Switch is OFF';

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

  void toggleSwitchSun(bool? value) {
    if (isSunMorning == false) {
      setState(() {
        isSunMorning = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isSunMorning = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchSunNight(bool? value) {
    if (isSunNight == false) {
      setState(() {
        isSunNight = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isSunNight = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchMon(bool? value) {
    if (isMonMorning == false) {
      setState(() {
        isMonMorning = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isMonMorning = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchMonNight(bool? value) {
    if (isMonNight == false) {
      setState(() {
        isMonNight = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isMonNight = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchTue(bool? value) {
    if (isTuesMorning == false) {
      setState(() {
        isTuesMorning = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isTuesMorning = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchTueNight(bool? value) {
    if (isTuesNight == false) {
      setState(() {
        isTuesNight = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isTuesNight = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchWed(bool? value) {
    if (isWedMorning == false) {
      setState(() {
        isWedMorning = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isWedMorning = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchWedNight(bool? value) {
    if (isWedNight == false) {
      setState(() {
        isWedNight = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isWedNight = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchThur(bool? value) {
    if (isThurMorning == false) {
      setState(() {
        isThurMorning = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isThurMorning = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchThurNight(bool? value) {
    if (isThurNight == false) {
      setState(() {
        isThurNight = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isThurNight = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchFri(bool? value) {
    if (isFriMorning == false) {
      setState(() {
        isFriMorning = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isFriMorning = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchFriNight(bool? value) {
    if (isFriNight == false) {
      setState(() {
        isFriNight = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isFriNight = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchSat(bool? value) {
    if (isSatMorning == false) {
      setState(() {
        isSatMorning = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isSatMorning = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
  }

  void toggleSwitchSatNight(bool? value) {
    if (isSatNight == false) {
      setState(() {
        isSatNight = true;
      });
      if (kDebugMode) {
        print('Switch Button is ON');
      }
    } else {
      setState(() {
        isSatNight = false;
      });
      if (kDebugMode) {
        print('Switch Button is OFF');
      }
    }
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
                text: "Edit Availability schedule",
                textAlign: TextAlign.center,
                fontSize: 15,
                color: AppColors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600),
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
                child: GestureDetector(
                  onTap: () {
                    Day sunday = Day(
                      morning: isSunMorning,
                      night: isSunNight,
                    );
                    Day monday = Day(
                      morning: isMonMorning,
                      night: isMonNight,
                    );
                    Day tuesday = Day(
                      morning: isTuesMorning,
                      night: isTuesNight,
                    );
                    Day wednesday = Day(
                      morning: isWedMorning,
                      night: isWedNight,
                    );
                    Day thursday = Day(
                      morning: isThurMorning,
                      night: isThurNight,
                    );
                    Day friday = Day(
                      morning: isFriMorning,
                      night: isFriNight,
                    );
                    Day saturday = Day(
                      morning: isSatMorning,
                      night: isSatNight,
                    );
                    UpdateAvailableModel mode = UpdateAvailableModel(
                        monday: monday,
                        tuesday: tuesday,
                        wednesday: wednesday,
                        thursday: thursday,
                        friday: friday,
                        saturday: saturday,
                        sunday: sunday);

                    dataProvider.updateAvailability(
                        context: context,
                        userId: globals.userId.toString(),
                        available: mode);

                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primary,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: AppText(
                          text: "Save",
                          textAlign: TextAlign.start,
                          fontSize: 14,
                          color: AppColors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
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
                                      Checkbox(
                                        value: isSunMorning,
                                        onChanged: toggleSwitchSun,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
                                          text: "Morning",
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
                                      Checkbox(
                                        value: isSunNight,
                                        onChanged: toggleSwitchSunNight,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const AppText(
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
                                        Checkbox(
                                          value: isMonMorning,
                                          onChanged: toggleSwitchMon,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
                                            text: "Morning",
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
                                        Checkbox(
                                          value: isMonNight,
                                          onChanged: toggleSwitchMonNight,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
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
                              )),
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
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: isTuesMorning,
                                          onChanged: toggleSwitchTue,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
                                            text: "Morning",
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
                                        Checkbox(
                                          value: isTuesNight,
                                          onChanged: toggleSwitchTueNight,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
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
                              )),
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
                                        Checkbox(
                                          value: isWedMorning,
                                          onChanged: toggleSwitchWed,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
                                            text: "Morning",
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
                                        Checkbox(
                                          value: isWedNight,
                                          onChanged: toggleSwitchWedNight,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
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
                              )),
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
                                        Checkbox(
                                          value: isThurMorning,
                                          onChanged: toggleSwitchThur,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
                                            text: "Morning",
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
                                        Checkbox(
                                          value: isThurNight,
                                          onChanged: toggleSwitchThurNight,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
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
                              )),
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
                                        Checkbox(
                                          value: isFriMorning,
                                          onChanged: toggleSwitchFri,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
                                            text: "Morning",
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
                                        Checkbox(
                                          value: isFriNight,
                                          onChanged: toggleSwitchFriNight,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
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
                              )),
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
                                        Checkbox(
                                          value: isSatMorning,
                                          onChanged: toggleSwitchSat,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
                                            text: "Morning",
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
                                        Checkbox(
                                          value: isSatNight,
                                          onChanged: toggleSwitchSatNight,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const AppText(
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
                              )),
                        ],
                      ),
                    ),
                    addVerticalSpacing(context, 30),
                  ])),
        ));
  }
}
