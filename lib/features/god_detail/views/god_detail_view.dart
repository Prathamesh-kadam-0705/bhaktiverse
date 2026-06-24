import 'package:bhakti_app/features/auto_jap/models/auto_jap_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/god_detail_controller.dart';

class GodDetailView extends GetView<GodDetailController> {

  const GodDetailView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: Column(

          children: [

            /// HEADER
            Stack(

              children: [

                Container(
                  height: 280,
                  width: double.infinity,

                  decoration: BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage(
                          controller.selectedGod.value?.imageUrl ?? ""
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  height: 280,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 20,
                  bottom: 30,

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        controller.selectedGod.value?.name ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        controller.selectedGod.value?.description ?? "",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// TABS
            Obx(() {

              return Container(

                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                padding: const EdgeInsets.all(6),

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius:
                  BorderRadius.circular(16),
                ),

                child: Row(

                  children: [

                    _tabButton(
                      title: "Songs",
                      index: 0,
                    ),

                    _tabButton(
                      title: "Jap",
                      index: 1,
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 20),

            /// CONTENT
            Expanded(

              child: Obx(() {

                if (controller.selectedTab.value == 0) {

                  return ListView.builder(

                    itemCount: controller.songs.length,

                    itemBuilder: (context, index) {

                      final song =
                      controller.songs[index];

                      return ListTile(

                        leading: ClipRRect(

                          borderRadius:
                          BorderRadius.circular(12),

                          child: Image.asset(
                            song.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),

                        title: Text(song.title),

                        subtitle: Text(song.singer),

                        trailing: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.deepPurple,
                          size: 34,
                        ),

                        onTap: () {


                          Get.toNamed('/music-player',
                              arguments: song);
                        },
                      );
                    },
                  );
                }

                /// JAP LIST
                return ListView.builder(

                  itemCount: controller.japs.length,

                  itemBuilder: (context, index) {

                    final jap =
                    controller.japs[index];

                    return ListTile(

                      leading: CircleAvatar(
                        backgroundColor:
                        Colors.deepPurple.shade100,

                        child: const Icon(
                          Icons.self_improvement,
                          color: Colors.deepPurple,
                        ),
                      ),

                      title: Text(jap.mantra),

                      subtitle: Text(jap.godName),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),

                      onTap: () {

                        final targetController = TextEditingController();

                        targetController.text = "108";

                        Get.dialog(

                          AlertDialog(

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),

                            title: const Text(
                              "Set Jap Target",
                            ),

                            content: TextField(

                              controller: targetController,

                              keyboardType: TextInputType.number,

                              decoration: InputDecoration(

                                hintText: "Enter Target",

                                filled: true,

                                fillColor: Colors.grey.shade100,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            actions: [

                              TextButton(

                                onPressed: () {

                                  Get.back();
                                },

                                child: const Text("Cancel"),
                              ),

                              ElevatedButton(

                                onPressed: () {

                                  final target =
                                      int.tryParse(targetController.text) ?? 108;

                                  Get.back();

                                  Get.toNamed(

                                    '/auto-jap',

                                    arguments: {

                                      'jap': jap,

                                      'target': target,
                                    },
                                  );
                                },

                                child: const Text("Start"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  /// TAB BUTTON
  Widget _tabButton({
    required String title,
    required int index,
  }) {

    final isSelected =
        controller.selectedTab.value == index;

    return Expanded(

      child: GestureDetector(

        onTap: () {

          controller.changeTab(index);
        },

        child: AnimatedContainer(

          duration:
          const Duration(milliseconds: 300),

          padding:
          const EdgeInsets.symmetric(vertical: 14),

          decoration: BoxDecoration(

            color: isSelected
                ? Colors.deepPurple
                : Colors.transparent,

            borderRadius:
            BorderRadius.circular(14),
          ),

          child: Center(

            child: Text(

              title,

              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}