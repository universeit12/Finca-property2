import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final fontsize;
  final fontweight;
  final int? maxline;
  final color;
  final textAlign;

   const CustomText(
      {super.key,
      this.text,
      this.fontsize,
      this.fontweight,
      this.maxline,
      this.color, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: TextOverflow.ellipsis,
      maxLines: maxline ?? 1,
      textAlign: textAlign,
      style: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontsize ?? 17.0,
          fontWeight: fontweight ?? FontWeight.w500,

      ),
    );
  }
}
