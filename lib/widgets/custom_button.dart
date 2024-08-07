import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.text, this.background, this.ontap, this.fontcolor});
  final String? text;
  final background;
  final ontap;
  final fontcolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: background ?? Colors.teal,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 0.5)),
        child: Text(
          text!,
          style: TextStyle(
              color:fontcolor?? Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
