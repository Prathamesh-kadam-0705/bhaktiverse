import 'package:bhakti_app/shared/models/god_model.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
class GodsSection extends StatelessWidget {
  const GodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        scrollDirection: Axis.horizontal,
        children: const [

          _GodItem(
            god: GodModel(
              id: "ganesh",
              name: "Lord Ganesha",
              marathiName: "श्री गणेश",
              image: AppAssets.ganesh1,
              description:
              "Lord Ganesha is the remover of obstacles and the god of wisdom and prosperity.",
            ),
          ),

          _GodItem(
            god: GodModel(
              id: "shiva",
              name: "Lord Shiva",
              marathiName: "महादेव",
              image: AppAssets.shiva1,
              description:
              "Lord Shiva is the destroyer of evil and transformer of the universe.",
            ),
          ),

          _GodItem(
            god: GodModel(
              id: "krishna",
              name: "Lord Krishna",
              marathiName: "श्री कृष्ण",
              image: AppAssets.krishna1,
              description:
              "Lord Krishna is the embodiment of love and divine wisdom.",
            ),
          ),

          _GodItem(
            god: GodModel(
              id: "durga",
              name: "Maa Durga",
              marathiName: "दुर्गा माता",
              image: AppAssets.durga1,
              description:
              "Maa Durga is the goddess of power and protection.",
            ),
          ),
        ],
      ),
    );
  }
}


class _GodItem extends StatelessWidget {
  final GodModel god;

  const _GodItem({
    required this.god,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        Get.toNamed(
          Routes.GOD_DETAIL,
          arguments: god,
        );
      },

      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
        ),
        child: Column(
          children: [

            Hero(
              tag: god.id,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orange,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.25),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 42,
                  backgroundImage:
                  AssetImage(god.image),
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              god.name.replaceAll("Lord ", ""),
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