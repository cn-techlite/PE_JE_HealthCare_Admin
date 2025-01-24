// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/service_user_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/states/home_provider.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/users/assign_users.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/service_users/view_notes.dart';
import '../../../../components/utils/package_export.dart';

class ServiceUsersDetailsPage extends ConsumerStatefulWidget {
  const ServiceUsersDetailsPage({
    super.key,
    required this.userChat,
  });

  final ServiceUserResponseModel userChat;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<ServiceUsersDetailsPage> {
  late HomeNotifier homeProviders;

  @override
  void initState() {
    homeProviders = ref.read(homeProvider.notifier);
    homeProviders.getAllUsersData();
    homeProviders.allUserData;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _visibleCommunication = false;
  bool _visibleMobilization = false;
  bool _visibleWashingAndDressing = false;
  bool _visibleMedication = false;
  bool _visibleEyeSight = false;
  bool _visibleSocialActivities = false;
  bool _visibleFallsRisks = false;
  bool _visibleFoodAndFluid = false;

  void _toggleCommunication() {
    setState(() {
      _visibleCommunication = !_visibleCommunication;
    });
  }

  void _toggleMobilization() {
    setState(() {
      _visibleMobilization = !_visibleMobilization;
    });
  }

  void _toggleWashingAndDressing() {
    setState(() {
      _visibleWashingAndDressing = !_visibleWashingAndDressing;
    });
  }

  void _toggleMedication() {
    setState(() {
      _visibleMedication = !_visibleMedication;
    });
  }

  void _toggleEyeSight() {
    setState(() {
      _visibleEyeSight = !_visibleEyeSight;
    });
  }

  void _toggleSocialActivities() {
    setState(() {
      _visibleSocialActivities = !_visibleSocialActivities;
    });
  }

  void _toggleFallsRisks() {
    setState(() {
      _visibleFallsRisks = !_visibleFallsRisks;
    });
  }

  void _toggleFoodAndFluid() {
    setState(() {
      _visibleFoodAndFluid = !_visibleFoodAndFluid;
    });
  }

  Widget buildItem(BuildContext context, ServiceUserResponseModel userChat) {
    // Timestamp? t = userChat.timestamp;
    DateTime d = userChat.createdAt!;
    String time = DateFormat.yMMMd().add_jm().format(d);
    return ListView(
      physics: const ScrollPhysics(),
      children: <Widget>[
        addVerticalSpacing(context, 20),
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 57,
                backgroundImage: userChat.imageProfile.toString().isEmpty
                    ? const NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                    // ignore: unnecessary_null_comparison
                    : userChat.imageProfile == null
                        ? const NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                        : NetworkImage(userChat.imageProfile.toString())),
          ),
        ),
        addVerticalSpacing(context, 50),
        GestureDetector(
          onTap: () {
            navigateToRoute(
                context,
                ViewNotesPage(
                  userChat: userChat,
                ));
          },
          child: const AppText(
              text: "View Notes",
              textAlign: TextAlign.center,
              isBody: true,
              fontSize: 14,
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        addVerticalSpacing(context, 50),
        Center(
          child: AppText(
              text: "${userChat.firstName} ${userChat.lastName}",
              textAlign: TextAlign.start,
              fontSize: 19,
              isBody: true,
              color: AppColors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: RichText(
            text: TextSpan(
              text: "D.O.B:",
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                  fontSize: fontSized(context, 16)),
              children: <TextSpan>[
                TextSpan(
                    text: "${userChat.dateOfBirth}",
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 20))),
              ],
            ),
          ),
        ),
        Center(
          child: RichText(
            text: TextSpan(
              text: "Date Created: ",
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                  fontSize: fontSized(context, 16)),
              children: <TextSpan>[
                TextSpan(
                    text: time,
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        fontSize: fontSized(context, 20))),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 120.0, right: 120.0),
          child: GestureDetector(
            onTap: () {
              homeProviders.deleteServiceUser(
                  context: context, serviceUserId: userChat.id.toString());
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Deleted Successfully")));
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.red,
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: AppText(
                    text: "Delete",
                    isBody: true,
                    textAlign: TextAlign.start,
                    fontSize: 19,
                    color: AppColors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        addVerticalSpacing(context, 20),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleCommunication();
                },
                child: Card(
                  elevation: 1,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const AppText(
                            text: "Communication",
                            isBody: true,
                            textAlign: TextAlign.start,
                            fontSize: 13,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        Icon(
                          size: 33,
                          _visibleCommunication
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
                visible: _visibleCommunication,
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addVerticalSpacing(context, 180),
                      AppText(
                          text: "${userChat.communication}",
                          isBody: true,
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpacing(context, 50),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleMobilization();
                },
                child: Card(
                  elevation: 1,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const AppText(
                            text: "Mobilization",
                            isBody: true,
                            textAlign: TextAlign.start,
                            fontSize: 13,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        Icon(
                          size: 33,
                          _visibleMobilization
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
                visible: _visibleMobilization,
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addVerticalSpacing(context, 180),
                      AppText(
                          text: "${userChat.mobilization}",
                          isBody: true,
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpacing(context, 50),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleWashingAndDressing();
                },
                child: Card(
                  elevation: 1,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const AppText(
                            text: "Washing and Dressing",
                            isBody: true,
                            textAlign: TextAlign.start,
                            fontSize: 13,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        Icon(
                          size: 33,
                          _visibleWashingAndDressing
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
                visible: _visibleWashingAndDressing,
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addVerticalSpacing(context, 180),
                      AppText(
                          text: "${userChat.washingAndDressing}",
                          isBody: true,
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpacing(context, 50),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleMedication();
                },
                child: Card(
                  elevation: 1,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const AppText(
                            text: "Medication",
                            textAlign: TextAlign.start,
                            isBody: true,
                            fontSize: 13,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        Icon(
                          size: 33,
                          _visibleMedication
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
                visible: _visibleMedication,
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addVerticalSpacing(context, 180),
                      AppText(
                          text: "${userChat.medication}",
                          isBody: true,
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpacing(context, 50),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleEyeSight();
                },
                child: Card(
                  elevation: 1,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const AppText(
                            text: "Eye Sight",
                            isBody: true,
                            textAlign: TextAlign.start,
                            fontSize: 13,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        Icon(
                          size: 33,
                          _visibleEyeSight
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
                visible: _visibleEyeSight,
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addVerticalSpacing(context, 180),
                      AppText(
                          text: "${userChat.eyesight}",
                          isBody: true,
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpacing(context, 50),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleSocialActivities();
                },
                child: Card(
                  elevation: 1,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const AppText(
                            text: "Social Activities",
                            isBody: true,
                            textAlign: TextAlign.start,
                            fontSize: 13,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        Icon(
                          size: 33,
                          _visibleSocialActivities
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
                visible: _visibleSocialActivities,
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addVerticalSpacing(context, 180),
                      AppText(
                          text: "${userChat.socialactivities}",
                          isBody: true,
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpacing(context, 50),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleFallsRisks();
                },
                child: Card(
                  elevation: 1,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const AppText(
                            text: "Falls Risks",
                            textAlign: TextAlign.start,
                            isBody: false,
                            fontSize: 13,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        Icon(
                          size: 33,
                          _visibleFallsRisks
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
                visible: _visibleFallsRisks,
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addVerticalSpacing(context, 180),
                      AppText(
                          text: "${userChat.fallRisk}",
                          textAlign: TextAlign.start,
                          isBody: false,
                          fontSize: 16,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpacing(context, 50),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _toggleFoodAndFluid();
                },
                child: Card(
                  elevation: 1,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const AppText(
                            text: "Food and Fluid",
                            textAlign: TextAlign.start,
                            isBody: false,
                            fontSize: 13,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        const Spacer(),
                        Icon(
                          size: 33,
                          _visibleFoodAndFluid
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
                visible: _visibleFoodAndFluid,
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addVerticalSpacing(context, 180),
                      AppText(
                          text: "${userChat.foodAndFluid}",
                          textAlign: TextAlign.start,
                          isBody: false,
                          fontSize: 16,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpacing(context, 50),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldMessengerState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        // toolbarHeight: 8.h,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const AppText(
            text: "Service User Details",
            textAlign: TextAlign.center,
            isBody: true,
            fontSize: 21,
            color: AppColors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            child: GestureDetector(
              onTap: () {
                navigateToRoute(
                    context,
                    AssignUserTaskPage(
                      userChat: widget.userChat,
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: AppText(
                      text: "Assign User",
                      textAlign: TextAlign.start,
                      isBody: false,
                      fontSize: 19,
                      color: AppColors.primary,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      key: key,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        child: buildItem(context, widget.userChat),
      ),
    );
  }
}
