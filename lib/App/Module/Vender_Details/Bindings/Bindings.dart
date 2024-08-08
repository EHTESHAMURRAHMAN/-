import 'package:get/get.dart';
import 'package:siddique/App/Module/Vender_Details/Controllers/Vender_Details_Controller.dart';

class VenderDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<VenderDetailController>(VenderDetailController());
  }
}
