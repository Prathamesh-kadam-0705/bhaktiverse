import 'package:flutter/material.dart';

class DevotionStats extends StatelessWidget {

  final int mantras;
  final int bhajans;
  final int quotes;

  const DevotionStats({
    super.key,
    required this.mantras,
    required this.bhajans,
    required this.quotes,
  });

  Widget item(String value, String title) {

    return Column(
      children: [

        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.orange.shade50,

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceAround,

        children: [

          item("$mantras", "Mantras"),

          item("$bhajans", "Bhajans"),

          item("$quotes", "Quotes"),
        ],
      ),
    );
  }
}