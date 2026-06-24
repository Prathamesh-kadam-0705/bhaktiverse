import 'package:flutter/material.dart';

class TempleCardWidget extends StatelessWidget {
  final String name;
  final String city;
  final String deity;
  final VoidCallback onTap;

  const TempleCardWidget({
    super.key,
    required this.name,
    required this.city,
    required this.deity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
      BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color:
              Colors.orange.withOpacity(.08),
              blurRadius: 15,
            ),
          ],
        ),
        child: Row(
          children: [

            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFB74D),
                    Color(0xFFFF7043),
                  ],
                ),
                borderRadius:
                BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.temple_hindu,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight:
                      FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    city,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    deity,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}