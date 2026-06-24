import 'package:get/get.dart';

import '../../modules/shared/controllers/global_jap_controller.dart';
import '../theme/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(
      ThemeController(),
      permanent: true,
    );

    Get.put(
      GlobalJapController(),
      permanent: true,
    );
  }
}