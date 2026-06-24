import 'package:get/get.dart';

import '../../shared/models/god_model.dart';

class GodDetailController extends GetxController {

  late final GodModel god;

  @override
  void onInit() {

    super.onInit();

    god = Get.arguments as GodModel;
  }

  void openMantras() {

    Get.toNamed('/mantras');
  }

  void openBhajans() {

    Get.toNamed('/bhajans');
  }

  void openJap() {

    Get.toNamed('/jap');
  }
}