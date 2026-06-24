import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';
import '../widgets/favorite_item_tile.dart';

class FavoritesView extends GetView<FavoritesController> {

  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Favorites"),
      ),

      body: Obx(() {

        if (controller.favorites.isEmpty) {
          return const Center(
            child: Text("No favorites yet"),
          );
        }

        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {

            final item =
            controller.favorites[index];

            return FavoriteItemTile(
              title: item["title"]!,
              type: item["type"]!,
              onDelete: () =>
                  controller.removeFavorite(index),
            );
          },
        );
      }),
    );
  }
}