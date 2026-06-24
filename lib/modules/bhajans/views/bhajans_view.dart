import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/bhajans_controller.dart';
import '../widgets/bhajan_card_widget.dart';

class BhajansView extends GetView<BhajansController> {
  const BhajansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bhajans"),
      ),

      body: Column(
        children: [

          /// Header
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFFB74D),
                  Color(0xFFFF7043),
                ],
              ),
              borderRadius:
              BorderRadius.circular(24),
            ),
            child: const Row(
              children: [

                Icon(
                  Icons.headphones,
                  color: Colors.white,
                  size: 40,
                ),

                SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Devotional Bhajans",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Listen and connect with devotion",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding:
                const EdgeInsets.only(
                  bottom: 20,
                ),
                itemCount:
                controller.bhajans.length,
                itemBuilder:
                    (context, index) {

                  final bhajan =
                  controller.bhajans[index];

                  return BhajanCardWidget(
                    title: bhajan["title"]!,
                    singer: bhajan["singer"]!,
                    duration:
                    bhajan["duration"]!,
                    onTap: () {
                      Get.snackbar(
                        "Now Playing 🎵",
                        bhajan["title"]!,
                        snackPosition:
                        SnackPosition.BOTTOM,
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}