import 'package:flutter/material.dart';

class CustomTextfield2 extends StatelessWidget {
  final controller;
  final text;
  final readonly;
  final maxline;
  const CustomTextfield2(
      {super.key, this.controller, this.text, this.readonly, this.maxline});

  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: readonly,
        maxLines: maxline,
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        onTap: () {},
        controller: controller);
  }
}
