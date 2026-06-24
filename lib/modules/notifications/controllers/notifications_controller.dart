import 'package:get/get.dart';

class NotificationsController extends GetxController {

  final japReminder = true.obs;

  final gitaReminder = true.obs;

  final morningReminder = false.obs;

  void toggleJap() {
    japReminder.toggle();
  }

  void toggleGita() {
    gitaReminder.toggle();
  }

  void toggleMorning() {
    morningReminder.toggle();
  }
}