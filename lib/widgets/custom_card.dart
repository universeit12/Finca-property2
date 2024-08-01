import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.child, this.width, this.padding});
  final child;
  final width;
  final padding;

  @override
  Widget build(BuildContext context) {
    return Container(
    width: width,
      margin:const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
      padding:padding?? const EdgeInsets.only(left: 15.0, bottom: 20.0, top: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 1.0, blurRadius: 8.0)
          ]),
      child: child,
    );
  }
}
