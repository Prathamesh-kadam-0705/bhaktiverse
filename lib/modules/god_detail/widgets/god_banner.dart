import 'package:flutter/material.dart';

class GodBanner extends StatelessWidget {

  final String image;

  const GodBanner({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 320,

      decoration: BoxDecoration(

        borderRadius:
        BorderRadius.circular(30),

        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}