// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';

import '../../../components/utils/colors.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';

class TermsOfServicePage extends StatefulWidget {
  const TermsOfServicePage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<TermsOfServicePage> {
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
                    text: "AGREEMENT TO OUR LEGAL TERMS",
                    textAlign: TextAlign.start,
                    fontSize: 19,
                    isBody: false,
                    color: AppColors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              addVerticalSpacing(context, 40),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: AppText(
                    text:
                        "These Legal Terms constitute a legally binding agreement made between you, whether personally or on behalf of an entity ('you'), and eSolutions company, concerning your access to and use of the Services. You agree that by accessing the Services, you have read, understood, and agreed to be bound by all of these Legal Terms. IF YOU DO NOT AGREE WITH ALL OF THESE LEGAL TERMS, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SERVICES AND YOU MUST DISCONTINUE USE IMMEDIATELY.|\n\n"
                        "We will provide you with prior notice of any scheduled changes to the Services you are using. The modified Legal Terms will become effective upon posting or notifying you by info@PE & JE Healthcare, as stated in the email message. By continuing to use the Services after the effective date of any changes, you agree to be bound by the modified terms.\n\n"
                        "The Services are intended for users who are at least 18 years old. Persons under the age of 18 are not permitted to use or register for the Services.\n\n"
                        "The information provided when using the Services is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject us to any registration requirement within such jurisdiction or country. Accordingly, those persons who choose to access the Services from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable.\n\n"
                        "It is expected that all healthcare professionals should practice within the ethics of their profession. Every consultation, health information, prescriptions and referrals must according to the standard expected by your profession, as eSolutions and by extension PE & JE Healthcare will not be responsible for any liability you incurred. This is the sole responsibility of the healthcare worker.\n\n"
                        "We are the owner or the licensee of all intellectual property rights in our Services, including all source code, databases, functionality, software, website designs, audio, video, text, photographs, and graphics in the Services (collectively, the 'Content'), as well as the trademarks, service marks, and logos contained therein (the 'Marks').\n\n"
                        "Our Content and Marks are protected by copyright and trademark laws (and various other intellectual property rights and unfair competition laws) and treaties in the United States and around the world.\n\n"
                        "The Content and Marks are provided in or through the Services 'AS IS' for your personal, non-commercial use only.\n\n"
                        "Subject to your compliance with these Legal Terms, including the 'PROHIBITED ACTIVITIES' section below, we grant you a non-exclusive, non-transferable, revocable licence to: access the Services; and download or print a copy of any portion of the Content to which you have properly gained access.solely for your personal, non-commercial use.\n\n"
                        "These Legal Terms and any policies or operating rules posted by us on the Services or in respect to the Services constitute the entire agreement and understanding between you and us. Our failure to exercise or enforce any right or provision of these Legal Terms shall not operate as a waiver of such right or provision. These Legal Terms operate to the fullest extent permissible by law. We may assign any or all of our rights and obligations to others at any time. We shall not be responsible or liable for any loss, damage, delay, or failure to act caused by any cause beyond our reasonable control. If any provision or part of a provision of these Legal Terms is determined to be unlawful, void, or unenforceable, that provision or part of the provision is deemed severable from these Legal Terms and does not affect the validity and enforceability of any remaining provisions. There is no joint venture, partnership, employment or agency relationship created between you and us as a result of these Legal Terms or use of the Services. You agree that these Legal Terms will not be construed against us by virtue of having drafted them. You hereby waive any and all defences you may have based on the electronic form of these Legal Terms and the lack of signing by the parties hereto to execute these Legal Terms.\n\n",
                    textAlign: TextAlign.start,
                    isBody: true,
                    fontSize: 19,
                    color: AppColors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
              addVerticalSpacing(context, 40),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: AppText(
                    text:
                        "Using E-Clinic may include downloading software to your phone, tablet, or other device.",
                    textAlign: TextAlign.start,
                    fontSize: 19,
                    isBody: true,
                    color: AppColors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
              addVerticalSpacing(context, 40),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: AppText(
                    text:
                        "You agree that we may automatically update that software, and these terms will apply to any updates. We are a technology company. We do not own, operate, or maintain any hospital facility, and we do not provide health services.",
                    textAlign: TextAlign.start,
                    fontSize: 19,
                    isBody: true,
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
