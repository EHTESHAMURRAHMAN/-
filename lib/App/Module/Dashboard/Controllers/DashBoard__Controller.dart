import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final NotchBottomBarController notchBottomBarController =
      NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onTabSelected(int index) {
    log('current selected index $index');
    pageController.jumpToPage(index);
  }
}
