import 'dart:async';

import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';

class SplashController extends GetxController {

  final AuthService _authService = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();

    onReady();
  }
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(seconds: 3));

    if (_authService.isLoggedIn) {
      Get.offAllNamed(Routes.MAIN_NAVIGATION);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

}