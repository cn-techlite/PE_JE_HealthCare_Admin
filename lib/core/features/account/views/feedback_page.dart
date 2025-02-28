// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:pe_je_healthcare_admin/core/components/widgets/input.dart';
import 'package:pe_je_healthcare_admin/core/features/account/services/account_services.dart';

import '../../../components/utils/colors.dart';
import '../../../components/utils/helper_functions.dart';
import '../../../components/utils/package_export.dart';
import '../../../components/widgets/app_text.dart';
import '../states/account_provider.dart';

class FeedbackPage extends ConsumerStatefulWidget {
  const FeedbackPage({
    super.key,
  });

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends ConsumerState<FeedbackPage> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _feedback;
  bool isProcessing = false;
  bool loading = false;
  final _focusFeedback = FocusNode();

  @override
  void initState() {
    _feedback = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _feedback.dispose();
    super.dispose();
  }

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final key = GlobalKey<ScaffoldMessengerState>();
    final accountProviderd = ref.read(accountProvider.notifier);
    accountProviderd.getAccount();
    var user = accountProviderd.userData;

    return Container(
        color: Colors.white,
        height: height,
        width: width,
        child: Scaffold(
          appBar: AppBar(
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
            title: const AppText(
                text: "Give us Feedback",
                textAlign: TextAlign.start,
                isBody: true,
                fontSize: 23,
                color: AppColors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
            backgroundColor: AppColors.primary,
          ),
          key: key,
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: () {
              _focusFeedback.unfocus();
            },
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/logo_path.png',
                  height: 250,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  child: Form(
                    key: _formkey,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 20, right: width / 20, top: 10),
                        child: const AppText(
                            text: "Share your feedback with us",
                            textAlign: TextAlign.start,
                            isBody: true,
                            fontSize: 23,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: DescriptionInput(
                          controller: _feedback,
                          hintText: "What Complaints do you have?",
                          labelText: "Complaints",
                          focusNode: _focusFeedback,
                          keyboard: TextInputType.text,
                          maxLength: 200,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Empty Field';
                            }
                            return null;
                          },
                          toggleEye: () {},
                          onSaved: (value) {},
                          onTap: () {},
                          onChanged: (String? value) {},
                        ),
                      ),
                      addVerticalSpacing(context, 20),
                      _isProcessing
                          ? const CircularProgressIndicator()
                          : Padding(
                              padding: EdgeInsets.only(
                                  left: width / 4, right: width / 4, top: 80),
                              child: InkWell(
                                onTap: () async {
                                  _focusFeedback.unfocus();

                                  if (_formkey.currentState!.validate()) {
                                    setState(() {});
                                    debugPrint("Email: ${_feedback.text}");
                                    bool isValid = await AccountService()
                                        .addFeedBack(
                                            feedback: _feedback.text.trim(),
                                            phoneNo: user!.phoneNo.toString());
                                    setState(() {
                                      _isProcessing = false;
                                    });
                                    if (isValid) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration: Duration(seconds: 10),
                                              content: Text(
                                                  "FeedBack Sent Successfully")));

                                      Navigator.pop(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration: Duration(seconds: 10),
                                              content:
                                                  Text("Error Try again")));
                                    }
                                  }
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 15,
                                          bottom: 15),
                                      child: AppText(
                                          text: "Feedback",
                                          textAlign: TextAlign.start,
                                          fontSize: 23,
                                          isBody: true,
                                          color: AppColors.white,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
