// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/components/utils/helper_functions.dart';
import 'package:pe_je_healthcare_admin/core/features/home/controller/add_service_user.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/service_user_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/states/home_provider.dart';
import 'package:pe_je_healthcare_admin/core/features/home/view/service_users/service_user_details.dart';

import '../../../../components/utils/colors.dart';
import '../../../../components/utils/package_export.dart';
import '../../../../components/widgets/app_text.dart';

class ServiceUserPage extends ConsumerStatefulWidget {
  const ServiceUserPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<ServiceUserPage> {
  late HomeNotifier homeProviders;
  @override
  void initState() {
    homeProviders = ref.read(homeProvider.notifier);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildItem(
    BuildContext context,
    ServiceUserResponseModel userChat,
  ) {
    return GestureDetector(
      onTap: () {
        navigateToRoute(context, ServiceUsersDetailsPage(userChat: userChat));
      },
      child: Card(
        elevation: 4,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    backgroundImage: userChat.imageProfile.toString().isEmpty
                        ? const NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                        // ignore: unnecessary_null_comparison
                        : userChat.imageProfile == null
                            ? const NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                            : NetworkImage(userChat.imageProfile.toString())),
              ),
              const SizedBox(width: 10),
              AppText(
                  text: "${userChat.firstName} ${userChat.lastName}",
                  textAlign: TextAlign.start,
                  isBody: false,
                  fontSize: 12,
                  color: AppColors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
              const Spacer(),
              // ignore: prefer_const_constructors
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.black,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldMessengerState>();
    final provider = ref.watch(getListServiceUser);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToRoute(context, const AddServiceUserScreen());
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const AppText(
            text: "Service User List",
            isBody: false,
            textAlign: TextAlign.center,
            fontSize: 19,
            color: AppColors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      key: key,
      backgroundColor: Colors.transparent,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
          child: provider.when(
              data: (data) {
                return data.isEmpty
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
                                isBody: false,
                                fontSize: 21,
                                color: AppColors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                            const AppText(
                                text:
                                    "You have not been assigned to any service user yet.",
                                textAlign: TextAlign.center,
                                isBody: true,
                                fontSize: 26,
                                color: AppColors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal),
                          ],
                        ),
                      )
                    : ListView.builder(
                        // ignore: prefer_const_constructors
                        padding: EdgeInsets.only(top: 10),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return buildItem(context, data[index]);
                        });
              },
              error: ((error, stackTrace) => Text("Error: $error")),
              loading: () => const Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator())))),
    );
  }
}
