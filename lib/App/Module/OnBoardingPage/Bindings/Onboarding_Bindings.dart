import 'package:get/get.dart';
import 'package:siddique/App/Module/OnBoardingPage/Controllers/Onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnboardingController>(OnboardingController());
  }
}
