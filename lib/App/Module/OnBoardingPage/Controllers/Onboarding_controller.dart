import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:siddique/App/Module/route/app_pages.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  PageController pageController = PageController();

  void nextPage() {
    if (currentIndex.value < 2) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
