import 'package:bhakti_app/shared/controllers/global_jap_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final globalJap =
    Get.find<GlobalJapController>();

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,

        leading: const Icon(
          Icons.menu,
          color: Colors.deepPurple,
        ),

        title: const Text(
          "bhaktiverse",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        actions: const [

          Padding(
            padding: EdgeInsets.only(right: 16),

            child: Icon(
              Icons.notifications_none,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            /// BANNER
            _buildBanner(),

            const SizedBox(height: 24),

            /// DAILY JAP CARD
            _buildJapProgressCard(globalJap),

            const SizedBox(height: 24),


            /// GOD LIST
            const Padding(
              padding:
              EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Row(

                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,

                children: [

                  Text(
                    "Popular Gods",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  Text(
                    "View All",
                    style: TextStyle(
                      color:
                      Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// GOD LIST
            Obx(() {

              if (controller
                  .isLoading.value) {

                return const Center(
                  child:
                  CircularProgressIndicator(),
                );
              }

              return ListView.builder(

                shrinkWrap: true,

                physics:
                const NeverScrollableScrollPhysics(),

                itemCount:
                controller.gods.length,

                itemBuilder:
                    (context, index) {

                  final god =
                  controller.gods[index];

                  return Card(

                    margin:
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),

                    elevation: 3,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: ListTile(

                      contentPadding:
                      const EdgeInsets.all(
                        12,
                      ),

                      leading:
                      CircleAvatar(
                        radius: 35,

                        backgroundImage:
                        AssetImage(
                          god.imageUrl,
                        ),
                      ),

                      title: Text(
                        god.name,

                        style:
                        const TextStyle(
                          fontWeight:
                          FontWeight.bold,

                          fontSize: 20,
                        ),
                      ),

                      subtitle: Padding(

                        padding:
                        const EdgeInsets.only(
                          top: 6,
                        ),

                        child: Text(
                          god.nameMarathi,

                          style: TextStyle(
                            color: Colors
                                .grey
                                .shade700,
                          ),
                        ),
                      ),

                      trailing:
                      const Icon(
                        Icons
                            .arrow_forward_ios,
                        color:
                        Colors.deepPurple,
                      ),

                      onTap: () {

                        Get.toNamed(
                          '/god-detail',
                          arguments: god,
                        );
                      },
                    ),
                  );
                },
              );
            }),

            const SizedBox(height: 100),
          ],
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar:
      BottomNavigationBar(

        currentIndex: 0,

        selectedItemColor:
        Colors.deepPurple,

        unselectedItemColor:
        Colors.grey,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Mantras",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: "Songs",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  /// SECTION TITLE
  Widget _sectionTitle(String title) {

    return Padding(

      padding:
      const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      child: Text(
        title,

        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// BANNER
  Widget _buildBanner() {

    return CarouselSlider(

      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
      ),

      items: [

        "assets/images/ganesh1.jpeg",
        "assets/images/dhurga1.jpeg",
        "assets/images/krushna1.jpeg",
        "assets/images/shiv1.jpeg",

      ].map((url) {

        return Container(

          margin:
          const EdgeInsets.symmetric(
            horizontal: 0,
          ),

          decoration: BoxDecoration(

            borderRadius:
            BorderRadius.circular(24),

            image: DecorationImage(
              image: AssetImage(url),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }

  /// DAILY JAP CARD
  Widget _buildJapProgressCard(
      GlobalJapController globalJap) {

    return Obx(() {

      final completed =
          globalJap.completedMalas.value;

      final target =
          globalJap.dailyTarget.value;

      final progress =
      target == 0
          ? 0.0
          : completed / target;

      return Container(

        margin:
        const EdgeInsets.symmetric(
          horizontal: 16,
        ),

        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(

          gradient:
          const LinearGradient(
            colors: [
              Color(0xFF7E57C2),
              Color(0xFF5E35B1),
            ],
          ),

          borderRadius:
          BorderRadius.circular(24),

          boxShadow: [

            BoxShadow(
              color: Colors.deepPurple
                  .withOpacity(0.25),

              blurRadius: 20,

              offset:
              const Offset(0, 10),
            ),
          ],
        ),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Row(

              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,

              children: [

                const Text(
                  "Today's Jap Progress",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                IconButton(

                  onPressed: () {

                    editDailyTarget(
                      globalJap,
                    );
                  },

                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              "$completed / $target Malas",

              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            LinearProgressIndicator(

              value: progress,

              minHeight: 10,

              borderRadius:
              BorderRadius.circular(20),

              backgroundColor:
              Colors.white24,

              valueColor:
              const AlwaysStoppedAnimation(
                Colors.white,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "${(progress * 100).toInt()}% Completed",

              style: const TextStyle(
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(

                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.white,

                  foregroundColor: Colors.deepPurple,

                  elevation: 0,

                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                onPressed: () {

                  Get.toNamed('/jap');
                },

                icon: const Icon(Icons.self_improvement),

                label: const Text(

                  "Start Jap",

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  /// EDIT TARGET
  void editDailyTarget(
      GlobalJapController globalJap) {

    final controllerText =
    TextEditingController();

    controllerText.text =
        globalJap.dailyTarget.value
            .toString();

    Get.dialog(

      AlertDialog(

        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20),
        ),

        title:
        const Text("Set Daily Target"),

        content: TextField(

          controller: controllerText,

          keyboardType:
          TextInputType.number,

          decoration: InputDecoration(

            hintText:
            "Enter target malas",

            filled: true,

            fillColor:
            Colors.grey.shade100,

            border: OutlineInputBorder(

              borderRadius:
              BorderRadius.circular(
                16,
              ),

              borderSide:
              BorderSide.none,
            ),
          ),
        ),

        actions: [

          TextButton(

            onPressed: () {
              Get.back();
            },

            child: const Text(
              "Cancel",
            ),
          ),

          ElevatedButton(

            onPressed: () {

              globalJap.dailyTarget
                  .value =
                  int.tryParse(
                    controllerText.text,
                  ) ??
                      5;

              Get.back();
            },

            child: const Text(
              "Save",
            ),
          ),
        ],
      ),
    );
  }

  /// CATEGORIES
  Widget _buildCategories() {

    final items = [

      {
        "icon": Icons.temple_hindu,
        "title": "Gods",
        "color": Colors.purple,
      },

      {
        "icon": Icons.favorite,
        "title": "Mantras",
        "color": Colors.pink,
      },

      {
        "icon": Icons.music_note,
        "title": "Songs",
        "color": Colors.orange,
      },

      {
        "icon": Icons.headphones,
        "title": "Jap",
        "color": Colors.green,
      },

      {
        "icon": Icons.playlist_play,
        "title": "Playlist",
        "color": Colors.blue,
      },
    ];

    return SizedBox(

      height: 110,

      child: ListView.builder(

        scrollDirection:
        Axis.horizontal,

        itemCount: items.length,

        itemBuilder:
            (context, index) {

          final item = items[index];

          return GestureDetector(

            onTap: () {

              final title =
              item["title"];

              if (title == "Jap") {

                Get.toNamed('/jap');
              }

              else if (title ==
                  "Gods") {

                Get.snackbar(
                  "Gods",
                  "Coming Soon",
                );
              }

              else if (title ==
                  "Mantras") {

                Get.snackbar(
                  "Mantras",
                  "Coming Soon",
                );
              }

              else if (title ==
                  "Songs") {

                Get.snackbar(
                  "Songs",
                  "Coming Soon",
                );
              }

              else if (title ==
                  "Playlist") {

                Get.snackbar(
                  "Playlist",
                  "Coming Soon",
                );
              }
            },

            child: Container(

              width: 90,

              margin:
              const EdgeInsets.symmetric(
                horizontal: 8,
              ),

              child: Column(

                children: [

                  Container(

                    height: 70,
                    width: 70,

                    decoration:
                    BoxDecoration(

                      color:
                      (item["color"]
                      as Color)
                          .withOpacity(
                        0.15,
                      ),

                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: Icon(
                      item["icon"]
                      as IconData,

                      color:
                      item["color"]
                      as Color,

                      size: 34,
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    item["title"]
                    as String,

                    style:
                    const TextStyle(
                      fontWeight:
                      FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}