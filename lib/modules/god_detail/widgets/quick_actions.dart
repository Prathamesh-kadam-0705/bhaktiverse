import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuickActions extends StatelessWidget {

  const QuickActions({super.key});

  Widget button(
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {

    return Expanded(

      child: GestureDetector(

        onTap: onTap,

        child: Container(

          height: 100,

          decoration: BoxDecoration(

            color: Colors.orange.shade50,

            borderRadius:
            BorderRadius.circular(20),
          ),

          child: Column(

            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              Icon(icon,size: 32),

              const SizedBox(height: 10),

              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Row(

      children: [

        button(
          Icons.menu_book,
          "Mantras",
              () => Get.toNamed('/mantras'),
        ),

        const SizedBox(width: 12),

        button(
          Icons.music_note,
          "Bhajans",
              () => Get.toNamed('/bhajans'),
        ),

        const SizedBox(width: 12),

        button(
          Icons.self_improvement,
          "Jap",
              () => Get.toNamed('/jap'),
        ),
      ],
    );
  }
}