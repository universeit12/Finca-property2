import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/Auth/signup/controller/signup_controller.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

class UserRegistrationForm extends StatelessWidget {
  UserRegistrationForm({super.key});
  final controller = Get.put(SignupController());

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Textfield1(
          hinttext: Text("Name"),
          suffixicon: Icons.person_outline_rounded,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        Textfield1(
          hinttext: Text("Mobile Number"),
          suffixicon: Icons.phone,
          inputype: TextInputType.number,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Phone Number';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        Textfield1(
          hinttext: Text("Email"),
          suffixicon: Icons.email_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email address';
            }
            final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
            if (!emailRegExp.hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        Textfield1(
          hinttext: Text("Password"),
          suffixicon: Icons.remove_red_eye_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        const Textfield1(
          hinttext: Text("Confirm Password"),
          suffixicon: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 20.0),
        SizedBox(height: 20.0),
        CustomText(
          text: "All fields are required.",
          color: Colors.black,
          fontsize: 14.0,
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
