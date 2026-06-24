import 'package:get/get.dart';

class FavoritesController extends GetxController {

  final favorites = <Map<String, String>>[
    {
      "title": "Hare Krishna Mahamantra",
      "type": "Mantra",
    },
    {
      "title": "Achyutam Keshavam",
      "type": "Bhajan",
    },
  ].obs;

  void removeFavorite(int index) {
    favorites.removeAt(index);
  }
}