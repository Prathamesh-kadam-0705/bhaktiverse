import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "icon": Icons.temple_hindu,
        "title": "Temple",
        "route": Routes.TEMPLES,
      },
      {
        "icon": Icons.celebration,
        "title": "Festivals",
        "route": Routes.FESTIVALS,
      },
      {
        "icon": Icons.format_quote,
        "title": "Quotes",
        "route": Routes.QUOTES,
      },
      {
        "icon": Icons.favorite,
        "title": "Favorites",
        "route": Routes.FAVORITES,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: items.map((e) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(
                e["route"] as String,
              );
            },
            child: Column(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFFB74D),
                        Color(0xFFFF7043),
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color:
                        Colors.orange.withOpacity(0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    e["icon"] as IconData,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  e["title"] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}