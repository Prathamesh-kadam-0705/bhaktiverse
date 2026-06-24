import 'package:get/get.dart';

import '../controllers/mantras_controller.dart';

class MantrasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MantrasController>(
          () => MantrasController(),
    );
  }
}