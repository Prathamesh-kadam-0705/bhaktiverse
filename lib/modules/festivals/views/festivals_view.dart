import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/festivals_controller.dart';
import '../widgets/festival_card_widget.dart';

class FestivalsView extends GetView<FestivalsController> {

  const FestivalsView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Festival Calendar"),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.festivals.length,
          itemBuilder: (context, index) {

            final festival =
            controller.festivals[index];

            return FestivalCardWidget(
              name: festival["name"]!,
              date: festival["date"]!,
              description: festival["description"]!,
            );
          },
        ),
      ),
    );
  }
}