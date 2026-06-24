import 'package:flutter/material.dart';

class GodStatsCard extends StatelessWidget {

  final int mantras;
  final int bhajans;

  const GodStatsCard({
    super.key,
    required this.mantras,
    required this.bhajans,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.05),
          )
        ],
      ),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceAround,

        children: [

          Column(
            children: [
              Text(
                "$mantras",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Mantras"),
            ],
          ),

          Container(
            height: 50,
            width: 1,
            color: Colors.grey.shade300,
          ),

          Column(
            children: [
              Text(
                "$bhajans",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Bhajans"),
            ],
          ),
        ],
      ),
    );
  }
}