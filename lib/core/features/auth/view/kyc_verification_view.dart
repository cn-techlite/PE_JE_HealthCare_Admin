import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/input.dart';

import '../../../components/architecture/mvc.dart';
import '../../../components/utils/app_buttons.dart';
import '../../../components/utils/colors.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/drop_down_api.dart';
import '../controller/kyc_verification_controller.dart';

class KYCVerificationScreenView extends StatelessView<KYCVerificationScreen,
    KYCVerificationScreenController> {
  const KYCVerificationScreenView(super.state, {super.key});
  @override
  Widget build(BuildContext context) {
    RegExp passValid = RegExp(
        r"([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z]\d{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y]\d{1,2})|(([A-Za-z]\d[A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y]\d[A-Za-z]?))))\s?\d[A-Za-z]{2})");
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
            text: "KYC Verification",
            textAlign: TextAlign.center,
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
                          text: "Phone No",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      PlainInput(
                        controller: controller.phoneNo,
                        hintText: "Your Number",
                        //  prefixIcon: Icons.person,
                        labelText: "Phone Number",
                        focusNode: controller.phoneNoFocusNode,
                        keyboard: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty Field';
                          } else if (value.length != 11) {
                            return 'Invalid Phone Number';
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
                  addVerticalSpacing(context, 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Select Sex",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      DropdownFor(
                        hint: "Sex",
                        itemList: controller.sexList,
                        selectDrop: (value) {
                          controller.selectSex(value!);
                        },
                        selectedItem: controller.sex,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a valid Sex';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Date of Birth",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      DateTimeField(
                        format: controller.format,
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              initialDate: currentValue ?? DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2200));
                          return date;
                        },
                        focusNode: controller.dateOfBirthFocusNode,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.dateOfBirth,
                        validator: (value) =>
                            value == null ? "Enter a valid Date" : null,
                        style: TextStyle(
                          fontSize: fontSized(context, 18),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            borderSide:
                                BorderSide(width: 1, color: AppColors.black),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.orange),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              borderSide:
                                  BorderSide(width: 1, color: AppColors.grey)),
                          errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.red)),
                          hintText: "Date of Birth",
                          hintStyle: TextStyle(
                              fontSize: fontSized(context, 18),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: AppColors.grey),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Address",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      PlainInput(
                        controller: controller.locationAddress,
                        hintText: "Address",
                        //   prefixIcon: Icons.person,
                        labelText: "Address",
                        focusNode: controller.locationAddressFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter an address';
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
                  addVerticalSpacing(context, 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Country",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      PlainInput(
                        controller: controller.countryLocation,
                        hintText: "Country",
                        //   prefixIcon: Icons.person,
                        labelText: "Country",
                        focusNode: controller.countryLocationFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter an country';
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
                  addVerticalSpacing(context, 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Postal Code",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      PlainInput(
                        controller: controller.addressPostCodes,
                        hintText: "Postal Code",
                        //   prefixIcon: Icons.person,
                        labelText: "Postal Code",
                        focusNode: controller.addressPostCodesFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty State';
                          } else if (!passValid.hasMatch(value)) {
                            return "Invalid PostCode";
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
                  addVerticalSpacing(context, 25),
                  appButton("Continue", getScreenWidth(context), () {
                    controller.userRegister();
                  }, AppColors.primary, controller.isLoading),
                  addVerticalSpacing(context, 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
