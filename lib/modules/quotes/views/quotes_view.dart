import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quotes_controller.dart';
import '../widgets/quote_card_widget.dart';

class QuotesView extends GetView<QuotesController> {

  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Inspiration"),
      ),
      body: Center(
        child: Obx(
              () => QuoteCardWidget(
            quote:
            controller.currentQuote["verse"] ?? "",
            reference:
            controller.currentQuote["reference"] ?? "",
          ),
        ),
      ),
    );
  }
}