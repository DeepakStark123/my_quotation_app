import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
