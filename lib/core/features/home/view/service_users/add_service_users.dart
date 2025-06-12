import 'package:pe_je_healthcare_admin/core/components/utils/app_buttons.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/date_picker.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/input.dart';
import 'package:pe_je_healthcare_admin/core/features/home/controller/add_service_user.dart';

import '../../../../components/architecture/mvc.dart';

class AddServiceUserScreenView extends StatelessView<AddServiceUserScreen,
    AddServiceUserScreenController> {
  const AddServiceUserScreenView(super.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
            text: "Add Service User",
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
                  Container(
                    padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const AppText(
                            text: "Add User Image",
                            isBody: false,
                            textAlign: TextAlign.start,
                            fontSize: 22,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        Container(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            width: MediaQuery.of(context).size.width,
                            // alignment: Alignment.topCenter,
                            child: controller.pickedCv2 == null
                                ? InkWell(
                                    onTap: () {
                                      controller.handleCVUpload2();
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1.0, color: Colors.grey),
                                        ),
                                        child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 43,
                                                bottom: 43),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.plus,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                AppText(
                                                    text: "Upload Image",
                                                    textAlign: TextAlign.start,
                                                    isBody: true,
                                                    fontSize: 15,
                                                    color: AppColors.black,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                Icon(
                                                  Icons.image,
                                                  size: 20,
                                                ),
                                              ],
                                            ))),
                                  )
                                : Stack(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 5, right: 5),
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          border: Border.all(
                                              width: 1.0, color: Colors.grey),
                                        ),
                                        child: Image.file(
                                          controller.pickedCv2!,
                                          //  width: double.infinity ,
                                          height: 200,
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high,
                                        ),
                                      ),
                                      Positioned(
                                          right: 5.0,
                                          child: InkWell(
                                            child: const Icon(
                                                Icons.remove_circle,
                                                size: 15,
                                                color: Colors.red),
                                            onTap: () {
                                              // controller.remove();
                                            },
                                          ))
                                    ],
                                  )),
                      ],
                    ),
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
                          text: "Address",
                          textAlign: TextAlign.center,
                          isBody: true,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: 'Address',
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        textController: controller.address,
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
                          text: "Date of Birth",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Date of Birth",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        readOnly: true,
                        textController: controller.dateOfBirth,
                        onTap: () async {
                          final result = await pickDateTime(
                            context: context,
                            showDate: true,
                            showTime: false,
                          );
                          if (result != null) {
                            controller.dateOfBirthOnChanged(result);
                          }
                        },
                        onChanged: (String? value) {
                          controller.dateOfBirthOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Communication",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Communication",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        isNotePad: true,
                        textController: controller.communication,
                        onChanged: (String? value) {
                          controller.communicationOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Mobilization",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Mobilization",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        isNotePad: true,
                        textController: controller.mobilization,
                        onChanged: (String? value) {
                          controller.mobilizationOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Washing And Dressing",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Washing and Dressing",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        isNotePad: true,
                        textController: controller.washingAndDressing,
                        onChanged: (String? value) {
                          controller.washingAndDressingOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Medication",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Medication",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        isNotePad: true,
                        textController: controller.medication,
                        onChanged: (String? value) {
                          controller.medicationOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Eyesight",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Eyesight",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        isNotePad: true,
                        textController: controller.eyesight,
                        onChanged: (String? value) {
                          controller.eyesightOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Fall Risk",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Fall Risk",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        isNotePad: true,
                        textController: controller.fallRisk,
                        onChanged: (String? value) {
                          controller.fallRiskOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "Food And Fluid",
                          isBody: true,
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      GlobalTextField(
                        fieldName: "Food and Fluid",
                        keyBoardType: TextInputType.name,
                        obscureText: false,
                        removeSpace: false,
                        isNotePad: true,
                        textController: controller.foodAndFluid,
                        onChanged: (String? value) {
                          controller.foodAndFluidOnChanged(value!);
                        },
                      ),
                    ],
                  ),
                  addVerticalSpacing(context, 5),
                  appButton("Continue", getScreenWidth(context), () {
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
