import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';
import '../widgets/settings_tile_widget.dart';

class SettingsView extends GetView<SettingsController> {

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Settings"),
      ),

      body: Obx(
            () => Column(
              children: [

                SettingsTileWidget(
                  title: "Dark Mode",
                  trailing: Switch(
                    value: controller.isDarkMode.value,
                    onChanged: (_) => controller.toggleTheme(),
                  ),
                ),

                SettingsTileWidget(
                  title: "Notifications",
                  trailing: Switch(
                    value: controller.notificationsEnabled.value,
                    onChanged: (_) => controller.toggleNotifications(),
                  ),
                ),

                const Divider(),

                SettingsTileWidget(
                  title: "About App",
                  trailing: const Icon(Icons.info_outline),
                  onTap: () {
                    // We'll add About page later
                  },
                ),

                SettingsTileWidget(
                  title: "Logout",
                  trailing: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  onTap: controller.logout,
                ),

              ],
            ),
      ),
    );
  }
}