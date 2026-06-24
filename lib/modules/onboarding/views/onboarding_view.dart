import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_page_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() =>
      _OnboardingViewState();
}

class _OnboardingViewState
    extends State<OnboardingView> {
  late final PageController pageController;
  late final OnboardingController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.find<OnboardingController>();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFFF8E7),
              Color(0xffFFF3E0),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              /// Skip
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Get.offAllNamed(
                      Routes.MAIN_NAVIGATION,
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Color(0xFFFF7043),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              /// Pages
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged:
                  controller.updatePage,
                  children: const [

                    OnboardingPageWidget(
                      image: "assets/images/onboarding1.png",
                      title: "Track Daily Jap",
                      subtitle:
                      "Monitor your malas and build consistency in your spiritual journey.",
                    ),

                    OnboardingPageWidget(
                      image: "assets/images/onboarding2.png",
                      title: "Mantras & Bhajans",
                      subtitle:
                      "Listen and chant powerful mantras and devotional songs anytime.",
                    ),

                    OnboardingPageWidget(
                      image: "assets/images/onboarding3.png",
                      title: "Grow Your Bhakti",
                      subtitle:
                      "Stay connected with Krishna through daily devotion and inspiration.",
                    ),
                  ],
                ),
              ),

              /// Indicator
              Obx(() {
                return Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: List.generate(
                    3,
                        (index) {
                      bool selected =
                          controller.currentPage.value ==
                              index;

                      return AnimatedContainer(
                        duration:
                        const Duration(
                          milliseconds: 350,
                        ),
                        margin:
                        const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        height: 8,
                        width:
                        selected ? 28 : 8,
                        decoration:
                        BoxDecoration(
                          gradient: selected
                              ? const LinearGradient(
                            colors: [
                              Color(
                                  0xFFFFA726),
                              Color(
                                  0xFFFF7043),
                            ],
                          )
                              : null,
                          color: selected
                              ? null
                              : Colors.grey
                              .shade300,
                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),

              const SizedBox(height: 25),

              /// Welcome Text
              const Text(
                "Begin Your Spiritual Journey 🙏",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5D4037),
                ),
              ),

              const SizedBox(height: 20),

              /// Button
              Padding(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(
                        0xFFFF7043,
                      ),
                      elevation: 8,
                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius
                            .circular(
                          18,
                        ),
                      ),
                    ),
                    onPressed: () {

                      if (controller.isLastPage) {

                        Get.offAllNamed(
                          Routes.MAIN_NAVIGATION,
                        );

                      } else {

                        pageController.nextPage(
                          duration:
                          const Duration(
                            milliseconds:
                            300,
                          ),
                          curve:
                          Curves.easeInOut,
                        );
                      }
                    },
                    child: Obx(
                          () => Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        children: [

                          Text(
                            controller.isLastPage
                                ? "Start Bhakti Journey"
                                : "Continue",
                            style:
                            const TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight
                                  .bold,
                              color:
                              Colors.white,
                            ),
                          ),

                          const SizedBox(
                              width: 8),

                          const Icon(
                            Icons
                                .arrow_forward_rounded,
                            color:
                            Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}