import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siddique/App/Utils/Storage.dart';
import 'package:siddique/AppControllers.dart';

class SettingController extends GetxController {
  final appController = Get.find<AppController>();

  void updateLocale(loc, country, language) {
    var locale = Locale(loc, country);
    appController.language.value = language;
    Get.find<SharedPreferences>()
        .setString(StorageConstants.locale, '$loc#$country#$language');
    Get.updateLocale(locale);
    Get.back();
  }
}
