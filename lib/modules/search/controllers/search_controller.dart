import 'package:get/get.dart';

class SearchController extends GetxController {

  final query = ''.obs;

  final allItems = [
    'Hare Krishna Mahamantra',
    'Om Namah Shivaya',
    'Achyutam Keshavam',
    'Janmashtami',
    'Bhagavad Gita 2.47',
  ];

  final results = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    results.assignAll(allItems);
  }

  void search(String value) {
    query.value = value;

    results.assignAll(
      allItems.where(
            (item) => item
            .toLowerCase()
            .contains(value.toLowerCase()),
      ),
    );
  }
}