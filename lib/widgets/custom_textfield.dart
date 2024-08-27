import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Textfield1 extends StatelessWidget {
  const Textfield1(
      {super.key,
      this.hinttext,
      this.suffixicon,
      this.validation,
      this.obscuretext,
      this.onchanged,
      this.inputype,
      this.maxline,
      this.controller});

  final hinttext;
  final IconData? suffixicon;
  final validation;
  final obscuretext;
  final onchanged;
  final inputype;
  final maxline;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      margin: const EdgeInsets.only(bottom: 5.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxline,
        onChanged: onchanged,
        validator: validation,
        obscureText: obscuretext ?? false,
        keyboardType: inputype ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: hinttext,
          suffixIcon: suffixicon != null ? Icon(suffixicon) : null,
          prefixIconColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 14),
          filled: false,
          fillColor: Colors.white,
          //enable-->
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          //focus-->
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
