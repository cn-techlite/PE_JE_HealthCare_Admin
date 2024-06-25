// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:flutter/foundation.dart';

import '../../../components/utils/colors.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<NotificationsPage> {
  late int _totalNotifications;
  PushNotification? _notificationInfo;
  late final FirebaseMessaging _messaging;
  @override
  void initState() {
    _totalNotifications = 0;
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    });
    checkForInitialMessage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();
    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // ...
        if (_notificationInfo != null) {
          // For displaying the notification as an overlay
          showSimpleNotification(
            Text(_notificationInfo!.title!),
            leading: NotificationBadge(totalNotifications: _totalNotifications),
            subtitle: Text(_notificationInfo!.body!),
            background: Colors.cyan.shade700,
            duration: const Duration(seconds: 2),
          );
        }
      });
      // ignore: todo
      // TODO: handle the received notifications
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
  }

// For handling notification when the app is in terminated state
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
      );
      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldMessengerState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const AppText(
            text: "Notifications",
            textAlign: TextAlign.center,
            fontSize: 20,
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.settings,
                color: AppColors.white,
                size: 30,
              )),
          NotificationBadge(totalNotifications: _totalNotifications)
        ],
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      key: key,
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        child: ListView(
          physics: const ScrollPhysics(),
          children: [
            addVerticalSpacing(context, 20),
            _notificationInfo != null
                ? GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: AppColors.white,
                      elevation: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15.0,
                                color: Color.fromRGBO(0, 0, 0, 0.2)),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 10, top: 10),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                      "assets/images/close_icon.png",
                                      height: 16,
                                      width: 16,
                                      color: const Color.fromRGBO(
                                          167, 176, 172, 1),
                                    )),
                              ),
                            ),
                            Row(
                              children: [
                                addHorizontalSpacing(20),
                                Image.asset(
                                  "assets/images/good_icon.png",
                                  height: 20,
                                  width: 20,
                                ),
                                addHorizontalSpacing(20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                          text:
                                              "${_notificationInfo!.dataTitle ?? _notificationInfo!.title}",
                                          textAlign: TextAlign.center,
                                          fontSize: 16,
                                          color: AppColors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                      addVerticalSpacing(context, 20),
                                      AppText(
                                          text:
                                              "${_notificationInfo!.dataBody ?? _notificationInfo!.body}",
                                          textAlign: TextAlign.start,
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpacing(context, 20),
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 65.0,
                              ),
                              child: AppText(
                                  text: "Now",
                                  textAlign: TextAlign.start,
                                  fontSize: 13,
                                  color: AppColors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal),
                            ),
                            addVerticalSpacing(context, 20),
                          ],
                        ),
                      ),
                    ))
                : Container(),
            addVerticalSpacing(context, 20),
          ],
        ),
      ),
    );
  }
}

class NotificationBadge extends StatelessWidget {
  final int totalNotifications;

  const NotificationBadge({super.key, required this.totalNotifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppText(
              text: "$totalNotifications",
              textAlign: TextAlign.start,
              fontSize: 26,
              color: AppColors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
    this.dataTitle,
    this.dataBody,
  });

  String? title;
  String? body;
  String? dataTitle;
  String? dataBody;
}
