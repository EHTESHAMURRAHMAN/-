import 'package:get/get.dart';
import 'package:siddique/App/Module/Setting/Controllers/Setting_Controller.dart';

class SettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController());
  }
}
