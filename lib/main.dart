import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:siddique/App/Language/Translation_Service.dart';
import 'package:siddique/App/Module/route/app_pages.dart';
import 'package:siddique/AppControllers.dart';
import 'package:siddique/app_binding.dart';
import 'package:siddique/di.dart';

bool isLocalAuth = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDV7f-RDzyKfiq9NUmtaOWA3XNhFaln4Fo',
          appId: '1:600392959268:android:7d5eec300740743912dfb1',
          messagingSenderId: '600392959268',
          projectId: 'al-sadiqa',
          storageBucket: 'al-sadiqa.appspot.com'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController themeController = Get.put(AppController());
    return OverlaySupport.global(child: Obx(() {
      return GetMaterialApp(
          builder: EasyLoading.init(),
          navigatorKey: NavigationService.navigatorKey,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          title: 'الصديقه',
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
          initialBinding: AppBinding(),
          smartManagement: SmartManagement.keepFactory,
          initialRoute: Routes.SPLASH,
          defaultTransition: Transition.fade,
          getPages: AppPages.routes,
          theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              primarySwatch: Colors.deepPurple),
          darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              primarySwatch: Colors.deepPurple),
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light);
    }));
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
