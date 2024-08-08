import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class CredentialController extends GetxController {
  final validEmail = "khan";
  final validPassword = "1234";

  /// Input form controllers
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  /// Rive controller and input
  StateMachineController? riveController;

  Rx<SMIInput<bool>?> isChecking = Rx<SMIInput<bool>?>(null);
  Rx<SMIInput<double>?> numLook = Rx<SMIInput<double>?>(null);
  Rx<SMIInput<bool>?> isHandsUp = Rx<SMIInput<bool>?>(null);
  Rx<SMIInput<bool>?> trigSuccess = Rx<SMIInput<bool>?>(null);
  Rx<SMIInput<bool>?> trigFail = Rx<SMIInput<bool>?>(null);

  RxBool showPassword = false.obs;

  @override
  void onInit() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.onInit();
  }

  @override
  void onClose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void emailFocus() {
    isChecking.value?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp.value?.change(passwordFocusNode.hasFocus);
  }

  Future<void> login() async {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();

    final email = emailController.text;
    final password = passwordController.text;

    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    await Future.delayed(
      const Duration(milliseconds: 2000),
    );

    Get.back();

    if (email == validEmail && password == validPassword) {
      trigSuccess.value?.change(true);
    } else {
      trigFail.value?.change(true);
    }
  }

  void onRiveInit(Artboard artboard) {
    riveController = StateMachineController.fromArtboard(
      artboard,
      "Login Machine",
    );
    if (riveController == null) return;

    artboard.addController(riveController!);
    isChecking.value = riveController?.findInput("isChecking");
    numLook.value = riveController?.findInput("numLook");
    isHandsUp.value = riveController?.findInput("isHandsUp");
    trigSuccess.value = riveController?.findInput("trigSuccess");
    trigFail.value = riveController?.findInput("trigFail");
  }
}
