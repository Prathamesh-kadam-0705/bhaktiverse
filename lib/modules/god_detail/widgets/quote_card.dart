import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {

  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        gradient: LinearGradient(
          colors: [
            Colors.orange.shade300,
            Colors.deepOrange.shade300,
          ],
        ),

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: const Text(

        "\"Whenever righteousness declines, I manifest Myself.\"",

        textAlign: TextAlign.center,

        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}