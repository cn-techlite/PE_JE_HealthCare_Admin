// ignore_for_file: prefer_const_constructors, constant_identifier_names, annotate_overrides, overridden_fields, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/colors.dart';
import '../utils/helper_functions.dart';
import '../utils/typography.dart';
import 'app_text.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function? toggleEye;
  final TextInputType? keyboard;
  final String? init;
  final bool isPassword;
  final bool readOnly;
  final Color? isPasswordColor;
  //final bool showObscureText;
  final bool obscureText;
  final Color? styleColor;

  final String? labelText;
  final String? errorText;
  final dynamic maxLines;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? hintStyleColor;
  final Color? textColor;
  final Color? labelColor;
  final String? inputIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Key? key;
  final IconData? prefixIcon;
  final bool enable;
  final TextEditingController? controller;
  //final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  //final bool alignLabelWithHint;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Function onTap;
  final double? borderRadius;
  const Input(
      {this.hintText,
      this.labelColor,
      this.fillColor,
      this.textColor,
      this.borderRadius,
      this.validator,
      this.readOnly = false,
      this.hintColor,
      required this.onSaved,
      required this.toggleEye,
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      //this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor,
      this.hintStyleColor,
      this.enable = true,
      this.labelText,
      this.maxLines = 1,
      this.borderColor = Colors.grey,
      required this.onChanged,
      this.prefix,
      this.suffix,
      this.key,
      this.controller,
      this.focusNode,
      this.prefixIcon,

      ///this.alignLabelWithHint,
      this.floatingLabelBehavior,
      required this.onTap,
      this.errorText,
      this.inputIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      controller: controller,
      key: key,
      readOnly: readOnly,
      enabled: enable,
      onSaved: onSaved!,
      onChanged: onChanged!,
      validator: validator!,
      obscureText: obscureText,
      initialValue: init,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        suffixIcon: suffix,
        fillColor: !enable
            ? fillColor ?? Color(0xFFeeeeee)
            : fillColor ?? Colors.transparent,
        // fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintStyleColor ?? Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }
}

class PlainInput extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function? toggleEye;
  final TextInputType? keyboard;
  final String? init;
  final bool isPassword;
  final Color? isPasswordColor;
  //final bool showObscureText;
  final bool obscureText;
  final Color? styleColor;
  final Color? hintStyleColor;
  final bool enable;
  final String? labelText;
  final String? errorText;
  final dynamic maxLines;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? labelColor;
  final String? inputIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Key? key;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  //final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  //final bool alignLabelWithHint;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Function onTap;
  final double? borderRadius;
  final bool readOnly;
  final int? maxLength;
  const PlainInput(
      {this.hintText,
      this.labelColor,
      this.fillColor,
      this.textColor,
      this.borderRadius,
      this.validator,
      this.hintColor,
      required this.onSaved,
      required this.toggleEye,
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      //this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor,
      this.hintStyleColor,
      this.enable = true,
      this.labelText,
      this.maxLines = 1,
      this.borderColor = Colors.grey,
      required this.onChanged,
      this.prefix,
      this.suffix,
      this.key,
      this.controller,
      this.focusNode,
      this.prefixIcon,

      ///this.alignLabelWithHint,
      this.floatingLabelBehavior,
      required this.onTap,
      this.errorText,
      this.inputIcon,
      this.readOnly = false,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTypography.dynamicStyle(
        fontSize: fontSized(context, 22),
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      keyboardType: keyboard,
      controller: controller,
      focusNode: focusNode,
      key: key,
      enabled: enable,
      onSaved: onSaved!,
      onChanged: onChanged!,
      validator: validator!,
      obscureText: obscureText,
      initialValue: init,
      readOnly: readOnly,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        //suffixIcon: suffix,
        fillColor: !enable
            ? fillColor ?? Color(0xFFeeeeee)
            : fillColor ?? Colors.transparent,
        // fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintStyleColor ?? Colors.grey,
          fontSize: fontSized(context, 22),
        ),
      ),
    );
  }
}

class DescriptionInput extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function? toggleEye;
  final TextInputType? keyboard;
  final String? init;
  final bool isPassword;
  final Color? isPasswordColor;
  //final bool showObscureText;
  final bool obscureText;
  final Color? styleColor;
  final Color? hintStyleColor;
  final bool enable;
  final String? labelText;
  final String? errorText;
  final dynamic maxLines;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? labelColor;
  final String? inputIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Key? key;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  //final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  //final bool alignLabelWithHint;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Function onTap;
  final double? borderRadius;
  final int? maxLength;
  const DescriptionInput(
      {this.hintText,
      this.labelColor,
      this.fillColor,
      this.textColor,
      this.borderRadius,
      this.validator,
      this.hintColor,
      required this.onSaved,
      required this.toggleEye,
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      //this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor,
      this.hintStyleColor,
      this.enable = true,
      this.labelText,
      this.maxLines = 1,
      this.borderColor = Colors.grey,
      required this.onChanged,
      this.prefix,
      this.suffix,
      this.key,
      this.controller,
      this.focusNode,
      this.prefixIcon,

      ///this.alignLabelWithHint,
      this.floatingLabelBehavior,
      required this.onTap,
      this.errorText,
      this.inputIcon,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTypography.dynamicStyle(
        fontSize: fontSized(context, 22),
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      keyboardType: keyboard,
      controller: controller,
      key: key,
      enabled: enable,
      onSaved: onSaved!,
      onChanged: onChanged!,
      validator: validator!,
      obscureText: obscureText,
      initialValue: init,
      maxLines: 10,
      minLines: 6,
      maxLength: maxLength,
      focusNode: focusNode,
      decoration: InputDecoration(
        // prefixIcon: Icon(prefixIcon),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(2),
        //   borderSide: BorderSide(
        //     color: Colors.grey,
        //     width: 1.0,
        //   ),
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        //suffixIcon: suffix,
        fillColor: !enable
            ? fillColor ?? Color(0xFFeeeeee)
            : fillColor ?? Colors.transparent,
        // fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintStyleColor ?? Colors.grey,
          fontSize: fontSized(context, 22),
        ),
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  const DateWidget({super.key, this.controller, this.onChanged, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      onChanged: onChanged!,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.calendar_month),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: fontSized(context, 22),
        ),
      ),
      onTap: () async {
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2015),
          lastDate: DateTime(2025),
        ).then((selectedDate) {
          if (selectedDate != null) {
            controller!.text = DateFormat('yyyy-MM-dd').format(selectedDate);
          }
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter date.';
        }
        return null;
      },
    );
  }
}

class SerachInput extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function? toggleEye;
  final TextInputType? keyboard;
  final String? init;
  final bool isPassword;
  final Color? isPasswordColor;
  //final bool showObscureText;
  final bool obscureText;
  final Color? styleColor;
  final Color? hintStyleColor;
  final bool enable;
  final String? labelText;
  final String? errorText;
  final dynamic maxLines;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? labelColor;
  final String? inputIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Key? key;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  //final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  //final bool alignLabelWithHint;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Function onTap;
  final double? borderRadius;
  const SerachInput(
      {this.hintText,
      this.labelColor,
      this.fillColor,
      this.textColor,
      this.borderRadius,
      this.validator,
      this.hintColor,
      required this.onSaved,
      required this.toggleEye,
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      //this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor,
      this.hintStyleColor,
      this.enable = true,
      this.labelText,
      this.maxLines = 1,
      this.borderColor = Colors.white,
      required this.onChanged,
      this.prefix,
      this.suffix,
      this.key,
      this.controller,
      this.focusNode,
      this.prefixIcon,

      ///this.alignLabelWithHint,
      this.floatingLabelBehavior,
      required this.onTap,
      this.errorText,
      this.inputIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.white,
      focusNode: focusNode,
      onTap: onTap as void Function()?,
      keyboardType: keyboard,
      controller: controller,
      key: key,
      enabled: enable,
      onSaved: onSaved!,
      onChanged: onChanged!,
      validator: validator!,
      obscureText: obscureText,
      initialValue: init,
      style: TextStyle(
        color: styleColor ?? AppColors.white,
        fontSize: fontSized(context, 22),
      ),
      decoration: InputDecoration(
        prefixIcon: prefix,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),

        fillColor: !enable
            ? fillColor ?? Color(0xFFeeeeee)
            : fillColor ?? Colors.transparent,
        // fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: AppColors.white,
            width: 2.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintStyleColor ?? Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function? toggleEye;
  final TextInputType? keyboard;
  final String? init;
  final bool isPassword;
  final Color? isPasswordColor;
  //final bool showObscureText;
  final bool obscureText;
  final Color? styleColor;
  final Color? hintStyleColor;
  final bool enable;
  final String? labelText;
  final String? errorText;
  final dynamic maxLines;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? labelColor;
  final String? inputIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Key? key;
  final IconData? prefixIcon;
  final Widget? passwordIcon;
  final TextEditingController? controller;
  //final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  //final bool alignLabelWithHint;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Function onTap;
  final double? borderRadius;
  const PasswordInput(
      {this.hintText,
      this.labelColor,
      this.fillColor,
      this.textColor,
      this.borderRadius,
      this.validator,
      this.hintColor,
      required this.onSaved,
      required this.toggleEye,
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      //this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor,
      this.hintStyleColor,
      this.enable = true,
      this.labelText,
      this.maxLines = 1,
      this.borderColor = Colors.grey,
      required this.onChanged,
      this.prefix,
      this.suffix,
      this.key,
      this.controller,
      this.focusNode,
      this.prefixIcon,

      ///this.alignLabelWithHint,
      this.floatingLabelBehavior,
      required this.onTap,
      this.errorText,
      this.inputIcon,
      this.passwordIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: key,
      enabled: enable,
      onSaved: onSaved!,
      validator: validator!,
      onChanged: onChanged!,
      obscureText: obscureText,
      initialValue: init,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: passwordIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        //suffixIcon: suffix,
        fillColor: !enable
            ? fillColor ?? Color(0xFFeeeeee)
            : fillColor ?? Colors.transparent,
        // fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintStyleColor ?? Colors.grey,
          fontSize: fontSized(context, 22),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.textInputType,
    this.hintText,
    this.label,
    this.suffix,
    required this.labelName,
    this.autofocus = false,
    this.isMultipleLines = false,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.hintColor,
    this.hintStyleColor,
    this.prefixIcon,
    this.enable,
    this.focusNode,
  });

  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? label;
  final String? hintText;
  final Widget? suffix;
  final Color? fillColor;
  final Color? hintColor;
  final Color? hintStyleColor;
  final IconData? prefixIcon;
  final bool? enable;
  final bool isMultipleLines;
  final bool autofocus;
  final String? Function(String?)? validator;
  final String labelName;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: AppTypography.buttonSmall().copyWith(
              fontWeight: FontWeight.w500, fontSize: fontSized(context, 22)),
        ),
        addVerticalSpacing(context, 52),
        TextFormField(
          style: AppTypography.dynamicStyle(
            fontSize: fontSized(context, 22),
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          cursorColor: AppColors.primary,
          maxLines: isMultipleLines ? 5 : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: textInputType,
          autofocus: autofocus,
          textInputAction: textInputAction ?? TextInputAction.next,
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            suffixIcon: suffix,
            fillColor: !enable!
                ? fillColor ?? Color(0xFFeeeeee)
                : fillColor ?? Colors.transparent,
            // fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1.0,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintStyleColor ?? Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    required this.text,
    required this.onChanged,
    required this.hintText,
    super.key,
  });

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              )),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : Icon(Icons.search, color: style.color),
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}

enum KeyboardType { NUMBER, TEXT, EMAIL, PHONE }
