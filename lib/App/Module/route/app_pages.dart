import 'package:get/get.dart';
import 'package:siddique/App/Module/Booking/Bindings/Bindings.dart';
import 'package:siddique/App/Module/Booking/Views/Booking_Views.dart';
import 'package:siddique/App/Module/Credentials/Bindings/credential_Bindings.dart';
import 'package:siddique/App/Module/Credentials/Views/Login_view.dart';
import 'package:siddique/App/Module/Credentials/Views/Register_View.dart';
import 'package:siddique/App/Module/Dashboard/Bindings/Dashboard_Binding.dart';
import 'package:siddique/App/Module/Dashboard/Views/DashBoard_View.dart';
import 'package:siddique/App/Module/Home/Bindings/Home_Binding.dart';
import 'package:siddique/App/Module/Home/Views/Home_view.dart';
import 'package:siddique/App/Module/OnBoardingPage/Bindings/Onboarding_Bindings.dart';
import 'package:siddique/App/Module/OnBoardingPage/Views/Onboarding_View.dart';
import 'package:siddique/App/Module/Setting/Bindings/Bindings.dart';
import 'package:siddique/App/Module/Setting/Views/Setting_view.dart';
import 'package:siddique/App/Module/Splash/Bindings/Splash_Binding.dart';
import 'package:siddique/App/Module/Splash/Views/Splash_Views.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePageView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingView(),
      binding: SettingBindings(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashBoardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.BOOKING,
      page: () => BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: CredentialBindings(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegistrationView(),
      binding: CredentialBindings(),
    ),
  ];
}
