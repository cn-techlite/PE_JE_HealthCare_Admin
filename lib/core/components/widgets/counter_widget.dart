import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key, required this.icon, required this.onTap});

  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.grey1.withAlpha(150)),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          icon,
          color: AppColors.green,
        ),
      ),
    );
  }
}
