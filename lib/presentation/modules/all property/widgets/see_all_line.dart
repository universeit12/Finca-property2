import 'package:flutter/material.dart';

import '../../../../widgets/custom_text.dart';


class SeeAllLine extends StatelessWidget {
  const SeeAllLine({super.key, required this.propertyTitle, required this.onTap});

  final String propertyTitle;
  final  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           CustomText(
            text: propertyTitle,
          ),
          InkWell(
            onTap:
              onTap
            ,
            child: const CustomText(
              text: "See All",
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
