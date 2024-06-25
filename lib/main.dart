import 'package:pe_je_healthcare_admin/core/components/constants/push_notification.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/colors.dart';
import 'package:pe_je_healthcare_admin/core/components/helpers/firebase_options.dart';
import 'package:upgrader/upgrader.dart';
import 'core/components/helpers/globals.dart';
import 'core/components/routes/routers.dart';
import 'core/components/utils/package_export.dart';
import 'core/components/routes/routers.dart' as router;

final _pushMessagingNotification = getIt<PushNotificationService>();

Future myBackgroundMessageHandler(RemoteMessage message) async {
  debugPrint("onBackgroundMessage: ${message.notification?.title}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Upgrader.clearSavedSettings(); // REMOVE this for release builds
  SystemChrome.setPreferredOrientations;

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt.registerLazySingleton<AppGlobals>(() => AppGlobals());
  await setupLocator();
  await FirebaseMessaging.instance.getInitialMessage();
  await _pushMessagingNotification.initialize();
  //Handle Push Notification when app is in background and when app is terminated
  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

  await globals.init();
  if (globals.userId.toString().isNotEmpty) {
    await globals.login();
  }
  final navigatorKey = GlobalKey<NavigatorState>();
  String? route = await initialRoute();
  runApp(ProviderScope(
      child: MyApp(
    route: route,
    navigatorKey: navigatorKey,
  )));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    this.route,
    required this.navigatorKey,
  });
  final String? route;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? route;
  @override
  void initState() {
    super.initState();
    setState(() {
      route = widget.route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: UpgradeAlert(
        showReleaseNotes: false,
        dialogStyle: UpgradeDialogStyle.cupertino,
        upgrader: Upgrader(),
        child: MaterialApp(
          debugShowCheckedModeBanner: true,
          title: 'PE & JE Master App',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: true,
              fontFamily: "Open Serif"),
          onGenerateRoute: router.generateRoute,
          initialRoute: route,
          navigatorKey: widget.navigatorKey,
          builder: (BuildContext context, Widget? child) {
            return Stack(
              children: [
                child!,
              ],
            );
          },
          // home: const OnboardScreen()
        ),
      ),
    );
  }
}
