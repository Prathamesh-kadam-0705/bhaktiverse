import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/profile_controller.dart';
import '../widgets/profile_menu_tile.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Obx(
            () => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                /// PROFILE HEADER
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFFA726),
                        Color(0xFFFF7043),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(.25),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [

                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 36,
                            color: Color(0xFFFF7043),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              controller.userName.value,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              "Hare Krishna 🙏",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Bhakti Journey Continues",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                /// STATS
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [

                      Expanded(
                        child: _StatCard(
                          icon: Icons.self_improvement,
                          title: "Rounds",
                          value:
                          "${controller.totalRounds.value}",
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: _StatCard(
                          icon:
                          Icons.local_fire_department,
                          title: "Streak",
                          value:
                          "${controller.streakDays.value}",
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// DAILY INSPIRATION
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange
                            .withOpacity(.08),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      CircleAvatar(
                        radius: 24,
                        backgroundColor:
                        Colors.orange.shade50,
                        child: const Icon(
                          Icons.auto_awesome,
                          color: Colors.deepOrange,
                        ),
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        "Daily Inspiration",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        '"The mind acts like an enemy for those who do not control it."',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                          Colors.grey.shade700,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "- Bhagavad Gita",
                        style: TextStyle(
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// QUICK ACCESS TITLE
                const Padding(
                  padding:
                  EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Align(
                    alignment:
                    Alignment.centerLeft,
                    child: Text(
                      "Quick Access",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// QUICK ACTIONS
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics:
                    const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.4,
                    children: [

                      _QuickCard(
                        title: "Favorites",
                        icon: Icons.favorite,
                        onTap: () {
                          Get.toNamed(
                            Routes.FAVORITES,
                          );
                        },
                      ),

                      _QuickCard(
                        title: "Temples",
                        icon: Icons.temple_hindu,
                        onTap: () {
                          Get.toNamed(
                            Routes.TEMPLES,
                          );
                        },
                      ),

                      _QuickCard(
                        title: "Festivals",
                        icon: Icons.celebration,
                        onTap: () {
                          Get.toNamed(
                            Routes.FESTIVALS,
                          );
                        },
                      ),

                      _QuickCard(
                        title: "Quotes",
                        icon: Icons.format_quote,
                        onTap: () {
                          Get.toNamed(
                            Routes.QUOTES,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// SETTINGS
                ProfileMenuTile(
                  icon: Icons.settings,
                  title: "Settings",
                  onTap: () {
                    Get.toNamed(
                      Routes.SETTINGS,
                    );
                  },
                ),

                ProfileMenuTile(
                  icon: Icons.info_outline,
                  title: "About App",
                  onTap: () {},
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color:
            Colors.orange.withOpacity(.08),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        children: [

          Icon(
            icon,
            color: AppColors.primary,
            size: 28,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _QuickCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
      BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFFF3E0),
              Colors.white,
            ],
          ),
          borderRadius:
          BorderRadius.circular(20),
          border: Border.all(
            color: Colors.orange.shade100,
          ),
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              size: 32,
              color: AppColors.primary,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}