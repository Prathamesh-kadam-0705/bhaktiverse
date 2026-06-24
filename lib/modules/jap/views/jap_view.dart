import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
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

              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
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
                
                
                            ),
                          ),
                
                          const Icon(Icons.more_vert),
                        ],
                      ),
                    ),
                
                    // const SizedBox(height: 30),
                    //
                    // /// GOD INFO CARD
                    // Container(
                    //
                    //   margin: const EdgeInsets.symmetric(
                    //     horizontal: 20,
                    //   ),
                    //
                    //   padding: const EdgeInsets.all(16),
                    //
                    //   decoration: BoxDecoration(
                    //
                    //     color: Colors.white,
                    //
                    //     borderRadius:
                    //     BorderRadius.circular(20),
                    //
                    //     boxShadow: [
                    //
                    //       BoxShadow(
                    //
                    //         color: Colors.deepPurple
                    //             .withOpacity(0.08),
                    //
                    //         blurRadius: 20,
                    //         spreadRadius: 2,
                    //       ),
                    //     ],
                    //   ),
                    //
                    //   child: Column(
                    //
                    //     children: [
                    //
                    //       CircleAvatar(
                    //
                    //         radius: 45,
                    //
                    //         backgroundColor:
                    //         Colors.deepPurple.shade50,
                    //
                    //         child: const Icon(
                    //
                    //           Icons.self_improvement,
                    //
                    //           size: 45,
                    //
                    //           color: Colors.deepPurple,
                    //         ),
                    //       ),
                    //
                    //       const SizedBox(height: 10),
                    //
                    //       Text(
                    //
                    //         jap.godName,
                    //
                    //         style: const TextStyle(
                    //
                    //           fontSize: 24,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //
                    //       const SizedBox(height: 6),
                    //
                    //       Text(
                    //
                    //         jap.mantra,
                    //
                    //         textAlign: TextAlign.center,
                    //
                    //         style: TextStyle(
                    //
                    //           fontSize: 16,
                    //
                    //           color: Colors.grey.shade700,
                    //
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                
                    const SizedBox(height: 30),
                
                    /// DAILY STATS
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.circular(24),
                
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(.08),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                
                        child: Column(
                          children: [
                
                            /// TOP
                            Row(
                              children: [
                
                                Container(
                                  height: 55,
                                  width: 55,
                
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.primary,
                                        AppColors.secondary,
                                      ],
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(16),
                                  ),
                
                                  child: const Icon(
                                    Icons.flag,
                                    color: Colors.white,
                                  ),
                                ),
                
                                const SizedBox(width: 15),
                
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                
                                    children: [
                
                                      Text(
                                        "Today's Target",
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                
                                      const SizedBox(height: 4),
                
                                      Text(
                                        "${controller.globalJap.dailyTarget.value} Mala",
                
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontSize: 24,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                
                                ElevatedButton.icon(
                                  onPressed: () {
                                    controller.editDailyTarget();
                                  },
                
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    AppColors.primary,
                                    foregroundColor:
                                    Colors.white,
                
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(14),
                                    ),
                                  ),
                
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 18,
                                  ),
                
                                  label: const Text(
                                    "Edit",
                                  ),
                                ),
                              ],
                            ),
                
                            const SizedBox(height: 25),
                
                            /// PROGRESS
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(20),
                
                              child: LinearProgressIndicator(
                                value: (
                                    controller.globalJap.completedMalas.value /
                                        controller.globalJap.dailyTarget.value
                                ).clamp(0.0, 1.0),
                
                                minHeight: 12,
                
                                backgroundColor:
                                Colors.grey.shade200,
                
                                valueColor:
                                AlwaysStoppedAnimation(
                                  AppColors.primary,
                                ),
                              ),
                            ),
                
                            const SizedBox(height: 15),
                
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                
                              children: [
                
                                Text(
                                  "${controller.globalJap.completedMalas.value} / ${controller.globalJap.dailyTarget.value} Mala",
                
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                
                                Text(
                                  "${((controller.globalJap.completedMalas.value / controller.globalJap.dailyTarget.value) * 100).clamp(0, 100).toInt()}%",
                
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                
                    const SizedBox(height: 50),
                
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
                
                              gradient: const RadialGradient(
                                colors: [
                                  Color(0xFFFFCC80),
                                  Color(0xFFFF9800),
                                  Color(0xFFE65100),
                                ],
                                radius: 0.9,
                              ),
                
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.35),
                                  blurRadius: 25,
                                  spreadRadius: 5,
                                ),
                                BoxShadow(
                                  color: Colors.deepOrange.withOpacity(0.20),
                                  blurRadius: 50,
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
                
                    const SizedBox(height: 50),
                
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
                
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Jap Counter'),
  //     ),
  //     body: Center(
  //       child: Obx(
  //             () => Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               '${controller.count.value}',
  //               style: const TextStyle(
  //                 fontSize: 50,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             Text(
  //               'Rounds: ${controller.rounds}',
  //             ),
  //             const SizedBox(height: 30),
  //             FloatingActionButton(
  //               onPressed: controller.increment,
  //               child: const Icon(Icons.add),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}