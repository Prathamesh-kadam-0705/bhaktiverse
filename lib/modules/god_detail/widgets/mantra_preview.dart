import 'package:flutter/material.dart';

class MantraPreview extends StatelessWidget {

  const MantraPreview({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(

      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(24),
      ),

      child: const Padding(

        padding: EdgeInsets.all(20),

        child: Column(

          children: [

            Text(
              "Featured Mantra",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "ॐ नमो भगवते वासुदेवाय",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}