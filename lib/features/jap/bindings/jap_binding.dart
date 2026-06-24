import 'package:get/get.dart';

import '../controllers/jap_controller.dart';

class JapBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<JapController>(
          () => JapController(),
    );
  }
}