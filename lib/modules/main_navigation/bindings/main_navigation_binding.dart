import 'package:get/get.dart';

import '../controllers/main_navigation_controller.dart';

import '../../home/controllers/home_controller.dart';
import '../../mantras/controllers/mantras_controller.dart';
import '../../bhajans/controllers/bhajans_controller.dart';
import '../../jap/controllers/jap_controller.dart';
import '../../profile/controllers/profile_controller.dart';

class MainNavigationBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<MainNavigationController>(
          () => MainNavigationController(),
    );

    Get.lazyPut<HomeController>(
          () => HomeController(),
    );

    Get.lazyPut<MantrasController>(
          () => MantrasController(),
    );

    Get.lazyPut<BhajansController>(
          () => BhajansController(),
    );

    Get.lazyPut<JapController>(
          () => JapController(),
    );

    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}