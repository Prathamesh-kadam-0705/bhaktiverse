import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/music_player_controller.dart';

class MusicPlayerView
    extends GetView<MusicPlayerController> {

  const MusicPlayerView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      body: SafeArea(

        child: Obx(() {

          return Column(

            children: [

              /// TOP BAR
              Padding(
                padding: const EdgeInsets.all(20),

                child: Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    IconButton(
                      onPressed: () {
                        Get.back();
                      },

                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),

                    const Text(
                      "NOW PLAYING",
                      style: TextStyle(
                        color: Colors.white70,
                        letterSpacing: 2,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ROTATING IMAGE
              TweenAnimationBuilder(

                tween: Tween<double>(
                  begin: 0,
                  end: controller.isPlaying.value
                      ? 1
                      : 0,
                ),

                duration:
                const Duration(seconds: 20),

                builder: (context, value, child) {

                  return Transform.rotate(

                    angle: value * 2 * pi,

                    child: child,
                  );
                },

                child: Container(

                  width: 280,
                  height: 280,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/shiv1.jpeg",
                      ),
                      fit: BoxFit.cover,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple
                            .withOpacity(0.6),

                        blurRadius: 40,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// SONG NAME
              const Text(
                "Shiv Tandav",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Anuradha Paudwal",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),

              const Spacer(),

              /// SEEK BAR
              Slider(

                activeColor: Colors.deepPurple,

                inactiveColor: Colors.white24,

                value: controller.currentPosition.value
                    .inSeconds
                    .toDouble(),

                max: controller.totalDuration.value
                    .inSeconds
                    .toDouble(),

                onChanged: (value) {

                  controller.seek(
                    Duration(
                      seconds: value.toInt(),
                    ),
                  );
                },
              ),

              Padding(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 24,
                ),

                child: Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      formatDuration(
                        controller.currentPosition.value,
                      ),

                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    Text(
                      formatDuration(
                        controller.totalDuration.value,
                      ),

                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// CONTROLS
              Row(

                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,

                children: [

                  /// LOOP
                  IconButton(

                    onPressed:
                    controller.changeLoopMode,

                    icon: Icon(

                      controller.loopMode.value == 0
                          ? Icons.repeat
                          : controller.loopMode.value == 1
                          ? Icons.repeat_one
                          : Icons.repeat,

                      color: controller.loopMode.value == 0
                          ? Colors.white
                          : Colors.deepPurple,

                      size: 32,
                    ),
                  ),

                  /// PREVIOUS
                  IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),

                  /// PLAY BUTTON
                  GestureDetector(

                    onTap:
                    controller.togglePlay,

                    child: AnimatedContainer(

                      duration:
                      const Duration(milliseconds: 300),

                      width:
                      controller.isPlaying.value
                          ? 90
                          : 80,

                      height:
                      controller.isPlaying.value
                          ? 90
                          : 80,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepPurple,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple
                                .withOpacity(0.5),

                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),

                      child: Icon(
                        controller.isPlaying.value
                            ? Icons.pause
                            : Icons.play_arrow,

                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                  ),

                  /// NEXT
                  IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),

                  /// SPEED
                  PopupMenuButton<double>(

                    color: Colors.black87,

                    onSelected: controller.changeSpeed,

                    itemBuilder: (context) => [

                      const PopupMenuItem(
                        value: 0.5,
                        child: Text("0.5x"),
                      ),

                      const PopupMenuItem(
                        value: 1.0,
                        child: Text("1x"),
                      ),

                      const PopupMenuItem(
                        value: 1.5,
                        child: Text("1.5x"),
                      ),

                      const PopupMenuItem(
                        value: 2.0,
                        child: Text("2x"),
                      ),
                    ],

                    child: Container(

                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(12),

                        color: Colors.white10,
                      ),

                      child: Text(
                        "${controller.speed.value}x",

                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          );
        }),
      ),
    );
  }

  String formatDuration(Duration d) {

    final minutes =
    d.inMinutes.remainder(60).toString();

    final seconds =
    d.inSeconds.remainder(60).toString();

    return "$minutes:${seconds.padLeft(2, '0')}";
  }
}