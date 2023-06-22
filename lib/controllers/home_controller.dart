import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes/routes_name.dart';

class HomeController extends GetxController {
  logoutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', false);
    Get.offAllNamed(RoutesName.loginScreen);
  }
}
