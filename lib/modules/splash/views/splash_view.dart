import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF8E7),
              Color(0xFFFFE0B2),
              Color(0xFFFFCC80),
            ],
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// LOGO
            Hero(
              tag: "app_logo",
              child: Container(
                height: 160,
                width: 160,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(.25),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),

                child: ClipOval(
                  child: Image.asset(
                    "assets/images/slash_screen_logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),

            const Text(
              "bhakti_app",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5D4037),
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Connect With Divine Energy",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 60),

            SizedBox(
              width: 35,
              height: 35,
              child: TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 0.8,
                  end: 1,
                ),
                duration: const Duration(
                  seconds: 1,
                ),
                curve: Curves.easeInOut,
                builder: (_, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: Image.asset(
                  "assets/images/slash_screen_logo.png",
                  width: 160,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "🙏 Hare Krishna 🙏",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}