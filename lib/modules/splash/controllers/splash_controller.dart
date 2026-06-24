import 'dart:async';



import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {

    super.onInit();
    print("SplashController initialized");

    _navigateToHome();
  }

  void _navigateToHome() {

    Timer(
      const Duration(seconds: 3),
          () {

        // Get.offAllNamed(
        //   Routes.ONBOARDING,
        // );
            Get.offAllNamed(
                // Routes.MAIN_NAVIGATION,
                Routes.LOGIN,
              );
      },
    );
  }
}