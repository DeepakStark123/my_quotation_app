import 'package:get/get.dart';
import 'package:quotation/controllers/home_controller.dart';
import 'package:quotation/screens/home_view/home_page.dart';
import 'package:quotation/screens/quotations_view/quotation_screen.dart';
import 'package:quotation/utils/routes/routes_name.dart';

import '../../controllers/login_controller.dart';
import '../../controllers/quotation_controller.dart';
import '../../screens/auth_view/login_page.dart';
import '../../screens/splash_view/splash_screen.dart';

class AppRoutes {
  final getPages = [
    GetPage(
      name: RoutesName.spalashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: RoutesName.loginScreen,
        page: () => const LoginScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut<LoginController>(
            () => LoginController(),
          );
        })),
    GetPage(
        name: RoutesName.homeScreen,
        page: () => const HomeScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut<HomeController>(
            () => HomeController(),
          );
        })),
    GetPage(
        name: RoutesName.quotationScreen,
        page: () => const QuotationScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut<QuotationController>(
            () => QuotationController(),
          );
        })),
  ];
}
