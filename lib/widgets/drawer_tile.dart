import 'package:flutter/material.dart';

class CustomDrawerTile extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final VoidCallback? onTap;
  const CustomDrawerTile({
    super.key,
    this.icon,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 25,
      ),
      title: Text(
        text!,
        style: const TextStyle(
          fontSize: 13.0,
        ),
      ),
      onTap: onTap,
    );
  }
}
