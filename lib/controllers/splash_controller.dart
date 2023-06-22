import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:quotation/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getNavigationScreen();
    super.onInit();
  }

  getNavigationScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loginStatus = prefs.getBool('login') ?? false;
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      if (loginStatus == true) {
        Get.offAllNamed(RoutesName.homeScreen);
      } else {
        Get.offAllNamed(RoutesName.loginScreen);
      }
    });
  }
}
