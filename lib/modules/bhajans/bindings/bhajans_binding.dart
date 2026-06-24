import 'package:get/get.dart';

import '../controllers/bhajans_controller.dart';

class BhajansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BhajansController>(
          () => BhajansController(),
    );
  }
}