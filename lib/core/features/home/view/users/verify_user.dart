// ignore_for_file: library_private_types_in_public_api

import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';
import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/users_response_model.dart';

class ViewUserWorkHistory extends ConsumerStatefulWidget {
  const ViewUserWorkHistory({
    super.key,
    required this.userChat,
  });
  final UserResponseModel userChat;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<ViewUserWorkHistory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldMessengerState>();

    // var user = accountProviderd.userData;
    return Scaffold(
      key: key,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        // toolbarHeight: 8.h,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const AppText(
            text: "Work History",
            textAlign: TextAlign.center,
            fontSize: 15,
            isBody: false,
            color: AppColors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [],
          )),
    );
  }
}
