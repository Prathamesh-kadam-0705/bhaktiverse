import 'package:flutter/material.dart';

class SearchResultTile extends StatelessWidget {

  final String title;

  const SearchResultTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: const Icon(Icons.search),
      title: Text(title),
    );
  }
}