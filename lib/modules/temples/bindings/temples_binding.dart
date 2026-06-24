import 'package:get/get.dart';

import '../controllers/temples_controller.dart';

class TemplesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TemplesController>(
          () => TemplesController(),
    );
  }
}