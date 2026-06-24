import 'package:get/get.dart';

import '../../../shared/models/app_models.dart';

class HomeController extends GetxController {

  var isLoading = false.obs;

  var gods = <God>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadGods();
  }

  Future<void> loadGods() async {

    isLoading.value = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    gods.assignAll([

      God(
        id: "1",
        name: "Shri Ganesha",
        nameMarathi: "श्री गणेश",
        imageUrl: "assets/images/ganesh.png",
        description: "Vighnaharta, Buddhi data",
        mantraCount: 12,
        songCount: 8,
      ),

      God(
        id: "2",
        name: "Lord Shiva",
        nameMarathi: "भगवान शिव",
        imageUrl:"assets/images/shiv.png",
        description: "Mahadev, Bholenath",
        mantraCount: 20,
        songCount: 14,
      ),

      God(
        id: "3",
        name: "Lord Krishna",
        nameMarathi: "भगवान कृष्ण",
        imageUrl: "assets/images/krushna.png",
        description: "Madhav, Govind",
        mantraCount: 18,
        songCount: 11,
      ),

      God(
        id: "4",
        name: "Goddess Durga",
        nameMarathi: "माँ दुर्गा",
        imageUrl: "assets/images/dhurga.png",
        description: "Shakti, Mahishasuramardini",
        mantraCount: 16,
        songCount: 10,
      ),
    ]);

    isLoading.value = false;
  }
}