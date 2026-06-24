import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButtons extends StatelessWidget {

  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(

      children: [

        Expanded(

          child: ElevatedButton.icon(

            onPressed: () {

              Get.toNamed('/mantras');
            },

            icon: const Icon(Icons.menu_book),

            label: const Text("View Mantras"),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(

          child: ElevatedButton.icon(

            onPressed: () {

              Get.toNamed('/jap');
            },

            icon: const Icon(Icons.self_improvement),

            label: const Text("Start Jap"),
          ),
        ),
      ],
    );
  }
}