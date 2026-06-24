import 'package:bhakti_app/core/services/auth_service.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(
          () => AuthService(),
    );

    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
  }
}