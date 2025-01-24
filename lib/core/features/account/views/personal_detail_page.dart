// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';

import '../../../components/utils/app_buttons.dart';
import '../../../components/utils/colors.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';
import '../../../components/widgets/input.dart';
import '../model/user_response_model.dart';
import '../states/account_provider.dart';

class AccountDetailsPage extends ConsumerStatefulWidget {
  const AccountDetailsPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<AccountDetailsPage> {
  String selectedCarType = "";
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _phoneNo;

  bool isProcessing = false;

  bool loading = false;
  final _focusFirstName = FocusNode();
  final _focusLastName = FocusNode();
  final _focusPhoneNo = FocusNode();

  late AccountNotifier accountProviders;
  late RegisterResponseModel globals;

  bool isSwitchedHoliday = false;

  @override
  void initState() {
    _phoneNo = TextEditingController();
    _firstName = TextEditingController();
    _lastName = TextEditingController();

    accountProviders = ref.read(accountProvider.notifier);
    accountProviders.getAccount();
    setState(() {
      globals = accountProviders.userData!;
    });
    super.initState();
  }

  @override
  void dispose() {
    _phoneNo.dispose();
    _firstName.dispose();
    _lastName.dispose();
    super.dispose();
  }

  Widget buildTop(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpacing(context, 40),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: ExpansionTile(
                backgroundColor: AppColors.white,
                collapsedBackgroundColor: AppColors.white,
                collapsedIconColor: AppColors.primary,
                iconColor: AppColors.primary,
                textColor: AppColors.primary,
                collapsedTextColor: AppColors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                        text: "Name",
                        textAlign: TextAlign.start,
                        fontSize: 23,
                        isBody: true,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    AppText(
                        text: "${globals.firstName} ${globals.surName}",
                        textAlign: TextAlign.start,
                        fontSize: 23,
                        isBody: true,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                children: [
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        addVerticalSpacing(context, 5),
                        Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First Name",
                                style: TextStyle(
                                    fontSize: fontSized(context, 22),
                                    color: AppColors.black,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700),
                              ),
                              PlainInput(
                                controller:
                                    globals.firstName.toString().isNotEmpty
                                        ? TextEditingController(
                                            text: globals.firstName)
                                        : _firstName,
                                hintText: "First Name",
                                // prefixIcon: Icons.person,
                                labelText: "First Name",
                                keyboard: TextInputType.text,
                                focusNode: _focusFirstName,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'enter First Name';
                                  }
                                  return null;
                                },
                                toggleEye: () {},
                                onSaved: (value) {},
                                onTap: () {},
                                onChanged: (String? value) {},
                              ),
                              addVerticalSpacing(context, 35),
                              Text(
                                "Last Name",
                                style: TextStyle(
                                    fontSize: fontSized(context, 22),
                                    color: AppColors.black,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700),
                              ),
                              PlainInput(
                                controller:
                                    globals.surName.toString().isNotEmpty
                                        ? TextEditingController(
                                            text: globals.surName)
                                        : _lastName,
                                hintText: "Last Name",
                                // prefixIcon: Icons.person,
                                labelText: "Last Name",
                                keyboard: TextInputType.text,
                                focusNode: _focusLastName,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'enter Last Name';
                                  }
                                  return null;
                                },
                                toggleEye: () {},
                                onSaved: (value) {},
                                onTap: () {},
                                onChanged: (String? value) {},
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpacing(context, 30),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 35.0, right: 35.0),
                          child: appButton2(
                              onPressed: () async {
                                _focusPhoneNo.unfocus();
                                if (_formkey.currentState!.validate()) {
                                  accountProviders.updateUser(
                                    context: context,
                                    firstName: _firstName.text.trim(),
                                    lastName: _lastName.text.trim(),
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              child: const AppText(
                                  text: "Update",
                                  textAlign: TextAlign.center,
                                  fontSize: 23,
                                  isBody: true,
                                  color: AppColors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: const AppText(
                  text: "Email",
                  textAlign: TextAlign.start,
                  fontSize: 23,
                  isBody: true,
                  color: AppColors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
              subtitle: AppText(
                  text: "${globals.email}",
                  textAlign: TextAlign.start,
                  fontSize: 23,
                  isBody: true,
                  color: AppColors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
                size: 15,
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: ExpansionTile(
                backgroundColor: AppColors.white,
                collapsedBackgroundColor: AppColors.white,
                collapsedIconColor: AppColors.primary,
                iconColor: AppColors.primary,
                textColor: AppColors.primary,
                collapsedTextColor: AppColors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                        text: "Phone Number",
                        textAlign: TextAlign.start,
                        isBody: true,
                        fontSize: 23,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    AppText(
                        text: "${globals.phoneNo}",
                        isBody: true,
                        textAlign: TextAlign.start,
                        fontSize: 23,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                children: [
                  Container(
                    color: AppColors.white,
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        addVerticalSpacing(context, 55),
                        Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: fontSized(context, 22),
                                    color: AppColors.black,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700),
                              ),
                              PlainInput(
                                controller:
                                    globals.phoneNo.toString().isNotEmpty
                                        ? TextEditingController(
                                            text: globals.phoneNo)
                                        : _phoneNo,
                                hintText: "Phone Number",
                                // prefixIcon: Icons.person,
                                labelText: "Phone Number",
                                keyboard: TextInputType.phone,
                                focusNode: _focusPhoneNo,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'enter Phone Number';
                                  }
                                  return null;
                                },
                                toggleEye: () {},
                                onSaved: (value) {},
                                onTap: () {},
                                onChanged: (String? value) {},
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpacing(context, 30),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 35.0, right: 35.0),
                          child: appButton2(
                              onPressed: () async {
                                _focusPhoneNo.unfocus();
                                if (_formkey.currentState!.validate()) {
                                  accountProviders.updateUser(
                                      context: context,
                                      phoneNo: _phoneNo.text.trim());
                                  Navigator.pop(context);
                                }
                              },
                              child: const AppText(
                                  text: "Update",
                                  textAlign: TextAlign.center,
                                  fontSize: 23,
                                  isBody: true,
                                  color: AppColors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    //  final key = GlobalKey<ScaffoldMessengerState>();

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            // toolbarHeight: 8.h,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            // ignore: prefer_const_constructors
            title: AppText(
                text: "Profile Updates",
                textAlign: TextAlign.center,
                fontSize: 19,
                isBody: true,
                color: AppColors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600),
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
          body: buildTop(context),
        ));
  }
}
