import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/temples_controller.dart';
import '../widgets/temple_card_widget.dart';

class TemplesView extends GetView<TemplesController> {

  const TemplesView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Temples"),
      ),

      body: Obx(
            () => ListView.builder(
          itemCount: controller.temples.length,
          itemBuilder: (context, index) {

            final temple =
            controller.temples[index];

            return TempleCardWidget(
              name: temple["name"]!,
              city: temple["city"]!,
              deity: temple["deity"]!,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}