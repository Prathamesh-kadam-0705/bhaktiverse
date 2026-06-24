import 'package:flutter/material.dart';

class GodInfoCard extends StatelessWidget {

  final String name;
  final String marathiName;
  final String description;

  const GodInfoCard({
    super.key,
    required this.name,
    required this.marathiName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 0,

      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              marathiName,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.deepOrange,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}