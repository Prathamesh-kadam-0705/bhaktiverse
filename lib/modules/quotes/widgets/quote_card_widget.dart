import 'package:flutter/material.dart';

class QuoteCardWidget extends StatelessWidget {
  final String quote;
  final String reference;

  const QuoteCardWidget({
    super.key,
    required this.quote,
    required this.reference,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFB74D),
            Color(0xFFFF7043),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const Icon(
            Icons.format_quote,
            color: Colors.white,
            size: 40,
          ),

          const SizedBox(height: 20),

          Text(
            quote,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            reference,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}