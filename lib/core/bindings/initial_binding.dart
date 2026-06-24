import 'package:bhakti_app/shared/controllers/global_jap_controller.dart';
import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';

class InitialBinding extends Bindings {

  @override
  void dependencies() {

    Get.put(GlobalJapController());

    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}