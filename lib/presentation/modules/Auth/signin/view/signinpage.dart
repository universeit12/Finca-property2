import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_string.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

class Signinpage extends StatelessWidget {
  Signinpage({
    super.key,
  });
  final TextEditingController messagecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final emailformkey = GlobalKey<FormState>();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.teal,
                            size: 40.0,
                          ))),
                  const SizedBox(height: 20.0),
                  const CustomText(
                    text: 'Login Now',
                    fontsize: 25.0,
                  ),
                  CustomText(
                    text: AppString.welcome,
                    color: Colors.teal,
                    fontsize: 16.0,
                  ),
                  const SizedBox(height: 20.0),
                  Textfield1(
                    hinttext: Text('Phone Number'),
                    suffixicon: Icons.phone,
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
                    suffixicon: Icons.remove_red_eye_outlined,
                    hinttext: Text('Password'),
                    inputype: TextInputType.phone,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Get.toNamed('/foreget_screen'),
                      child: const CustomText(
                        text: "Forget Password",
                        color: Colors.teal,
                        fontweight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  CustomButton(
                    text: "LOG IN",
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        Fluttertoast.showToast(
                          msg: "Sign in Done",
                        );
                        messagecontroller.clear();
                        emailcontroller.clear();
                        namecontroller.clear();
                      }
                    },
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Dont't have an account?   ",
                        color: Colors.black,
                        fontsize: 16.0,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed('/signup_screen'),
                        child: const CustomText(
                          text: "Sign Up",
                          color: Colors.teal,
                          fontsize: 17.0,
                          fontweight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
