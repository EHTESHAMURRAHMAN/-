import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VenderDetailController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
  late Animation<double> rotationAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    scaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
