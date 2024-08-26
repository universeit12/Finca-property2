import 'package:flutter/material.dart';

class Textfield1 extends StatelessWidget {
  const Textfield1(
      {super.key,
      this.hinttext,
      this.suffixicon,
      this.validation,
      this.obscuretext,
      this.onchanged,
      this.inputype,
      this.maxline});

  final hinttext;
  final IconData? suffixicon;
  final validation;
  final obscuretext;
  final onchanged;
  final inputype;
  final maxline;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      margin: const EdgeInsets.only(bottom: 5.0),
      child: TextFormField(
        maxLines: maxline,
        onChanged: onchanged,
        validator: validation,
        obscureText: obscuretext ?? false,
        keyboardType: inputype ?? TextInputType.text,
        decoration: InputDecoration(
          label: hinttext,
          suffixIcon: suffixicon != null ? Icon(suffixicon) : null,
          prefixIconColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 14),
          filled: false,
          fillColor: Colors.white,
          //enable-->
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
            ),
          ),

          //focus-->
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          ),

          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: 2),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: 2),
          ),
        ),
      ),
    );
  }
}
