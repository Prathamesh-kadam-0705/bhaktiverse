import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/god_detail_controller.dart';
import '../widgets/devotion_stats.dart';
import '../widgets/god_banner.dart';
import '../widgets/god_info_card.dart';
import '../widgets/mantra_preview.dart';
import '../widgets/quick_actions.dart';
import '../widgets/quote_card.dart';

class GodDetailView extends GetView<GodDetailController> {

  const GodDetailView({super.key});

  @override
  Widget build(BuildContext context) {

    final god = controller.god;

    return Scaffold(

      appBar: AppBar(

        title: Text(god.name),

        centerTitle: true,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Hero(

              tag: god.id,

              child: GodBanner(
                image: god.image,
              ),
            ),

            const SizedBox(height: 20),

            GodInfoCard(

              name: god.name,

              marathiName:
              god.marathiName,

              description:
              god.description,
            ),

            const SizedBox(height: 20),

            const DevotionStats(

              mantras: 12,

              bhajans: 18,

              quotes: 25,
            ),

            const SizedBox(height: 20),

            const QuickActions(),

            const SizedBox(height: 20),

            const MantraPreview(),

            const SizedBox(height: 20),

            const QuoteCard(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}