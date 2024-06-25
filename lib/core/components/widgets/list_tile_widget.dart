import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/users_response_model.dart';

import '../utils/package_export.dart';

class ListTileWidget extends StatelessWidget {
  final UserResponseModel user;
  final bool isNative;
  final bool isSelected;
  final ValueChanged<UserResponseModel> onSelectedUser;

  const ListTileWidget({
    super.key,
    required this.user,
    required this.isNative,
    required this.isSelected,
    required this.onSelectedUser,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColor;

    return ListTile(
      onTap: () => onSelectedUser(user),
      // leading: FlagWidget(code: user.code),
      title: AppText(
        text: isNative ? user.firstName.toString() : user.lastName.toString(),
        textAlign: TextAlign.start,
        fontSize: 18,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      ),
      trailing:
          isSelected ? Icon(Icons.check, color: selectedColor, size: 26) : null,
    );
  }
}
