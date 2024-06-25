import 'package:pe_je_healthcare_admin/core/components/widgets/app_text.dart';

import '../../../components/routes/route.dart';
import '../../../components/utils/app_buttons.dart';
import '../../../components/utils/colors.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/utils/package_export.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.all(24.sp),
        decoration: const BoxDecoration(
            //  color: AppColors.primaryDark,
            image:
                DecorationImage(image: AssetImage("assets/images/doodle.png"))),
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        child: Stack(
          //   mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                image: DecorationImage(
                    image: AssetImage("assets/images/doodle.png"),
                    fit: BoxFit.cover),
              ),
              height: 310,
              width: getScreenWidth(context),
            ),
            //const SizedBox(),
            Positioned(
              top: 230,
              left: 135,
              //  alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: Image.asset(
                  "assets/images/logo_path.png",
                  fit: BoxFit.contain,
                  height: 100,
                  width: 200,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addVerticalSpacing(context, 48),
                  Image.asset(
                    "assets/images/logo_path.png",
                    height: 50,
                    width: 100,
                  ),
                  addVerticalSpacing(context, 15),
                  AppText(
                    text: "Manage health care services".toString(),
                    textAlign: TextAlign.center,
                    fontSize: 25,
                    color: AppColors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      text: "Login",
                      onPressed: () {
                        navPush(context, RootRoutes.login);
                      },
                      textcolor: AppColors.white,
                      btncolor: AppColors.primaryDark,
                    ),
                    addVerticalSpacing(context, 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
