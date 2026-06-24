import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_banner.dart';
import '../widgets/featured_mantras.dart';

import '../widgets/home_header.dart';
import '../widgets/jap_card.dart';
import '../widgets/quick_actions.dart';
import '../widgets/gods_section.dart';

class HomeView extends GetView<HomeController>  {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(
        0xffF8F5FF,
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            children: [

              const SizedBox(height: 20),

              const HomeHeader(),

              const SizedBox(height: 18),

              const HomeBanner(),

              const SizedBox(height: 18),

              Obx(
                    () => JapCard(
                  completed: controller.completed.value,
                  target: controller.target.value,
                  onEdit: controller.editDailyTarget,
                ),
              ),

              const SizedBox(height: 25),

              const QuickActions(),

              const SizedBox(height: 30),

              const Padding(

                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                child: Align(

                  alignment:
                  Alignment.centerLeft,

                  child: Text(

                    "Popular Gods",

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const GodsSection(),

              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Featured Mantras",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const FeaturedMantras(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}