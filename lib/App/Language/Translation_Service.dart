import 'dart:ui';
import 'package:get/get.dart';
import 'package:siddique/App/Language/ar_AR.dart';
import 'package:siddique/App/Language/en_US.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  static final langs = [
    'English',
    'Arabic',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'SA'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'ar_SA': ar_AR,
      };
}
