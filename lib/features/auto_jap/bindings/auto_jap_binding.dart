import 'package:get/get.dart';

import '../controllers/auto_jap_controller.dart';

class AutoJapBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<AutoJapController>(
          () => AutoJapController(),
    );
  }
}
