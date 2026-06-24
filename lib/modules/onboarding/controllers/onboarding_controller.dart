import 'package:get/get.dart';

class OnboardingController extends GetxController {

  final currentPage = 0.obs;

  void updatePage(int index) {
    currentPage.value = index;
  }

  bool get isLastPage => currentPage.value == 2;
}