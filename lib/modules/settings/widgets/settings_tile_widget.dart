import 'package:flutter/material.dart';

class SettingsTileWidget extends StatelessWidget {

  final String title;
  final Widget trailing;
  final VoidCallback? onTap;

  const SettingsTileWidget({
    super.key,
    required this.title,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }
}