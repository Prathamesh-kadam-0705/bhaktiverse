import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../shared/controllers/global_jap_controller.dart';
import '../models/home_banner_model.dart';

class HomeController extends GetxController {

  final globalJap = Get.find<GlobalJapController>();


  final currentBanner = 0.obs;
  RxInt get completed => globalJap.completedMalas;
  RxInt get target => globalJap.dailyTarget;

  double get progress {
    if (target.value == 0) return 0.0;
    return completed.value / target.value;
  }



  final banners = [

    HomeBannerModel(
      image: AppAssets.ganesh,
      title: "Shree Ganesh",
    ),

    HomeBannerModel(
      image: AppAssets.shiva,
      title: "Mahadev",
    ),

    HomeBannerModel(
      image: AppAssets.krishna,
      title: "Shree Krishna",
    ),

    HomeBannerModel(
      image: AppAssets.durga,
      title: "Maa Durga",
    ),
  ];

  final gods = [

    {
      "name": "Ganesh",
      "image": "assets/images/ganesh.jpg",
    },

    {
      "name": "Shiva",
      "image": "assets/images/shiva.jpg",
    },

    {
      "name": "Krishna",
      "image": "assets/images/krishna.jpg",
    },

    {
      "name": "Durga",
      "image": "assets/images/durga.jpg",
    },
  ];

  void editDailyTarget() {

    final controllerText = TextEditingController();

    controllerText.text = globalJap.dailyTarget.value
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
}