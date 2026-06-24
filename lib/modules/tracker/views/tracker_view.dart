import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tracker_controller.dart';
import '../widgets/tracker_stat_card.dart';
import '../widgets/tracker_task_tile.dart';

class TrackerView extends GetView<TrackerController> {

  const TrackerView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Daily Tracker"),
      ),

      body: Obx(
            () => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              Row(
                children: [

                  Expanded(
                    child: TrackerStatCard(
                      title: "Rounds",
                      value:
                      "${controller.todayRounds.value}/${controller.targetRounds.value}",
                    ),
                  ),

                  Expanded(
                    child: TrackerStatCard(
                      title: "Streak",
                      value:
                      "${controller.streak.value} Days",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              TrackerTaskTile(
                title: "Bhagavad Gita Reading",
                value:
                controller.gitaReading.value,
                onChanged: (_) =>
                    controller.toggleGita(),
              ),

              TrackerTaskTile(
                title: "Attend Aarti",
                value:
                controller.aartiDone.value,
                onChanged: (_) =>
                    controller.toggleAarti(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}