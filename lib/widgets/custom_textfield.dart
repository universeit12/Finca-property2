import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.onChanged,
    this.obscureText,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.validation,
    this.readonly,
    this.ontap, this.inputype,
  
  });

  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final readonly;
  final ontap;
  final inputype;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      validator: validation,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      controller: controller,
      keyboardType: inputype,
      readOnly: readonly ?? false,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hintText ?? "Email",
        suffixIcon: suffixIcon ?? const Icon(Icons.email_outlined),
      ),
      
    );
  }
}
