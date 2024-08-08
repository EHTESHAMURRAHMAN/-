import 'package:get/get.dart';
import 'package:siddique/services/storage_service.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
  }
}
