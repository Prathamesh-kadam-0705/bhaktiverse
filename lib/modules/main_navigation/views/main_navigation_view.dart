import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../bhajans/views/bhajans_view.dart';
import '../../home/views/home_view.dart';
import '../../jap/views/jap_view.dart';
import '../../mantras/views/mantras_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/main_navigation_controller.dart';

class MainNavigationView extends GetView<MainNavigationController> {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeView(),
      const MantrasView(),
      const BhajansView(),
      const JapView(),
      const ProfileView(),
    ];

    return Obx(
          () => Scaffold(
        backgroundColor: AppColors.background,

        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: KeyedSubtree(
            key: ValueKey(
              controller.selectedIndex.value,
            ),
            child: pages[
            controller.selectedIndex.value],
          ),
        ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 15,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: NavigationBar(
            height: 72,

            backgroundColor: Colors.white,

            indicatorColor: Colors.transparent,

            selectedIndex:
            controller.selectedIndex.value,

            onDestinationSelected:
            controller.changeTab,

            labelBehavior:
            NavigationDestinationLabelBehavior
                .alwaysShow,

            destinations: [
              NavigationDestination(
                icon: const Icon(
                  Icons.home_outlined,
                ),
                selectedIcon:
                _selectedIcon(Icons.home),
                label: "Home",
              ),

              NavigationDestination(
                icon: const Icon(
                  Icons.menu_book_outlined,
                ),
                selectedIcon:
                _selectedIcon(
                  Icons.menu_book,
                ),
                label: "Mantras",
              ),

              NavigationDestination(
                icon: const Icon(
                  Icons.music_note_outlined,
                ),
                selectedIcon:
                _selectedIcon(
                  Icons.music_note,
                ),
                label: "Bhajans",
              ),

              NavigationDestination(
                icon: const Icon(
                  Icons.self_improvement_outlined,
                ),
                selectedIcon:
                _selectedIcon(
                  Icons.self_improvement,
                ),
                label: "Jap",
              ),

              NavigationDestination(
                icon: const Icon(
                  Icons.person_outline,
                ),
                selectedIcon:
                _selectedIcon(
                  Icons.person,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
        ),

        shape: BoxShape.circle,

        boxShadow: [
          BoxShadow(
            color:
            AppColors.primary.withOpacity(.35),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Icon(
        icon,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}