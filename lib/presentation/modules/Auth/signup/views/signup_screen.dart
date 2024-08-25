import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/home/home.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController mobilegecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: 'Sign In'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: Column(
              children: [
                //name
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
                //email
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
                //password
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
                //confirm password
                const Textfield1(
                  hinttext: Text("Confirm Password"),
                  suffixicon: Icons.remove_red_eye_outlined,
                ),
                const SizedBox(height: 20.0),
                //mobile phone
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
                const CustomText(
                  text: "All fields are required.",
                  color: Colors.black38,
                ),
                const SizedBox(height: 20.0),
                const Wrap(
                  children: [
                    CustomText(
                      text:
                          "By taping on 'Create Account' you are agreeing to Bpoperty.com's ",
                      color: Colors.black,
                      fontsize: 18.0,
                      maxline: 3,
                    ),
                    CustomText(
                      text: "Terms of use",
                      color: Colors.teal,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: "CREATE ACCOUNT",
                  ontap: () {
                    if (formkey.currentState!.validate()) {
                      Get.to(() => Home());
                      Fluttertoast.showToast(
                        msg: "Sign up Done",
                      );

                      namecontroller.clear();
                      emailcontroller.clear();
                      passcontroller.clear();
                      mobilegecontroller.clear();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
