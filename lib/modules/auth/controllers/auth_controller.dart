import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';

class AuthController extends GetxController {

  final emailController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  final isLoading = false.obs;

  Future<void> login() async {

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 2),
    );

    isLoading.value = false;

    Get.snackbar(
      "Success",
      "Login Successful",
    );
    Get.offAllNamed(Routes.MAIN_NAVIGATION);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}