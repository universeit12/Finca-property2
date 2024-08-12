import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;

  final onConfirm;

  CustomDialog({
    required this.title,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
