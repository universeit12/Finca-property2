import 'package:flutter/material.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        titleSpacing: 0,
        backgroundColor: AppColor.baseColor,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Have questions?",
              maxline: 5,
              fontsize: 30.0,
            ),
            CustomText(
              text: " Send us a message by email.",
              maxline: 2,
              fontsize: 14.0,
              color: Colors.black54,
            ),
            Divider(),
            SizedBox(height: 10.0),
            CustomText(
              text:
                  "If you have any questions about this Privacy Policy, please contact us at:\n"
                  "\n"
                  "Email: [your-email@example.com]\n"
                  "\n"
                  "Address: [Your Address]",
              maxline: 20,
              fontsize: 15.0,
            ),
            Spacer(),
            CustomButton(
              text: "SEND EMAIL",
            )
          ],
        ),
      ),
    );
  }
}
