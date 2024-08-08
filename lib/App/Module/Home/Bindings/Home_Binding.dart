import 'package:get/get.dart';
import 'package:siddique/App/Module/Home/Controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
