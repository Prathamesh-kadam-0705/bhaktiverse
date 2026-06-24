import 'package:get/get.dart';

class QuotesController extends GetxController {

  final quotes = [
    {
      "verse":
      "You have a right to perform your prescribed duties, but you are not entitled to the fruits of your actions.",
      "reference": "Bhagavad Gita 2.47",
    },
    {
      "verse":
      "For one who has conquered the mind, the mind is the best of friends.",
      "reference": "Bhagavad Gita 6.6",
    },
    {
      "verse":
      "Whatever action a great man performs, common men follow.",
      "reference": "Bhagavad Gita 3.21",
    },
  ];

  final currentQuote = {}.obs;

  @override
  void onInit() {
    super.onInit();
    loadDailyQuote();
  }

  void loadDailyQuote() {
    final index = DateTime.now().day % quotes.length;
    currentQuote.value = quotes[index];
  }
}