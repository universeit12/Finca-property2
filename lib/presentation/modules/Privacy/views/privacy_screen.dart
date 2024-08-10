import 'package:flutter/material.dart';
import 'package:universe_it_project/utils/app_color.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        titleSpacing: 0,
        backgroundColor: AppColor.baseColor,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: SingleChildScrollView(
            child: Text.rich(TextSpan(children: [
          TextSpan(
              text: "Welcome",
              style: TextStyle(fontSize: 25.0, color: Colors.teal)),
          TextSpan(
              text:
                  " to Finca Properties. We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application.\n"
                  "Personal Data: We may collect personally identifiable information such as your name, email address, and phone number.\n"
                  "Usage Data: We collect information about how you use our application, including device information (e.g., IP address, operating system) and application usage details (e.g., pages visited, features used).\n"
                  "Location Data: If you enable location services, we may collect information about your location.",
              style: TextStyle(fontSize: 16.0))
        ]))),
      ),
    );
  }
}
