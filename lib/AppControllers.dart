import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siddique/App/Language/Translation_Service.dart';
import 'package:siddique/App/Utils/Storage.dart';

class AppController extends GetxController {
  final language = 'English'.obs;
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadLocale();
    _loadThemeFromPreferences();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToPreferences(isDarkMode.value);
  }

  void _loadThemeFromPreferences() async {
    final prefs = Get.find<SharedPreferences>();
    isDarkMode.value = prefs.getBool(StorageConstants.darkmode) ?? false;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void _saveThemeToPreferences(bool isDarkMode) async {
    final prefs = Get.find<SharedPreferences>();
    await prefs.setBool(StorageConstants.darkmode, isDarkMode);
  }

  void loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String localeString =
        prefs.getString(StorageConstants.locale) ?? 'en#US#English';
    List<String> values = localeString.split('#');
    String loc = values[0];
    String country = values[1];
    String lang = values[2];

    // Update language and locale only if stored locale is valid
    if (TranslationService.locales.contains(Locale(loc, country))) {
      language.value = lang;
      Get.updateLocale(Locale(loc, country));
    } else {
      // Fallback to default locale and language if stored locale is invalid
      language.value = language.value;
      Get.updateLocale(Locale(loc, country));
    }
  }
}
