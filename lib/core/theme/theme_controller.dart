import 'package:get/get.dart';

class ThemeController
    extends GetxController {

  final isDark =
      false.obs;

  void toggleTheme() {

    isDark.value =
    !isDark.value;
  }
}