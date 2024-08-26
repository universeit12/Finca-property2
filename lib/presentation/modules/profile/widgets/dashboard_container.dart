import 'package:flutter/material.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({super.key, this.text, this.number, this.color});
  final text;
  final number;
  final color;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        height: 100,
        width: screenSize.width / 1,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: color ?? Colors.amber,
            border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              number ?? '',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ));
  }
}
