import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:siddique/App/Module/Splash/Splash_Controller.dart/Splash_Controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon.gif',
              width: MediaQuery.of(context).size.width / 4,
            ),
            Image.asset(
              'assets/images/logo.png',
              color: Colors.deepPurple.shade700,
              width: MediaQuery.of(context).size.width / 1.3,
            ),
          ],
        ),
      ),
    );
  }
}
