import 'package:get/get.dart';
import 'package:news_app/src/bindings/auth_binding.dart';
import 'package:news_app/src/features/screen/login_screen/login.dart';
import 'package:news_app/src/features/screen/registration/registration.dart';
import 'package:news_app/src/features/screen/screen1/home_screen/home_screen1.dart';
import 'package:news_app/src/routing/app_route.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LogIn(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.registration,
      page: () => const Registration(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
    ),
  ];
}
