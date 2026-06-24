import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/jap_controller.dart';

class JapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JapController>(
          () => JapController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
      fenix: true,
    );
  }
}