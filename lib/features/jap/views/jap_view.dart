import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/jap_controller.dart';

class JapView extends GetView<JapController> {

  const JapView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            colors: [

              Color(0xFFF6F0FF),
              Color(0xFFEDE7F6),
              Colors.white,
            ],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Obx(() {

          final jap = controller.jap.value;

          return SafeArea(

            child: SingleChildScrollView(

              physics: const BouncingScrollPhysics(),

              child: Column(

                children: [

                  const SizedBox(height: 10),

                  /// TOP BAR
                  Padding(

                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),

                    child: Row(

                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        GestureDetector(

                          onTap: () {
                            Get.back();
                          },

                          child: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),

                        Text(

                          "Jap Counter",

                          style: TextStyle(

                            fontSize: 22,
                            fontWeight: FontWeight.bold,

                            color:
                            Colors.deepPurple.shade700,
                          ),
                        ),

                        const Icon(Icons.more_vert),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// GOD INFO CARD
                  Container(

                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(20),

                      boxShadow: [

                        BoxShadow(

                          color: Colors.deepPurple
                              .withOpacity(0.08),

                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),

                    child: Column(

                      children: [

                        CircleAvatar(

                          radius: 45,

                          backgroundColor:
                          Colors.deepPurple.shade50,

                          child: const Icon(

                            Icons.self_improvement,

                            size: 45,

                            color: Colors.deepPurple,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(

                          jap.godName,

                          style: const TextStyle(

                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(

                          jap.mantra,

                          textAlign: TextAlign.center,

                          style: TextStyle(

                            fontSize: 16,

                            color: Colors.grey.shade700,

                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DAILY STATS
                  Padding(

                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),

                    child: Container(

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius:
                        BorderRadius.circular(22),

                        boxShadow: [

                          BoxShadow(

                            color: Colors.deepPurple
                                .withOpacity(0.08),

                            blurRadius: 20,
                          ),
                        ],
                      ),

                      child: Column(

                        children: [

                          Row(

                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                            children: [

                              Column(

                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  const Text(

                                    "Today's Target",

                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(

                                    "${controller.globalJap.dailyTarget.value} Mala",

                                    style: const TextStyle(

                                      fontSize: 24,

                                      fontWeight:
                                      FontWeight.bold,

                                      color:
                                      Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),

                              ElevatedButton.icon(

                                style:
                                ElevatedButton.styleFrom(

                                  backgroundColor:
                                  Colors.deepPurple
                                      .shade50,

                                  foregroundColor:
                                  Colors.deepPurple,
                                ),

                                onPressed: () {

                                  controller
                                      .editDailyTarget();
                                },

                                icon: const Icon(
                                  Icons.edit,
                                ),

                                label: const Text(
                                  "Edit",
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          LinearProgressIndicator(

                            value: (

                                controller.globalJap
                                    .completedMalas.value /

                                    controller.globalJap
                                        .dailyTarget.value

                            ).clamp(0.0, 1.0),

                            minHeight: 12,

                            borderRadius:
                            BorderRadius.circular(20),

                            backgroundColor:
                            Colors.grey.shade200,
                          ),

                          const SizedBox(height: 12),

                          Text(

                            "${controller.globalJap.completedMalas.value} / ${controller.globalJap.dailyTarget.value} Mala Completed",

                            style: const TextStyle(

                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// JAP COUNTER CIRCLE
                  GestureDetector(

                    onTap: controller.incrementCount,

                    child: Obx(() {

                      final count = jap.count;

                      return AnimatedScale(

                        scale:
                        controller.isTapped.value
                            ? 0.92
                            : 1.0,

                        duration:
                        const Duration(milliseconds: 120),

                        curve: Curves.easeOut,

                        child: AnimatedContainer(

                          duration:
                          const Duration(milliseconds: 300),

                          curve: Curves.easeOut,

                          width: 200,
                          height: 200,

                          decoration: BoxDecoration(

                            shape: BoxShape.circle,

                            gradient:
                            const RadialGradient(

                              colors: [

                                Color(0xFF7E57C2),
                                Color(0xFF5E35B1),
                                Color(0xFF311B92),
                              ],

                              radius: 0.85,
                            ),

                            boxShadow: [

                              BoxShadow(

                                color: Colors.deepPurple
                                    .withOpacity(0.4),

                                blurRadius: 30,
                                spreadRadius: 5,
                              ),

                              BoxShadow(

                                color: Colors.deepPurple
                                    .withOpacity(0.2),

                                blurRadius: 60,
                                spreadRadius: 10,
                              ),
                            ],
                          ),

                          child: Center(

                            child: AnimatedSwitcher(

                              duration:
                              const Duration(milliseconds: 200),

                              transitionBuilder:
                                  (child, animation) {

                                return ScaleTransition(

                                  scale: animation,
                                  child: child,
                                );
                              },

                              child: Column(

                                key: ValueKey(count),

                                mainAxisAlignment:
                                MainAxisAlignment.center,

                                children: [

                                  Text(

                                    "$count",

                                    style: const TextStyle(

                                      fontSize: 54,

                                      fontWeight:
                                      FontWeight.bold,

                                      color: Colors.white,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  const Text(

                                    "TAP",

                                    style: TextStyle(

                                      fontSize: 16,

                                      letterSpacing: 2,

                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 30),

                  /// ACTION BUTTONS
                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,

                    children: [

                      ElevatedButton.icon(

                        style:
                        ElevatedButton.styleFrom(

                          backgroundColor:
                          Colors.deepPurple.shade50,

                          foregroundColor:
                          Colors.deepPurple,

                          elevation: 0,

                          shape: RoundedRectangleBorder(

                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                        ),

                        onPressed:
                        controller.resetCount,

                        icon: const Icon(
                          Icons.refresh,
                        ),

                        label: const Text(
                          "Reset",
                        ),
                      ),

                      ElevatedButton.icon(

                        style:
                        ElevatedButton.styleFrom(

                          backgroundColor:
                          Colors.pink.shade50,

                          foregroundColor:
                          Colors.pink,

                          elevation: 0,

                          shape: RoundedRectangleBorder(

                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                        ),

                        onPressed: () {},

                        icon: const Icon(
                          Icons.favorite,
                        ),

                        label: const Text(
                          "Save",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}