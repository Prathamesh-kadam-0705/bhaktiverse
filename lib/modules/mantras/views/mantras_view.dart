import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/mantras_controller.dart';
import '../widgets/mantra_card.dart';

class MantrasView extends GetView<MantrasController> {
  const MantrasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        title: const Text("Mantras"),
        centerTitle: true,
      ),

      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 20,
          ),
          itemCount: controller.mantras.length,
          itemBuilder: (context, index) {

            final mantra =
            controller.mantras[index];

            return MantraCard(
              title: mantra["title"]!,
              subtitle: mantra["subtitle"]!,
              onTap: () {

                /// Open mantra detail page
              },
            );
          },
        );
      }),
    );
  }
}