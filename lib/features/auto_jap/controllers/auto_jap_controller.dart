import 'dart:async';

import 'package:bhakti_app/features/auto_jap/models/auto_jap_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../../shared/models/jap_model.dart';

class AutoJapController extends GetxController {

  /// AUDIO PLAYER
  final AudioPlayer audioPlayer = AudioPlayer();

  /// SELECTED JAP
  var selectedJap = Rxn<JapModel>();

  /// TARGET COUNT
  var target = 108.obs;

  /// CURRENT COUNT
  var count = 0.obs;

  /// PLAYING STATE
  var isPlaying = false.obs;

  /// SPEED
  var speed = 1.0.obs;

  Timer? japTimer;

  @override
  void onInit() {
    super.onInit();

    /// RECEIVE ARGUMENTS
    final args = Get.arguments;

    selectedJap.value = args['jap'];

    target.value = args['target'];

    initAudio();
  }

  /// INIT AUDIO
  Future<void> initAudio() async {

    await audioPlayer.setAsset(
      selectedJap.value?.audio ?? "",
    );

    await audioPlayer.setLoopMode(
      LoopMode.one,
    );
  }

  /// START JAP
  void startJap() {

    if (isPlaying.value) return;

    isPlaying.value = true;

    audioPlayer.play();

    startCounter();
  }

  /// STOP JAP
  void stopJap() {

    isPlaying.value = false;

    audioPlayer.pause();

    japTimer?.cancel();
  }

  /// RESET JAP
  void resetJap() {

    stopJap();

    count.value = 0;
  }

  /// AUTO COUNTER
  void startCounter() {

    final duration = Duration(
      milliseconds:
      (3000 / speed.value).toInt(),
    );

    japTimer = Timer.periodic(
      duration,
          (timer) {

        if (count.value >= target.value) {

          completeJap();

          return;
        }

        count.value++;
      },
    );
  }

  /// CHANGE SPEED
  void changeSpeed(double value) {

    speed.value = value;

    audioPlayer.setSpeed(value);

    if (isPlaying.value) {

      japTimer?.cancel();

      startCounter();
    }
  }

  /// PROGRESS
  double get progress {

    if (target.value == 0) return 0;

    return count.value / target.value;
  }

  /// COMPLETE JAP
  void completeJap() {

    stopJap();

    final targetController = TextEditingController();

    targetController.text = target.value.toString();

    Get.dialog(

      AlertDialog(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),

        title: const Text(
          "🎉 Jap Completed",
        ),

        content: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            Text(
              "Completed ${target.value} chants",
            ),

            const SizedBox(height: 20),

            TextField(

              controller: targetController,

              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "New Target",

                filled: true,

                fillColor: Colors.grey.shade100,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),

        actions: [

          TextButton(

            onPressed: () {

              Get.back();

              Get.back();
            },

            child: const Text("Done"),
          ),

          ElevatedButton(

            onPressed: () {

              target.value =
                  int.tryParse(targetController.text) ?? 108;

              count.value = 0;

              Get.back();

              startJap();
            },

            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }

  @override
  void onClose() {

    japTimer?.cancel();

    audioPlayer.dispose();

    super.onClose();
  }
}