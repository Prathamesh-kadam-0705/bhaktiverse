import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';

import '../controllers/search_controller.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/search_result_tile.dart';

class SearchView extends GetView<SearchController> {

  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [

          SearchBarWidget(
            onChanged: controller.search,
          ),

          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount:
                controller.results.length,
                itemBuilder: (context, index) {

                  return SearchResultTile(
                    title:
                    controller.results[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}