import 'package:get/get.dart';
import 'package:siddique/App/Module/Dashboard/Controllers/DashBoard__Controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController(), permanent: true);
  }
}
