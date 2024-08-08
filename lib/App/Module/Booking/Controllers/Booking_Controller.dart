// booking_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddique/App/Utils/Common_Color.dart';

class BookingController extends GetxController {
  final List<Slot> _bookedSlots = [
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 1)),
      service: 'Plumber'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'John Doe',
      serviceProviderContact: '+1234567890',
      estimatedArrival: const Duration(minutes: 50),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 2)),
      service: 'AC Repair'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'Alice Johnson',
      serviceProviderContact: '+0987654321',
      estimatedArrival: const Duration(minutes: 30),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 1)),
      service: 'Plumber'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'John Doe',
      serviceProviderContact: '+1234567890',
      estimatedArrival: const Duration(minutes: 50),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 2)),
      service: 'AC Repair'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'Alice Johnson',
      serviceProviderContact: '+0987654321',
      estimatedArrival: const Duration(minutes: 30),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 1)),
      service: 'Plumber'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'John Doe',
      serviceProviderContact: '+1234567890',
      estimatedArrival: const Duration(minutes: 50),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 2)),
      service: 'AC Repair'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'Alice Johnson',
      serviceProviderContact: '+0987654321',
      estimatedArrival: const Duration(minutes: 30),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 1)),
      service: 'Plumber'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'John Doe',
      serviceProviderContact: '+1234567890',
      estimatedArrival: const Duration(minutes: 50),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 2)),
      service: 'AC Repair'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'Alice Johnson',
      serviceProviderContact: '+0987654321',
      estimatedArrival: const Duration(minutes: 30),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 1)),
      service: 'Plumber'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'John Doe',
      serviceProviderContact: '+1234567890',
      estimatedArrival: const Duration(minutes: 50),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 2)),
      service: 'AC Repair'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'Alice Johnson',
      serviceProviderContact: '+0987654321',
      estimatedArrival: const Duration(minutes: 30),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 1)),
      service: 'Plumber'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'John Doe',
      serviceProviderContact: '+1234567890',
      estimatedArrival: const Duration(minutes: 50),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 2)),
      service: 'AC Repair'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'Alice Johnson',
      serviceProviderContact: '+0987654321',
      estimatedArrival: const Duration(minutes: 30),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 1)),
      service: 'Plumber'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'John Doe',
      serviceProviderContact: '+1234567890',
      estimatedArrival: const Duration(minutes: 50),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 2)),
      service: 'AC Repair'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'Alice Johnson',
      serviceProviderContact: '+0987654321',
      estimatedArrival: const Duration(minutes: 30),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 1)),
      service: 'Plumber'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'John Doe',
      serviceProviderContact: '+1234567890',
      estimatedArrival: const Duration(minutes: 50),
    ),
    Slot(
      dateTime: DateTime.now().add(const Duration(hours: 2)),
      service: 'AC Repair'.tr,
      bookedBy: 'user1',
      serviceProviderName: 'Alice Johnson',
      serviceProviderContact: '+0987654321',
      estimatedArrival: const Duration(minutes: 30),
    ),
  ];

  final String _currentUser = 'user1';

  List<Slot> get userBookedSlots =>
      _bookedSlots.where((slot) => slot.bookedBy == _currentUser).toList();

  bool _myAnimation = false;

  bool get myAnimation => _myAnimation;

  @override
  void onInit() {
    super.onInit();
    _myAnimation = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _myAnimation = true;
      update();
    });
  }
}
