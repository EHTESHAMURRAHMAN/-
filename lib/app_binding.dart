import 'package:get/get.dart';
import 'package:siddique/AppControllers.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<AppController>(AppController(), permanent: true);
  }
}
