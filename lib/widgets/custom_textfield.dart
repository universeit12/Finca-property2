import 'package:flutter/material.dart';


class Textfield1 extends StatelessWidget {
  const Textfield1(
      {super.key,
      this.hinttext,
      this.suffixicon,
      this.validation,
      this.obscuretext,
      this.onchanged,
      this.inputype, this.maxline,  this.controller});

  final hinttext;
  final IconData? suffixicon;
  final validation;
  final obscuretext;
  final onchanged;
  final inputype;
  final maxline;
  final TextEditingController?  controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 55.0,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        maxLines: maxline,
        onChanged: onchanged,
        validator: validation,
        obscureText: obscuretext ?? false,
        keyboardType: inputype ?? TextInputType.text,
        decoration: InputDecoration(

          hintText: hinttext,
          suffixIcon: suffixicon != null ? Icon(suffixicon) : null,
        ),
      ),
    );
  }
}
