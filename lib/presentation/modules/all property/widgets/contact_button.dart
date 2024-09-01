import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key, this.text, this.ontap, this.icon});
  final text;
  final ontap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 0.1)),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Row(
          children: [
            Icon(icon,size: 14,color: Colors.white,),
            SizedBox(width: 5,),
            Text(
              text??' ',
              style: TextStyle(color: Colors.white, fontSize: 11.0),
            ),
          ],
        ),
      ),
    );
  }
}
