import 'package:flutter/material.dart';

class FavoriteItemTile extends StatelessWidget {
  final String title;
  final String type;
  final VoidCallback onDelete;

  const FavoriteItemTile({
    super.key,
    required this.title,
    required this.type,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(.08),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [

          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  type,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete_outline,
            ),
          ),
        ],
      ),
    );
  }
}