import 'package:country_code_picker/country_code_picker.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/app_buttons.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/drop_down_api.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/input.dart';
import 'package:pe_je_healthcare_admin/core/features/home/controller/add_admin.dart';

import '../../../../components/architecture/mvc.dart';

class AddAdminScreenView
    extends StatelessView<AddAdminScreen, AddAdminScreenController> {
  const AddAdminScreenView(super.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
            text: "Add Admin User",
            textAlign: TextAlign.center,
            isBody: false,
            fontSize: 15,
            color: AppColors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        leading: IconButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
        backgroundColor: AppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 14.0,
                right: 14.0,
                top: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: "Select Admin Type",
                        textAlign: TextAlign.center,
                        isBody: true,
                        fontSize: 18,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),
                      GlobalTextField(
                        fieldName: "Admin Type",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        readOnly: true,
                        textController: controller.adminType,
                        isEyeVisible: false,
                        suffix: Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          controller.adminTypeOnChanged(value!);
                        },
                        onTap: () async {
                          final selected = await BottomSheetSelector.show(
                            context: context,
                            options: controller.adminList,
                            title: "Choose Admin",
                          );
                          if (selected != null) {
                            controller.adminTypeOnChanged(selected);
                          }
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "First Name",
                          textAlign: TextAlign.center,
                          isBody: true,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: 'First Name',
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        textController: controller.firstName,
                        onChanged: (String? value) {
                          controller.firstNameOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Last Name",
                          textAlign: TextAlign.center,
                          isBody: true,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: 'Last Name',
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        textController: controller.lastName,
                        onChanged: (String? value) {
                          controller.lastNameOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email Address",
                        style: TextStyle(
                            fontSize: fontSized(context, 19),
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter"),
                      ),
                      GlobalTextField(
                        fieldName: 'Email',
                        keyBoardType: TextInputType.emailAddress,
                        obscureText: false,
                        textController: controller.email,
                        onChanged: (String? value) {
                          controller.emailOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Password",
                          textAlign: TextAlign.start,
                          isBody: true,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: 'Password',
                        obscureText: true,
                        isEyeVisible: true,
                        keyBoardType: TextInputType.visiblePassword,
                        textController: controller.password,
                        onChanged: (String? value) {
                          controller.passwordOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Sex",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Sex",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        textController: controller.sex,
                        onChanged: (String? value) {
                          controller.sexOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: "Phone No",
                        textAlign: TextAlign.center,
                        isBody: true,
                        fontSize: 18,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 50,
                        child: GlobalTextField(
                          fieldName: 'Phone Number',
                          prefix: CountryCodePicker(
                            padding: EdgeInsets.all(0),
                            flagWidth: 12,
                            showFlag: true,
                            onChanged: (CountryCode country) {
                              controller.phoneNoCountryCodeChanged(
                                country.dialCode!,
                              );
                            },
                            initialSelection: 'GB', // Default country
                            favorite: [
                              '+1',
                              '+91',
                              '+44',
                            ], // Prioritize commonly used codes
                            showCountryOnly: true,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          keyBoardType: TextInputType.phone,
                          obscureText: false,
                          maxLength: 10,
                          textController: controller.phoneNo,
                          onChanged: (String? value) {
                            controller.phoneNoOnChanged(value!);
                          },
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Staff Code",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Staff Code",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        textController: controller.staffCode,
                        onChanged: (String? value) {
                          controller.staffCodeOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Branch",
                          textAlign: TextAlign.center,
                          isBody: true,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: 'Branch',
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        textController: controller.branch,
                        onChanged: (String? value) {
                          controller.addressOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Address",
                          isBody: true,
                          textAlign: TextAlign.start,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Address",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        textController: controller.address,
                        onChanged: (String? value) {
                          controller.branchOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "City",
                          isBody: true,
                          textAlign: TextAlign.start,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "City",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        textController: controller.locality,
                        onChanged: (String? value) {
                          controller.localityOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "State",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "State",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        textController: controller.state,
                        onChanged: (String? value) {
                          controller.stateOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  controller.isAdminTypeChanged.isEmpty ||
                          controller.isFirstNameChanged.isEmpty ||
                          controller.isLastNameChanged.isEmpty ||
                          controller.isEmailChanged.isEmpty ||
                          controller.isPasswordChanged.isEmpty ||
                          controller.isPhoneNoChanged.isEmpty ||
                          controller.isSexChanged.isEmpty ||
                          controller.isStaffCodeChanged.isEmpty ||
                          controller.isBranchChanged.isEmpty ||
                          controller.isAddressChanged.isEmpty ||
                          controller.isLocalityChanged.isEmpty ||
                          controller.isStateChanged.isEmpty
                      ? appButton(
                          "Continue",
                          getScreenWidth(context),
                          () {},
                          AppColors.grey,
                          controller.isLoading,
                        )
                      : appButton("Continue", getScreenWidth(context), () {
                          controller.userRegister();
                        }, AppColors.primary, controller.isLoading),
                  addVerticalSpacing(context, 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
