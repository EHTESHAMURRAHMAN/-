import 'package:get/get.dart';
import 'package:siddique/App/Module/Splash/Splash_Controller.dart/Splash_Controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
