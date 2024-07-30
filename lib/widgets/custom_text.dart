import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final fontsize;
  final fontweight;
  final int? maxline;

  const CustomText(
      {super.key, this.text, this.fontsize, this.fontweight, this.maxline});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: TextOverflow.ellipsis,
      maxLines: maxline ?? 1,
      style: TextStyle(
          fontSize: fontsize ?? 17.0,
          fontWeight: fontweight ?? FontWeight.w500),
    );
  }
}
