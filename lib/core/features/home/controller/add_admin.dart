// ignore_for_file: use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/utils/constants.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/add_admin_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/services/home_service.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/admin/add_admin.dart';
import 'package:pe_je_healthcare_admin/core/features/home_screen.dart';

import '../../../components/widgets/custom_snackbar.dart';

class AddAdminScreen extends ConsumerStatefulWidget {
  const AddAdminScreen({
    super.key,
  });
  @override
  ConsumerState<AddAdminScreen> createState() => AddAdminScreenController();
}

class AddAdminScreenController extends ConsumerState<AddAdminScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController address;
  late TextEditingController password;
  late TextEditingController sex;
  late TextEditingController staffCode;
  late TextEditingController state;
  late TextEditingController locality;
  late TextEditingController phoneNo;
  late TextEditingController branch;
  late TextEditingController adminType;

  String imageProfile = "";

  bool saveButtonPressed = false;
  bool isLoading = false;
  List<String> adminList = ['Super_Admin', 'Admin'];
  @override
  void initState() {
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    password = TextEditingController();
    sex = TextEditingController();
    staffCode = TextEditingController();
    state = TextEditingController();
    locality = TextEditingController();
    phoneNo = TextEditingController();
    branch = TextEditingController();
    adminType = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    address.dispose();
    password.dispose();
    sex.dispose();
    staffCode.dispose();
    state.dispose();
    locality.dispose();
    phoneNo.dispose();
    branch.dispose();
    adminType.dispose();
  }

  final format = DateFormat("dd MMM, yyyy");

  String isFirstNameChanged = "";
  String isLastNameChanged = "";
  String isEmailChanged = "";
  String isAddressChanged = "";
  String isPasswordChanged = "";
  String isSexChanged = "";
  String isStaffCodeChanged = "";
  String isStateChanged = "";
  String isLocalityChanged = "";
  String isPhoneNoChanged = "";
  String isBranchChanged = "";
  String isAdminTypeChanged = "";
  String selectedCountryCode = "+44"; // Default country code
  firstNameOnChanged(String value) {
    setState(() {
      isFirstNameChanged = value;
    });
  }

  lastNameOnChanged(String value) {
    setState(() {
      isLastNameChanged = value;
    });
  }

  emailOnChanged(String value) {
    setState(() {
      isEmailChanged = value;
    });
  }

  addressOnChanged(String value) {
    setState(() {
      isAddressChanged = value;
    });
  }

  passwordOnChanged(String value) {
    setState(() {
      isPasswordChanged = value;
    });
  }

  sexOnChanged(String value) {
    setState(() {
      isSexChanged = value;
    });
  }

  staffCodeOnChanged(String value) {
    setState(() {
      isStaffCodeChanged = value;
    });
  }

  stateOnChanged(String value) {
    setState(() {
      isStateChanged = value;
    });
  }

  localityOnChanged(String value) {
    setState(() {
      isLocalityChanged = value;
    });
  }

  phoneNoOnChanged(String value) {
    setState(() {
      isPhoneNoChanged = value;
    });
  }

  branchOnChanged(String value) {
    setState(() {
      isBranchChanged = value;
    });
  }

  adminTypeOnChanged(String value) {
    setState(() {
      isAdminTypeChanged = value;
      adminType.text = value;
    });
  }

  phoneNoCountryCodeChanged(String value) {
    setState(() {
      selectedCountryCode = value;
    });
    printData("identifier", isPhoneNoChanged);
  }

  userRegister() async {
    setState(() {
      saveButtonPressed = true;
    });
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      var add = AddAdminModel(
          adminType: adminType.text.trim(),
          firstName: firstName.text.trim(),
          surName: lastName.text.trim(),
          email: email.text.trim(),
          password: password.text.trim(),
          sex: sex.text.trim(),
          staffCode: staffCode.text.trim(),
          phoneNo: "$selectedCountryCode${phoneNo.text.trim()}",
          state: state.text.trim(),
          locality: locality.text.trim(),
          address: address.text.trim(),
          branch: branch.text.trim());

      var response = await HomeServices().addAdmin(model: add);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          isLoading = false;
        });
        navigateAndRemoveUntilRoute(context, const HomeScreenPage());
      } else {
        setState(() {
          isLoading = false;
        });
        showCustomSnackbar(context,
            title: "Master User",
            content: response.body,
            type: SnackbarType.error,
            isTopPosition: false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AddAdminScreenView(this);
  }
}
