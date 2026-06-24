import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [

          const SizedBox(height: 20),

          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color:
                    Colors.orange.withOpacity(.15),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(30),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff5D4037),
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}