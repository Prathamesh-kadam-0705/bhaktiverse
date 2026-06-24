import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';
import '../widgets/reminder_tile_widget.dart';

class NotificationsView
    extends GetView<NotificationsController> {

  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Reminders"),
      ),

      body: Obx(
            () => Column(
          children: [

            ReminderTileWidget(
              title: "Daily Jap Reminder",
              value:
              controller.japReminder.value,
              onChanged: (_) =>
                  controller.toggleJap(),
            ),

            ReminderTileWidget(
              title: "Gita Reading Reminder",
              value:
              controller.gitaReminder.value,
              onChanged: (_) =>
                  controller.toggleGita(),
            ),

            ReminderTileWidget(
              title: "Morning Prayer Reminder",
              value:
              controller.morningReminder.value,
              onChanged: (_) =>
                  controller.toggleMorning(),
            ),
          ],
        ),
      ),
    );
  }
}