import 'package:pe_je_healthcare_admin/core/components/utils/app_buttons.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
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
                  addVerticalSpacing(context, 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                          text: "First Name",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      PlainInput(
                        controller: controller.firstName,
                        hintText: "First Name",
                        //  prefixIcon: Icons.person,
                        labelText: "First Name",
                        focusNode: controller.firstNameFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty Field';
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
                          text: "Last Name",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      PlainInput(
                        controller: controller.lastName,
                        hintText: "Last Name",
                        //  prefixIcon: Icons.person,
                        labelText: "Last Name",
                        focusNode: controller.lastNameFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty Field';
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
                      Text(
                        "Email Address",
                        style: TextStyle(
                            fontSize: fontSized(context, 19),
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter"),
                      ),
                      PlainInput(
                        controller: controller.email,
                        hintText: "Your Email",
                        //  prefixIcon: Icons.person,
                        labelText: "Email",
                        focusNode: controller.emailFocusNode,
                        keyboard: TextInputType.emailAddress,
                        validator: (value) {
                          String trimValue = controller.email.text.trim();
                          if (EmailValidator.validate(trimValue) == false) {
                            return 'enter a valid email';
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
                          text: "Address",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      PlainInput(
                        controller: controller.address,
                        hintText: "Address",
                        //   prefixIcon: Icons.person,
                        labelText: "Address",
                        focusNode: controller.addressFocusNode,
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
                          text: "Communication",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      DescriptionInput(
                        controller: controller.communication,
                        hintText: "Communication",
                        //   prefixIcon: Icons.person,
                        labelText: "Communication",
                        focusNode: controller.communicationFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty Field';
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
                          text: "Mobilization",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      DescriptionInput(
                        controller: controller.mobilization,
                        hintText: "Mobilization",
                        //   prefixIcon: Icons.person,
                        labelText: "Mobilization",
                        focusNode: controller.mobilizationFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty State';
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
                          text: "Washing And Dressing",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      DescriptionInput(
                        controller: controller.washingAndDressing,
                        hintText: "Washing And Dressing",
                        //   prefixIcon: Icons.person,
                        labelText: "Washing And Dressing",
                        focusNode: controller.washingAndDressingFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty Field';
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
                          text: "Medication",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      DescriptionInput(
                        controller: controller.medication,
                        hintText: "Medication",
                        //   prefixIcon: Icons.person,
                        labelText: "Medication",
                        focusNode: controller.medicationFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty Field';
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
                          text: "Eyesight",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      DescriptionInput(
                        controller: controller.eyesight,
                        hintText: "Eyesight",
                        //   prefixIcon: Icons.person,
                        labelText: "Eyesight",
                        focusNode: controller.eyesightFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty Field';
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
                          text: "Fall Risk",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      DescriptionInput(
                        controller: controller.fallRisk,
                        hintText: "Fall Risk",
                        //   prefixIcon: Icons.person,
                        labelText: "Fall Risk",
                        focusNode: controller.fallRiskFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty Field';
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
                          text: "Food And Fluid",
                          textAlign: TextAlign.center,
                          fontSize: 18,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      DescriptionInput(
                        controller: controller.foodAndFluid,
                        hintText: "Food And Fluid",
                        //   prefixIcon: Icons.person,
                        labelText: "Food And Fluid",
                        focusNode: controller.foodAndFluidFocusNode,
                        keyboard: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Empty Field';
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
