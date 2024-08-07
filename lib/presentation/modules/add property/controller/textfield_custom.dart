import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final Icon? suffixIcon;
  final void Function()? onTap;
  final int maxLines;
  final  keyboardtype;

  ReusableTextField({
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.maxLines = 1,
    this.keyboardtype ,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      maxLines: maxLines,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
      ),
      onTap: onTap,
      controller: controller,
    );
  }
}
