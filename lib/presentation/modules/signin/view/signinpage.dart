
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_string.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

class Signinpage extends StatelessWidget {
  const Signinpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  text: AppString.name,
                ),
                const SizedBox(height: 20.0),
                const CustomText(
                  text: AppString.welcome,
                  color: Colors.teal,
                  fontsize: 20.0,
                ),
                const SizedBox(height: 20.0),
                const CustomTextfield(),
                const SizedBox(height: 20.0),
                const CustomTextfield(
                  suffixicon: Icon(Icons.remove_red_eye_outlined),
                  hintext: "Password",
                ),
                const SizedBox(height: 20.0),
                 Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: ()=>Get.toNamed('/foreget_screen'),
                    child: CustomText(
                      text: "Forget Password",
                      color: Colors.teal,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const CustomButton(
                  text: "Sign In",
                ),
                const SizedBox(height: 15.0),
                const CustomText(
                  text: "Or",
                  color: Colors.teal,
                  fontsize: 22.0,
                ),
                const SizedBox(height: 15.0),
                const CustomButton(
                  text: "Login with Facebook",
                  background: Colors.blue,
                ),
                const SizedBox(height: 30.0),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Need an account?",
                      color: Colors.teal,
                      fontsize: 18.0,
                    ),
                    InkWell(
                      onTap: ()=>Get.toNamed('/signup_screen'),
                      child: CustomText(
                        text: "Sign Up",
                        color: Colors.teal,
                        fontsize: 19.0,
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
    );
  }
}
