import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBanner extends GetView<HomeController> {

  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        CarouselSlider.builder(

          itemCount: controller.banners.length,

          itemBuilder: (
              context,
              index,
              realIndex,
              ) {

            final banner =
            controller.banners[index];

            return Container(

              margin: const EdgeInsets.symmetric(
                horizontal: 6,
              ),

              decoration: BoxDecoration(

                borderRadius:
                BorderRadius.circular(24),

                image: DecorationImage(

                  image: AssetImage(
                    banner.image,
                  ),

                  fit: BoxFit.cover,
                ),
              ),

              child: Container(

                decoration: BoxDecoration(

                  borderRadius:
                  BorderRadius.circular(24),

                  gradient:
                  LinearGradient(

                    begin: Alignment.topCenter,

                    end: Alignment.bottomCenter,

                    colors: [

                      Colors.transparent,

                      Colors.black
                          .withOpacity(0.6),
                    ],
                  ),
                ),

                padding:
                const EdgeInsets.all(20),

                alignment:
                Alignment.bottomLeft,

                child: Text(

                  banner.title,

                  style: const TextStyle(

                    color: Colors.white,

                    fontSize: 24,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            );
          },

          options: CarouselOptions(

            height: 180,

            viewportFraction: 0.92,

            autoPlay: true,

            enlargeCenterPage: true,

            onPageChanged: (
                index,
                reason,
                ) {

              controller.currentBanner
                  .value = index;
            },
          ),
        ),

        const SizedBox(height: 12),

        Obx(() {
          return Row(
            mainAxisAlignment:
            MainAxisAlignment.center,

            children: List.generate(
              controller.banners.length,
                  (index) {

                final isSelected =
                    controller.currentBanner.value ==
                        index;

                return AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 350,
                  ),

                  curve: Curves.easeInOut,

                  margin:
                  const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),

                  width: isSelected ? 32 : 8,
                  height: 8,

                  decoration: BoxDecoration(

                    gradient: isSelected
                        ? const LinearGradient(
                      colors: [
                        Color(0xffFFB300),
                        Color(0xffFF7043),
                      ],
                    )
                        : null,

                    color: isSelected
                        ? null
                        : Colors.grey.shade300,

                    borderRadius:
                    BorderRadius.circular(20),

                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: const Color(
                          0xffFF9800,
                        ).withOpacity(.35),

                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ]
                        : [],
                  ),
                );
              },
            ),
          );
        })
      ],
    );
  }
}