import 'package:flutter/material.dart';

class CustomTextfield3 extends StatelessWidget {
  final onchanged;
  const CustomTextfield3({super.key, this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(15.0)),
      child: TextFormField(
        decoration: const InputDecoration(
            suffixIcon: Icon(Icons.location_on_outlined),
            hintText: "Search location..",
            border: InputBorder.none),
        onChanged: onchanged,
      ),
    );
  }
}
