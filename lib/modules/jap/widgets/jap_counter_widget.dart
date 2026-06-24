import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class JapCounterWidget extends StatelessWidget {
  final int count;
  final VoidCallback onTap;

  const JapCounterWidget({
    super.key,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 230,
        height: 230,

        decoration: BoxDecoration(
          shape: BoxShape.circle,

          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
          ),

          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(.35),
              blurRadius: 25,
              spreadRadius: 5,
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "$count",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Hari Bol 🙏",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}