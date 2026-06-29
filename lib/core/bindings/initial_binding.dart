import 'package:bhakti_app/core/services/auth_service.dart';
import 'package:bhakti_app/core/services/user_service.dart';
import 'package:get/get.dart';

import '../../shared/controllers/global_jap_controller.dart';
import '../theme/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(AuthService(), permanent: true);
    Get.put<UserService>(
      UserService(),
      permanent: true,
    );

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