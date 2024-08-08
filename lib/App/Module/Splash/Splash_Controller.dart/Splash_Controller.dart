import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddique/App/Module/Credentials/Views/Login_view.dart';
import 'package:siddique/App/Module/route/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToDashboard();
  }

  void navigateToDashboard() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Get.offAndToNamed(Routes.ONBOARDING);
  }
}
