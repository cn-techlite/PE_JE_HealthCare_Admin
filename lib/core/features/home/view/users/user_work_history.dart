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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Scaffold(
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
              isBody: false,
              fontSize: 15,
              color: AppColors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        body: widget.userChat.workExperienceHistory!.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 0),
                      child: Image.asset(
                        "assets/images/logo_path.png",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const AppText(
                        text: "Nothing to show here",
                        textAlign: TextAlign.start,
                        fontSize: 21,
                        isBody: true,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    const AppText(
                        text: "This user has not added any work history yet",
                        textAlign: TextAlign.center,
                        fontSize: 26,
                        isBody: true,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  ],
                ),
              )
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(color: AppColors.black),
                  columns: [
                    DataColumn(
                      label: Text('Employer Name',
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 15))),
                    ),
                    DataColumn(
                      label: Text('Position Held',
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 15))),
                    ),
                    DataColumn(
                      label: Text('Work Start Date',
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 15))),
                    ),
                    DataColumn(
                      label: Text('Work End Date',
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: fontSized(context, 15))),
                    ),
                  ],
                  rows: widget.userChat.workExperienceHistory!
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.employerName!)),
                            DataCell(Text(e.positionHeld!)),
                            DataCell(Text(e.workStartDate!)),
                            DataCell(Text(e.workEndDate!)),
                          ]))
                      .toList(),
                )),
      ),
    );
  }
}
