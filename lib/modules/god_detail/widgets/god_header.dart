import 'package:flutter/material.dart';

class GodHeader extends StatelessWidget {

  final String image;
  final String name;
  final String marathiName;

  const GodHeader({
    super.key,
    required this.image,
    required this.name,
    required this.marathiName,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Hero(

          tag: name,

          child: Container(

            height: 220,
            width: 220,

            decoration: BoxDecoration(

              shape: BoxShape.circle,

              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),

              boxShadow: [

                BoxShadow(
                  blurRadius: 20,
                  color: Colors.orange.withOpacity(.3),
                )
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

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
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}