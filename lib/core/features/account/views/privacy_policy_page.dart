// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';

import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<PrivacyPolicyPage> {
  String selectedCarType = "";
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
    return Container(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        color: Colors.white,
        child: Scaffold(
          key: key,
          backgroundColor: Colors.transparent,
          body: ListView(
            physics: const ScrollPhysics(),
            children: <Widget>[
              addVerticalSpacing(context, 40),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.black,
                      )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: AppText(
                    text: "Privacy Policy",
                    textAlign: TextAlign.start,
                    fontSize: 23,
                    color: AppColors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              addVerticalSpacing(context, 40),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: AppText(
                    text:
                        "You may use our Services only if you can legally form a binding contract with us, and only in accordance with these terms and all applicable laws. You can't use our Services if it would be prohibited by Nigerian sanctions. Any use or access by anyone under the age of 18 is not allowed.",
                    textAlign: TextAlign.start,
                    fontSize: 22,
                    color: AppColors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
              addVerticalSpacing(context, 40),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: AppText(
                    text:
                        "Using PE & JE HealthCare may include downloading software to your phone, tablet, or other device.",
                    textAlign: TextAlign.start,
                    fontSize: 22,
                    color: AppColors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
              addVerticalSpacing(context, 40),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: AppText(
                    text:
                        "You agree that we may automatically update that software, and these terms will apply to any updates. We are a technology company. We do not own, operate, or maintain any parking facility, and we do not provide parking enforcement.services.",
                    textAlign: TextAlign.start,
                    fontSize: 22,
                    color: AppColors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
              addVerticalSpacing(context, 40),
            ],
          ),
        ));
  }
}
