import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.onChanged,
    this.obscureText,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.formKey,
    this.validation,
  });

  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        validator: validation,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hintText ?? "Email",
          suffixIcon: suffixIcon ?? const Icon(Icons.email_outlined),
        ),
      ),
    );
  }
}
