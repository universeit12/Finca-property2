import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,

        title: const Text("SIGN IN"),
        titleSpacing: 0.0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: Column(
              children: [
                CustomTextfield(
                  hintext: "Name",
                  suffixicon: Icon(Icons.person_outline_rounded),
                ),
                SizedBox(height: 20.0),
                CustomTextfield(
                  hintext: "Email",
                  suffixicon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 20.0),
                CustomTextfield(
                  hintext: "Password",
                  suffixicon: Icon(Icons.remove_red_eye_outlined),
                ),
                SizedBox(height: 20.0),
                CustomTextfield(
                  hintext: "Confirm Password",
                  suffixicon: Icon(Icons.remove_red_eye_outlined),
                ),
                SizedBox(height: 20.0),
                CustomTextfield(
                  hintext: "Mobile Number",
                  suffixicon: Icon(Icons.phone),
                ),
                SizedBox(height: 20.0),
                CustomText(
                  text: "All fields are required.",
                  color: Colors.black38,
                ),
                SizedBox(height: 20.0),
                Wrap(
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
                SizedBox(height: 20.0),
                CustomButton(
                  text: "CREATE ACCOUNT",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
