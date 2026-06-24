import 'package:get/get.dart';

import '../controllers/festivals_controller.dart';

class FestivalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FestivalsController>(
          () => FestivalsController(),
    );
  }
}