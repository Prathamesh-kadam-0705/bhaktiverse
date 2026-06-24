import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/controllers/global_jap_controller.dart';

class JapController extends GetxController {

  final globalJap = Get.find<GlobalJapController>();

  final count = 0.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 0) {
      count.value--;
    }
  }

  void reset() {
    count.value = 0;
  }

  int get rounds => count.value ~/ 108;

  var isTapped = false.obs;


  var jap = JapCounterModel(
    mantra: "ॐ नमः शिवाय",
    godName: "Lord Shiva",
    target: 108,
  ).obs;

  /// TAP ACTION
  void incrementCount() {

    isTapped.value = true;

    Future.delayed(
      const Duration(milliseconds: 120),
          () {
        isTapped.value = false;
      },
    );

    jap.update((value) {

      if (value != null) {

        value.count++;

        /// ONE MALA COMPLETE
        if (value.count >= value.target) {

          globalJap.completedMalas.value++;

          value.count = 0;

          Get.snackbar(
            "🎉 Mala Completed",
            "Total Completed: ${globalJap.completedMalas.value}",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    });
  }



  /// RESET
  void resetCount() {
    jap.update((value) {
      if (value != null) {
        value.count = 0;
      }
    });
  }

  void editDailyTarget() {

    final textController = TextEditingController(
      text: globalJap.dailyTarget.value.toString(),
    );

    Get.dialog(

      AlertDialog(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        title: const Text("Set Daily Mala Target"),

        content: TextField(

          controller: textController,

          keyboardType: TextInputType.number,

          decoration: InputDecoration(

            hintText: "Enter target malas",

            filled: true,

            fillColor: Colors.grey.shade100,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        actions: [

          TextButton(

            onPressed: () {
              Get.back();
            },

            child: const Text("Cancel"),
          ),

          ElevatedButton(

            onPressed: () {

              globalJap.dailyTarget.value =
                  int.tryParse(textController.text) ?? 5;

              Get.back();
            },

            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  /// PROGRESS
  double get progress {
    if (jap.value.target == 0) return 0;
    return jap.value.count / jap.value.target;
  }

  /// COMPLETION CHECK
  bool get isCompleted {
    return jap.value.count >= jap.value.target;
  }
}

class JapCounterModel {
  String mantra;
  String godName;
  int target;
  int count;

  JapCounterModel({
    required this.mantra,
    required this.godName,
    required this.target,
    this.count = 0,
  });
}