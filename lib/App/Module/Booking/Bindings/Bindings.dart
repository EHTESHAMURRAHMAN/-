import 'package:get/get.dart';
import 'package:siddique/App/Module/Booking/Controllers/Booking_Controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookingController>(BookingController());
  }
}
