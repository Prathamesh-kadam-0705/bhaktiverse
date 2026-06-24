import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {

    final hour = DateTime.now().hour;

    String greeting = "जय श्री कृष्ण";

    if (hour < 12) {
      greeting = "सुप्रभात 🙏";
    } else if (hour < 17) {
      greeting = "राधे राधे 🌸";
    } else {
      greeting = "हरि ॐ 🪔";
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      child: Row(
        children: [

          /// LOGO
          Container(
            height: 58,
            width: 58,

            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xffFFB300),
                  Color(0xffFF7043),
                ],
              ),

              borderRadius:
              BorderRadius.circular(18),

              boxShadow: [
                BoxShadow(
                  color:
                  Colors.orange.withOpacity(.25),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: const Icon(
              Icons.temple_hindu,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 14),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  greeting,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                    fontWeight:
                    FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 2),

                const Text(
                  "bhakti_app",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                    FontWeight.bold,
                    color: Color(
                      0xff4E342E,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// NOTIFICATION
          GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.NOTIFICATIONS,
              );
            },

            child: Container(
              padding:
              const EdgeInsets.all(10),

              decoration: BoxDecoration(
                color:
                Colors.orange.shade50,

                shape: BoxShape.circle,
              ),

              child: Stack(
                children: [

                  const Icon(
                    Icons.notifications_none,
                    size: 26,
                  ),

                  Positioned(
                    right: 0,
                    top: 0,

                    child: Container(
                      height: 10,
                      width: 10,

                      decoration:
                      const BoxDecoration(
                        color: Colors.red,
                        shape:
                        BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}