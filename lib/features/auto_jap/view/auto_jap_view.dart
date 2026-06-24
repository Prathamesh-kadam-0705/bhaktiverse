import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auto_jap_controller.dart';

class AutoJapView extends GetView<AutoJapController> {

  const AutoJapView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF6F2FF),

      appBar: AppBar(

        backgroundColor: Colors.transparent,

        elevation: 0,

        centerTitle: true,

        title: const Text(
          "Auto Jap",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Obx(() {

        final jap = controller.selectedJap.value;

        if (jap == null) {

          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(

            children: [

              const SizedBox(height: 10),

              /// GOD IMAGE
              Container(

                height: 170,
                width: 170,

                decoration: BoxDecoration(

                  shape: BoxShape.circle,

                  boxShadow: [

                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.25),
                      blurRadius: 30,
                      spreadRadius: 8,
                    ),
                  ],

                  image: DecorationImage(
                    image: AssetImage(jap.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// GOD NAME
              Text(

                jap.godName,

                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 12),

              /// MANTRA
              Container(

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [

                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                    ),
                  ],
                ),

                child: Text(

                  jap.mantra,

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// PROGRESS CIRCLE
              Stack(

                alignment: Alignment.center,

                children: [

                  SizedBox(

                    width: 260,
                    height: 260,

                    child: CircularProgressIndicator(

                      value: controller.progress,

                      strokeWidth: 14,

                      backgroundColor:
                      Colors.deepPurple.shade100,

                      valueColor:
                      const AlwaysStoppedAnimation(
                        Colors.deepPurple,
                      ),
                    ),
                  ),

                  Column(

                    children: [

                      Text(

                        "${controller.count.value}",

                        style: const TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),

                      Text(

                        "/ ${controller.target.value}",

                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// PLAY BUTTON
              GestureDetector(

                onTap: () {

                  if (controller.isPlaying.value) {

                    controller.stopJap();

                  } else {

                    controller.startJap();
                  }
                },

                child: AnimatedContainer(

                  duration:
                  const Duration(milliseconds: 250),

                  height:
                  controller.isPlaying.value
                      ? 90
                      : 100,

                  width:
                  controller.isPlaying.value
                      ? 90
                      : 100,

                  decoration: BoxDecoration(

                    shape: BoxShape.circle,

                    gradient: const LinearGradient(

                      colors: [
                        Colors.deepPurple,
                        Colors.purple,
                      ],
                    ),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.35),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),

                  child: Icon(

                    controller.isPlaying.value
                        ? Icons.pause
                        : Icons.play_arrow,

                    size: 46,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// SPEED
              Container(

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [

                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                    ),
                  ],
                ),

                child: Column(

                  children: [

                    Text(

                      "Mantra Speed ${controller.speed.value.toStringAsFixed(1)}x",

                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Slider(

                      value: controller.speed.value,

                      min: 0.5,

                      max: 2.0,

                      divisions: 6,

                      activeColor: Colors.deepPurple,

                      onChanged: controller.changeSpeed,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// RESET
              ElevatedButton.icon(

                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.deepPurple,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 14,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(18),
                  ),
                ),

                onPressed: controller.resetJap,

                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),

                label: const Text(

                  "Reset Jap",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        );
      }),
    );
  }
}