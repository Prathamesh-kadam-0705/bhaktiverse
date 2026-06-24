import 'package:get/get.dart';

import '../controllers/god_detail_controller.dart';

class GodDetailBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<GodDetailController>(
          () => GodDetailController(),
    );
  }
}