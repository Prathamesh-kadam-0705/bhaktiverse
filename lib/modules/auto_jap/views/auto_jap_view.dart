import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/auto_jap_controller.dart';

class AutoJapView extends GetView<AutoJapController> {
  const AutoJapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Auto Jap",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
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
              // Container(
              //   height: 180,
              //   width: 180,
              //
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //
              //     border: Border.all(
              //       color: AppColors.secondary,
              //       width: 4,
              //     ),
              //
              //     boxShadow: [
              //       BoxShadow(
              //         color:
              //         AppColors.primary.withOpacity(.25),
              //         blurRadius: 25,
              //         spreadRadius: 5,
              //       ),
              //     ],
              //
              //     image: DecorationImage(
              //       image: AssetImage(jap.image),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),

              // const SizedBox(height: 24),

              /// GOD NAME
              // Text(
              //   jap.godName,
              //   style: const TextStyle(
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //     color: AppColors.primary,
              //   ),
              // ),
              //
              // const SizedBox(height: 20),

              /// MANTRA CARD
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFF3E0),
                      Color(0xFFFFFBF5),
                    ],
                  ),

                  borderRadius: BorderRadius.circular(24),

                  border: Border.all(
                    color: AppColors.secondary,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color:
                      AppColors.primary.withOpacity(.08),
                      blurRadius: 15,
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: AppColors.primary,
                      size: 36,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      jap.mantra,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              /// PROGRESS
              Stack(
                alignment: Alignment.center,

                children: [
                  SizedBox(
                    width: 250,
                    height: 250,

                    child: CircularProgressIndicator(
                      value: controller.progress,

                      strokeWidth: 14,

                      backgroundColor:
                      AppColors.secondary
                          .withOpacity(.25),

                      valueColor:
                      const AlwaysStoppedAnimation(
                        AppColors.primary,
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
                          color: AppColors.primary,
                        ),
                      ),

                      Text(
                        "/ ${controller.target.value}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 35),

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
                      ? 95
                      : 110,

                  width:
                  controller.isPlaying.value
                      ? 95
                      : 110,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,

                      colors: [
                        Color(0xFFFFB74D),
                        Color(0xFFFF7043),
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary
                            .withOpacity(.35),

                        blurRadius: 25,
                        spreadRadius: 4,
                      ),
                    ],
                  ),

                  child: Icon(
                    controller.isPlaying.value
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,

                    size: 52,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              /// SPEED CARD
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary
                          .withOpacity(.08),

                      blurRadius: 15,
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

                      activeColor:
                      AppColors.primary,

                      inactiveColor:
                      AppColors.secondary
                          .withOpacity(.3),

                      onChanged:
                      controller.changeSpeed,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// RESET
              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    AppColors.primary,

                    elevation: 6,

                    padding:
                    const EdgeInsets.symmetric(
                      vertical: 15,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(18),
                    ),
                  ),

                  onPressed:
                  controller.resetJap,

                  icon: const Icon(
                    Icons.refresh_rounded,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Reset Jap",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }
}