import 'package:flutter/material.dart';
import 'package:universe_it_project/utils/app_color.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        backgroundColor: AppColor.baseColor,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: SingleChildScrollView(
          child: Text(
              "If you have any questions about this Privacy Policy, please contact us at:\n"
              "\n"
              "Email: [your-email@example.com]\n"
              "\n"
              "Address: [Your Address]"),
        ),
      ),
    );
  }
}
