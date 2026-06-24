import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../shared/models/song_model.dart';

class MusicPlayerController extends GetxController {

  /// AUDIO PLAYER
  final AudioPlayer audioPlayer = AudioPlayer();

  /// SELECTED SONG
  var selectedSong = Rxn<SongModel>();

  /// PLAY STATE
  var isPlaying = false.obs;

  /// POSITION
  var currentPosition = Duration.zero.obs;

  /// TOTAL DURATION
  var totalDuration = Duration.zero.obs;

  /// SPEED
  var speed = 1.0.obs;

  /// LOOP MODE
  /// 0 = OFF
  /// 1 = ONE
  /// 2 = ALL
  var loopMode = 0.obs;

  @override
  void onInit() {
    super.onInit();

    /// GET SONG FROM ARGUMENT
    if (Get.arguments != null) {
      selectedSong.value = Get.arguments as SongModel;
    }

    initPlayer();
  }

  /// INIT PLAYER
  Future<void> initPlayer() async {

    await audioPlayer.setAsset(
      selectedSong.value?.audio ?? "",
    );

    totalDuration.value =
        audioPlayer.duration ?? Duration.zero;

    /// POSITION LISTENER
    audioPlayer.positionStream.listen((position) {

      currentPosition.value = position;
    });

    /// PLAYER STATE
    audioPlayer.playerStateStream.listen((state) {

      isPlaying.value = state.playing;
    });

    /// DURATION LISTENER
    audioPlayer.durationStream.listen((duration) {

      if (duration != null) {

        totalDuration.value = duration;
      }
    });
  }

  /// PLAY / PAUSE
  void togglePlay() {

    if (isPlaying.value) {

      audioPlayer.pause();

    } else {

      audioPlayer.play();
    }
  }

  /// SEEK
  void seek(Duration position) {

    audioPlayer.seek(position);
  }

  /// SPEED CONTROL
  void changeSpeed(double value) {

    speed.value = value;

    audioPlayer.setSpeed(value);
  }

  /// LOOP MODE
  void changeLoopMode() {

    loopMode.value++;

    if (loopMode.value > 2) {

      loopMode.value = 0;
    }

    if (loopMode.value == 0) {

      audioPlayer.setLoopMode(LoopMode.off);

    } else if (loopMode.value == 1) {

      audioPlayer.setLoopMode(LoopMode.one);

    } else {

      audioPlayer.setLoopMode(LoopMode.all);
    }
  }

  /// NEXT SONG
  void nextSong() {

    Get.snackbar(
      "Next",
      "Next song feature coming soon",
    );
  }

  /// PREVIOUS SONG
  void previousSong() {

    Get.snackbar(
      "Previous",
      "Previous song feature coming soon",
    );
  }

  @override
  void onClose() {

    audioPlayer.dispose();

    super.onClose();
  }
}