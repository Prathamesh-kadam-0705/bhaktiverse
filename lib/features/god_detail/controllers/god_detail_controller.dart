import 'package:get/get.dart';

import '../../../shared/models/app_models.dart';
import '../../../shared/models/song_model.dart';
import '../../../shared/models/jap_model.dart';

class GodDetailController extends GetxController {

  /// TAB INDEX
  var selectedTab = 0.obs;

  /// SELECTED GOD
  var selectedGod = Rxn<God>();

  /// SONG LIST
  var songs = <SongModel>[].obs;

  /// JAP LIST
  var japs = <JapModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    /// GET SELECTED GOD
    selectedGod.value = Get.arguments as God;

    /// LOAD DATA
    loadSongs();
    loadJaps();
  }

  /// CHANGE TAB
  void changeTab(int index) {
    selectedTab.value = index;
  }

  /// LOAD SONGS
  void loadSongs() {

    final godName = selectedGod.value?.name ?? "";

    if (godName.contains("Shiva")) {

      songs.assignAll([

        SongModel(
          id: "1",
          title: "Shiv Tandav",
          singer: "Anuradha Paudwal",
          image: "assets/images/shiv1.jpeg",
          audio: "assets/audio/shiv.mp3",
        ),

        SongModel(
          id: "2",
          title: "Om Namah Shivay",
          singer: "Suresh Wadkar",
          image: "assets/images/shiv1.jpeg",
          audio: "assets/audio/shiv.mp3",
        ),
      ]);

    } else if (godName.contains("Krishna")) {

      songs.assignAll([

        SongModel(
          id: "3",
          title: "Achyutam Keshavam",
          singer: "Jagjit Singh",
          image: "assets/images/krushna1.jpeg",
          audio: "assets/audio/krishna.mp3",
        ),
      ]);

    } else if (godName.contains("Ganesha")) {

      songs.assignAll([

        SongModel(
          id: "4",
          title: "Ganpati Bappa Morya",
          singer: "Lata Mangeshkar",
          image: "assets/images/ganesh1.jpeg",
          audio: "assets/audio/ganesh.mp3",
        ),
      ]);

    } else {

      songs.clear();
    }
  }

  /// LOAD JAPS
  void loadJaps() {

    final godName = selectedGod.value?.name ?? "";

    if (godName.contains("Shiva")) {

      japs.assignAll([

        JapModel(
          id: "1",
          mantra: "ॐ नमः शिवाय",
          godName: "Lord Shiva",
          audio: "assets/audio/shiv.mp3",
          image: "assets/images/shiv1.jpeg",
        ),

        JapModel(
          id: "2",
          mantra: "महामृत्युंजय मंत्र",
          godName: "Lord Shiva",
          audio: "assets/audio/mahamrityunjay.mp3",
          image: "assets/images/shiv1.jpeg",
        ),
      ]);

    } else if (godName.contains("Krishna")) {

      japs.assignAll([

        JapModel(
          id: "3",
          mantra: "हरे कृष्ण हरे राम",
          godName: "Lord Krishna",
          audio: "assets/audio/krishna.mp3",
          image: "assets/images/krushna1.jpeg",
        ),
      ]);

    } else if (godName.contains("Ganesha")) {

      japs.assignAll([

        JapModel(
          id: "4",
          mantra: "ॐ गं गणपतये नमः",
          godName: "Shri Ganesha",
          audio: "assets/audio/ganesh.mp3",
          image: "assets/images/ganesh1.jpeg",
        ),
      ]);

    } else {

      japs.clear();
    }
  }
}