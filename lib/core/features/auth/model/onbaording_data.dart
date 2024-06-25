import '../model/onboarding_model.dart';

List<Map<String, String>> onboardingData = [
  {
    "pre":
        "Our Recruiting system gives you the flexibility to make your own Rota at your convenient time",
    "text": "Welcome PE & JE HealthCare Ltd",
    "image": "assets/images/mux1.png"
  },
  {
    "pre":
        "We make it flexible for carers to manage their own time and have feeling of being their own boss",
    "text": "What is it about PE & JE HealthCare",
    "image": "assets/images/mux.png"
  },
  {
    "pre": "First time in our app? Kindly Register to get started",
    "text": "Your  Time And Convenience is Our Priority",
    "image": "assets/images/mux2.png"
  },
];
List<OnboardingModel> formattedOnboardingList =
    onboardingData.map((x) => OnboardingModel.fromJson(x)).toList();
