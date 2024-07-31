import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: IconButton(
            onPressed: () {
              //Navigator.pop(context);
              Get.toNamed('/signup_screen');
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        title: const Text("PASSWORD RECOVERY"),
        titleSpacing: 0.0,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: Column(
            children: [
              CustomText(
                text:
                    "Please enter a valid email in field an press 'SEND' button. An automated email shall be genarated to be spacified email address with intructions of resetting password.",
                fontsize: 18.0,
                maxline: 10,
                fontweight: FontWeight.w500,
                color: Colors.black54,
              ),
              SizedBox(height: 20.0),
              CustomTextfield(
                hintext: "email",
                suffixicon: Icon(Icons.email_outlined),
              ),
              Spacer(),
              CustomButton(
                text: "CREATE ACCOUNT",
              )
            ],
          ),
        ),
      ),
    );
  }
}
