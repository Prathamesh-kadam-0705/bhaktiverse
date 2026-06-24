import 'package:get/get.dart';

class SettingsController extends GetxController {

  final isDarkMode = false.obs;

  final notificationsEnabled = true.obs;

  void toggleTheme() {
    isDarkMode.toggle();
  }

  void toggleNotifications() {
    notificationsEnabled.toggle();
  }
}