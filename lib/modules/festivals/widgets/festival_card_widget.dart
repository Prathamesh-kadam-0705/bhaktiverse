import 'package:flutter/material.dart';

class FestivalCardWidget extends StatelessWidget {
  final String name;
  final String date;
  final String description;

  const FestivalCardWidget({
    super.key,
    required this.name,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFB74D),
            Color(0xFFFF7043),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              const Icon(
                Icons.celebration,
                color: Colors.white,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),

              Text(
                date,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}