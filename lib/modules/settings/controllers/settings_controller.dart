import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';

class SettingsController extends GetxController {

  final AuthService _authService = Get.find<AuthService>();

  final isDarkMode = false.obs;
  final notificationsEnabled = true.obs;

  void toggleTheme() {
    isDarkMode.toggle();
  }

  void toggleNotifications() {
    notificationsEnabled.toggle();
  }

  Future<void> logout() async {

    final confirm = await Get.dialog<bool>(
      AlertDialog(
        title: const Text("Logout"),
        content: const Text(
          "Are you sure you want to logout?",
        ),
        actions: [

          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text("Cancel"),
          ),

          ElevatedButton(
            onPressed: () => Get.back(result: true),
            child: const Text("Logout"),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    await _authService.logout();

    Get.offAllNamed(Routes.LOGIN);
  }
}