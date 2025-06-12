// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';

import '../../../components/utils/colors.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';

class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<HelpAndSupportPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldMessengerState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const AppText(
          text: "Help and Support",
          textAlign: TextAlign.center,
          fontSize: 20,
          isBody: false,
          color: AppColors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
            size: 20,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      key: key,
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        child: ListView(
          physics: const ScrollPhysics(),
          children: [
            addVerticalSpacing(context, 2),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: AppText(
                text: "FAQ",
                textAlign: TextAlign.start,
                isBody: false,
                fontSize: 18,
                color: AppColors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
            addVerticalSpacing(context, 2),
            ExpandableNotifier(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: const Padding(
                            padding: EdgeInsets.all(10),
                            child: AppText(
                              text: "How does PE & JE Healthcare Work?",
                              textAlign: TextAlign.start,
                              fontSize: 22,
                              isBody: false,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          collapsed: Text(
                            "All you need to do is create an account",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: fontSized(context, 22),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          ),
                          expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              for (var _ in Iterable.generate(1))
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "All you need to do is create an account, then input your details and you are good to go.",
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: fontSized(context, 22),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(
                                  crossFadePoint: 0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            addVerticalSpacing(context, 2),
            ExpandableNotifier(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: const Padding(
                            padding: EdgeInsets.all(10),
                            child: AppText(
                              text: "How do i select the right doctor?",
                              textAlign: TextAlign.start,
                              isBody: false,
                              fontSize: 22,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          collapsed: Text(
                            "Doctors are Listed in the App, you can select the doctor you want, we have verified, you can select any doctor you want.",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: fontSized(context, 22),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          ),
                          expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              for (var _ in Iterable.generate(1))
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Doctors are Listed in the App, you can select the doctor you want, we have verified, you can select any doctor you want.",
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: fontSized(context, 22),
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(
                                  crossFadePoint: 0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            addVerticalSpacing(context, 2),
            ExpandableNotifier(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: const Padding(
                            padding: EdgeInsets.all(10),
                            child: AppText(
                              text:
                                  "Why am i getting billed for the entire session even after i ended it early?",
                              textAlign: TextAlign.start,
                              isBody: true,
                              fontSize: 22,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          collapsed: Text(
                            "you need to pay for the entire session because",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: fontSized(context, 22),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          ),
                          expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              for (var _ in Iterable.generate(1))
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "you need to pay for the entire session because it is better and has a discount attached to it",
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: fontSized(context, 22),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(
                                  crossFadePoint: 0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            addVerticalSpacing(context, 2),
            ExpandableNotifier(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: const Padding(
                            padding: EdgeInsets.all(10),
                            child: AppText(
                              text:
                                  "Is it safe to store my card details on the app?",
                              textAlign: TextAlign.start,
                              isBody: true,
                              fontSize: 22,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          collapsed: Text(
                            "Yes please. your details are encrypted",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: fontSized(context, 22),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          ),
                          expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              for (var _ in Iterable.generate(1))
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Yes please. your details are encrypted and can't be accessed by third party",
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: fontSized(context, 22),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(
                                  crossFadePoint: 0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            addVerticalSpacing(context, 2),
            ExpandableNotifier(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: const Padding(
                            padding: EdgeInsets.all(10),
                            child: AppText(
                              text:
                                  "How do i trust the Doctors on the platform?",
                              textAlign: TextAlign.start,
                              isBody: true,
                              fontSize: 22,
                              color: AppColors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          collapsed: Text(
                            "",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: fontSized(context, 22),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          ),
                          expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              for (var _ in Iterable.generate(1))
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "",
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: fontSized(context, 22),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(
                                  crossFadePoint: 0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
