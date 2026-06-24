import 'package:get/get.dart';

class TrackerController extends GetxController {

  final todayRounds = 8.obs;

  final targetRounds = 16.obs;

  final gitaReading = false.obs;

  final aartiDone = false.obs;

  final streak = 12.obs;

  void toggleGita() {
    gitaReading.toggle();
  }

  void toggleAarti() {
    aartiDone.toggle();
  }
}