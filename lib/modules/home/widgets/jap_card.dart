import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../main_navigation/controllers/main_navigation_controller.dart';

class JapCard extends StatelessWidget {
  final int completed;
  final int target;
  final VoidCallback? onEdit;

  const JapCard({
    super.key,
    required this.completed,
    required this.target,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final progress = target == 0 ? 0.0 : completed / target;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),

        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffe1954a),
            Color(0xffFF6F00),
          ],
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(.30),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 12),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          /// HEADER
          Row(
            children: [

              Container(
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.18),
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.self_improvement,
                  color: Colors.white,
                  size: 28,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: const [

                    Text(
                      "Daily Jap",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      "Spiritual Progress",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight:
                        FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.18),
                  borderRadius:
                  BorderRadius.circular(14),
                ),

                child: IconButton(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          /// COUNT
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.end,

            children: [

              Text(
                "$completed",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                " / $target Mala",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// PROGRESS BAR
          Stack(
            children: [

              Container(
                height: 14,

                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius:
                  BorderRadius.circular(30),
                ),
              ),

              FractionallySizedBox(
                widthFactor: progress,

                child: Container(
                  height: 14,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: [

              Text(
                "${(progress * 100).toInt()}% Completed",
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                "${target - completed} Remaining",
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          /// BUTTON
          SizedBox(
            width: double.infinity,

            child: ElevatedButton.icon(
              onPressed: () {

                Get.find<
                    MainNavigationController>()
                    .changeTab(3);
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,

                foregroundColor:
                AppColors.primary,

                elevation: 0,

                padding:
                const EdgeInsets.symmetric(
                  vertical: 15,
                ),

                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20),
                ),
              ),

              icon: const Icon(
                Icons.auto_awesome,
              ),

              label: const Text(
                "Start Jap",
                style: TextStyle(
                  fontWeight:
                  FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}