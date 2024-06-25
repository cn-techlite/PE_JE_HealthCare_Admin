import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';

import '../utils/colors.dart';
import '../utils/package_export.dart';
import '../utils/typography.dart';

class DropdownForApi extends StatelessWidget {
  const DropdownForApi({
    super.key,
    required this.hint,
    required this.selected,
    required this.itemList,
    this.selectDrop,
    required this.selectedItem,
  });

  final String hint;
  final String selected;
  final String? selectedItem;
  final List<dynamic> itemList;
  final Function(String?)? selectDrop;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: AppTypography.dynamicStyle(
        fontSize: fontSized(context, 22),
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      validator: (value) => value == null ? 'field required' : null,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        border: const OutlineInputBorder(
          gapPadding: 1.0,
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
        ),
      ),
      hint: Text(
        hint,
        style: AppTypography.dynamicStyle(
          fontSize: fontSized(context, 22),
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
      value: selectedItem, //controller.selectedCategory,
      onChanged: (value) {
        selectDrop!(value);
      },
      items: itemList.map((category) {
        return DropdownMenuItem<String>(
          value: category.title,
          child: Text(
            category.title,
            style: AppTypography.dynamicStyle(
              fontSize: fontSized(context, 22),
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DropdownFor extends StatelessWidget {
  const DropdownFor({
    super.key,
    required this.hint,
    // required this.selected,
    required this.itemList,
    this.selectDrop,
    required this.selectedItem,
    this.validator,
  });

  final String hint;
  //final String selected;
  final String? selectedItem;
  final List<String> itemList;
  final Function(String?)? selectDrop;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<String>(
        style: AppTypography.dynamicStyle(
          fontSize: fontSized(context, 22),
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        validator: (value) => value == null ? 'field required' : null,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          border: const OutlineInputBorder(
            gapPadding: 1.0,
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
          ),
        ),
        hint: Text(
          hint,
          style: AppTypography.dynamicStyle(
            fontSize: fontSized(context, 22),
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        // buttonStyleData: ButtonStyleData(
        //   height: 60,
        //   padding: const EdgeInsets.only(left: 10, right: 10),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(
        //       color: AppColors.grey,
        //     ),
        //     color: AppColors.white,
        //   ),
        // ),
        // menuItemStyleData: const MenuItemStyleData(
        //   height: 40,
        //   padding: EdgeInsets.only(left: 10, right: 10),
        // ),

        value: selectedItem, //controller.selectedCategory,
        onChanged: selectDrop!,
        items: itemList.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: AppTypography.dynamicStyle(
                fontSize: fontSized(context, 22),
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
