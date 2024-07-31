import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      this.onchanged,
      this.abscuretext,
      this.controller,
      this.hintext,
      this.suffixicon});
  final onchanged;
  final abscuretext;
  final controller;
  final hintext;
  final suffixicon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      obscureText: abscuretext ?? false,
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
          hintText: hintext ?? "Email",
          suffixIcon: suffixicon ?? const Icon(Icons.email_outlined)),
    );
  }
}
