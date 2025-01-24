// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/service_user_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/states/home_provider.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/service_users/search_user.dart';
import '../../../../components/utils/colors.dart';
import '../../../../components/widgets/app_text.dart';

class AssignUserTaskPage extends ConsumerStatefulWidget {
  const AssignUserTaskPage({
    super.key,
    required this.userChat,
  });
  final ServiceUserResponseModel userChat;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<AssignUserTaskPage> {
  late HomeNotifier dataProvider;

  @override
  void initState() {
    dataProvider = ref.read(homeProvider.notifier);
    dataProvider.getAllUsersData();
    dataProvider.allUserData;
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
    dataProvider = ref.read(homeProvider.notifier);
    dataProvider.getAllUsersData();
    dataProvider.allUserData;
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
                text: "Assign User Task",
                textAlign: TextAlign.center,
                isBody: false,
                fontSize: 15,
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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text:
                                  "${widget.userChat.firstName} ${widget.userChat.lastName}",
                              textAlign: TextAlign.start,
                              isBody: true,
                              fontSize: 13,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                          const SizedBox(
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
                                        isBody: true,
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
                                  const AppText(
                                      text: "Morning Task:",
                                      textAlign: TextAlign.start,
                                      isBody: true,
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "sunday",
                                              isNight: false,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.sunday!.morningVisitName}",
                                              textAlign: TextAlign.start,
                                              isBody: true,
                                              fontSize: 15,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  addVerticalSpacing(context, 180),
                                  const AppText(
                                      text: "Night Task:",
                                      textAlign: TextAlign.start,
                                      fontSize: 16,
                                      isBody: true,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "sunday",
                                              isNight: true,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.sunday!.nightVisitName}",
                                              textAlign: TextAlign.start,
                                              isBody: true,
                                              fontSize: 15,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
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
                                        isBody: true,
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
                                  const AppText(
                                      text: "Morning Task:",
                                      textAlign: TextAlign.start,
                                      isBody: true,
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "monday",
                                              isNight: false,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.monday!.morningVisitName}",
                                              textAlign: TextAlign.start,
                                              isBody: true,
                                              fontSize: 15,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  addVerticalSpacing(context, 180),
                                  const AppText(
                                      text: "Night Task:",
                                      textAlign: TextAlign.start,
                                      isBody: true,
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "monday",
                                              isNight: true,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.monday!.nightVisitName}",
                                              textAlign: TextAlign.start,
                                              isBody: true,
                                              fontSize: 15,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
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
                                  const AppText(
                                      text: "Morning Task:",
                                      isBody: true,
                                      textAlign: TextAlign.start,
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "tuesday",
                                              isNight: false,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.tuesday!.morningVisitName}",
                                              textAlign: TextAlign.start,
                                              isBody: true,
                                              fontSize: 15,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  addVerticalSpacing(context, 180),
                                  const AppText(
                                      text: "Night Task:",
                                      textAlign: TextAlign.start,
                                      isBody: true,
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "tuesday",
                                              isNight: true,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.tuesday!.nightVisitName}",
                                              textAlign: TextAlign.start,
                                              isBody: true,
                                              fontSize: 15,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
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
                                        textAlign: TextAlign.start,
                                        isBody: true,
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
                                  const AppText(
                                      text: "Morning Task:",
                                      textAlign: TextAlign.start,
                                      isBody: true,
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "wednesday",
                                              isNight: false,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.wednesday!.morningVisitName}",
                                              textAlign: TextAlign.start,
                                              fontSize: 15,
                                              isBody: true,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  addVerticalSpacing(context, 180),
                                  const AppText(
                                      text: "Night Task:",
                                      textAlign: TextAlign.start,
                                      fontSize: 16,
                                      isBody: true,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "wednesday",
                                              isNight: true,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.wednesday!.nightVisitName}",
                                              textAlign: TextAlign.start,
                                              fontSize: 15,
                                              isBody: true,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
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
                                child: Container(
                                  color: AppColors.white,
                                  padding: const EdgeInsets.all(20),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const AppText(
                                          text: "Morning Task:",
                                          isBody: true,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            navigateToRoute(
                                                context,
                                                SelectUserPage(
                                                  users:
                                                      dataProvider.allUserData,
                                                  userId: widget.userChat.id
                                                      .toString(),
                                                  dayString: "thursday",
                                                  isNight: false,
                                                ));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColors.primary,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0,
                                                  bottom: 10.0,
                                                  left: 20.0,
                                                  right: 20.0),
                                              child: AppText(
                                                  text:
                                                      "Assign User:\n${widget.userChat.thursday!.morningVisitName}",
                                                  textAlign: TextAlign.start,
                                                  fontSize: 15,
                                                  isBody: true,
                                                  color: AppColors.white,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      addVerticalSpacing(context, 180),
                                      const AppText(
                                          text: "Night Task:",
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          isBody: true,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            navigateToRoute(
                                                context,
                                                SelectUserPage(
                                                  users:
                                                      dataProvider.allUserData,
                                                  userId: widget.userChat.id
                                                      .toString(),
                                                  dayString: "thursday",
                                                  isNight: true,
                                                ));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColors.primary,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0,
                                                  bottom: 10.0,
                                                  left: 20.0,
                                                  right: 20.0),
                                              child: AppText(
                                                  text:
                                                      "Assign User:\n${widget.userChat.thursday!.nightVisitName}",
                                                  textAlign: TextAlign.start,
                                                  isBody: true,
                                                  fontSize: 15,
                                                  color: AppColors.white,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        isBody: true,
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
                                  const AppText(
                                      text: "Morning Task:",
                                      isBody: true,
                                      textAlign: TextAlign.start,
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "friday",
                                              isNight: false,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.friday!.morningVisitName}",
                                              textAlign: TextAlign.start,
                                              fontSize: 15,
                                              isBody: true,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  addVerticalSpacing(context, 180),
                                  const AppText(
                                      text: "Night Task:",
                                      textAlign: TextAlign.start,
                                      fontSize: 16,
                                      isBody: true,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "friday",
                                              isNight: true,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.friday!.nightVisitName}",
                                              textAlign: TextAlign.start,
                                              fontSize: 15,
                                              isBody: true,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
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
                                        textAlign: TextAlign.start,
                                        fontSize: 13,
                                        isBody: true,
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
                                  const AppText(
                                      text: "Morning Task:",
                                      textAlign: TextAlign.start,
                                      fontSize: 16,
                                      isBody: true,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "saturday",
                                              isNight: false,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.saturday!.morningVisitName}",
                                              textAlign: TextAlign.start,
                                              fontSize: 15,
                                              isBody: true,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  addVerticalSpacing(context, 180),
                                  const AppText(
                                      text: "Night Task:",
                                      textAlign: TextAlign.start,
                                      isBody: true,
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateToRoute(
                                            context,
                                            SelectUserPage(
                                              users: dataProvider.allUserData,
                                              userId:
                                                  widget.userChat.id.toString(),
                                              dayString: "saturday",
                                              isNight: true,
                                            ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: AppText(
                                              text:
                                                  "Assign User:\n${widget.userChat.saturday!.nightVisitName}",
                                              textAlign: TextAlign.start,
                                              fontSize: 15,
                                              isBody: true,
                                              color: AppColors.white,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
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
