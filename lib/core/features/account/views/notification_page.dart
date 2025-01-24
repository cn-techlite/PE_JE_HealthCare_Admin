// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/helpers/globals.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/notification_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/states/home_provider.dart';

import '../../../components/utils/colors.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<NotificationsPage> {
  List<NotificationResponseModel> notifications = [];

  @override
  void initState() {
    super.initState();
    final station = ref.read(homeProvider.notifier);
    station.getAllNotificationData();
    station.notifications;
    var tip = station.notifications
        .where((element) => element.userId == globals.userId)
        .toList();
    notifications.addAll(tip);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<NotificationResponseModel> getOrdered(
      List<NotificationResponseModel> model) {
    List<NotificationResponseModel> mostActive = model;
    mostActive.sort((a, b) {
      return b.createdAt!.compareTo(a.createdAt!);
    });
    return mostActive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const AppText(
            text: "Notifications",
            textAlign: TextAlign.center,
            fontSize: 20,
            isBody: false,
            color: AppColors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 20,
            )),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: getOrdered(notifications).isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: getOrdered(notifications).length,
                  itemBuilder: (BuildContext context, int index) {
                    final data3 = getOrdered(notifications)[index];
                    DateTime dt2 = DateTime.parse(data3.createdAt.toString());
                    String date = DateFormat("E, MMM d").format(dt2);
                    String time = DateFormat("hh:mm").format(dt2);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color: AppColors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    // navigateToRoute(
                                    //     context,
                                    //     MagazineDetailsPage(
                                    //       magazineModel: post[index],
                                    //     ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AppText(
                                            isBody: false,
                                            text: "${data3.title}",
                                            textAlign: TextAlign.start,
                                            fontSize: 15,
                                            color: AppColors.black,
                                            fontStyle: FontStyle.normal,
                                            maxLines: 1,
                                            fontWeight: FontWeight.bold),
                                        AppText(
                                            isBody: true,
                                            text: "${data3.body}",
                                            textAlign: TextAlign.start,
                                            fontSize: 19,
                                            color: AppColors.black,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400),
                                        addVerticalSpacing(context, 55),
                                        AppText(
                                            isBody: true,
                                            text: "$date $time",
                                            textAlign: TextAlign.start,
                                            fontSize: 25,
                                            color: AppColors.green,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                  )),
                              const Divider(
                                thickness: 1.5,
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpacing(context, 35)
                      ],
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/empty.png",
                        width: 100,
                        height: 100,
                      ),
                      addVerticalSpacing(context, 50),
                      const AppText(
                          isBody: false,
                          text: "Nothing to show here",
                          textAlign: TextAlign.start,
                          fontSize: 25,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                      const AppText(
                          isBody: true,
                          text: "There is no notification yet",
                          textAlign: TextAlign.center,
                          fontSize: 25,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
