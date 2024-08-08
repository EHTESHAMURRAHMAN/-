import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonColor {
  static Color primaryColor = Colors.deepPurple.shade700;
  static Color grid1 = const Color(0xffd6add9);
  static Color grid2 = const Color(0xff9874f2);
}

class WorkList {
  final String name;
  final Image image;

  WorkList({required this.name, required this.image});
}

final List<WorkList> workList = [
  WorkList(
      name: "PlumbPro".tr, image: Image.asset('assets/icons/tap_icon.png')),
  WorkList(
      name: "ElectroFix".tr,
      image: Image.asset('assets/icons/electricity_icon.png')),
  WorkList(
      name: "ApplianceFix".tr,
      image: Image.asset('assets/icons/appliance_icon.png')),
  WorkList(name: "AC Fix".tr, image: Image.asset('assets/icons/ac_icon.png')),
];

class VenderList {
  final String name;
  final Image image;

  VenderList({required this.name, required this.image});
}

final List<VenderList> venderList = [
  VenderList(
      name: "Plumber Pros".tr, image: Image.asset('assets/images/plumber.png')),
  VenderList(
      name: "Electric Experts".tr,
      image: Image.asset('assets/images/electrician.png')),
  VenderList(
      name: "Appliance Experts".tr,
      image: Image.asset('assets/images/appliance.png')),
  VenderList(name: "AC Experts".tr, image: Image.asset('assets/images/ac.png')),
];
final List<Color> departmentcolors = [
  const Color(0xffc7b6cd),
  const Color(0xfff9daa2),
  const Color(0xfffba2a1),
  const Color(0xffdee2fd),
];
final List<Color> vendercolors = [
  const Color(0xffdaebe1),
  const Color(0xffcb92f8),
  const Color(0xfffba2a1),
  const Color(0xfffff3c1),
];

class Slot {
  final DateTime dateTime;
  final String service;
  final String bookedBy;
  final String serviceProviderName;
  final String serviceProviderContact;
  final Duration estimatedArrival;

  Slot({
    required this.dateTime,
    required this.service,
    required this.bookedBy,
    required this.serviceProviderName,
    required this.serviceProviderContact,
    required this.estimatedArrival,
  });
}

class SettingBox extends StatelessWidget {
  final Function() onTap;

  final IconData icon;
  final Color iconColor;
  final String title;
  final IconData trilingicon;

  const SettingBox({
    super.key,
    required this.iconColor,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.trilingicon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 20,
          backgroundColor: iconColor,
          child: Icon(icon, size: 25, color: Colors.white)),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
      trailing: Icon(trilingicon, size: 17),
    );
  }
}
