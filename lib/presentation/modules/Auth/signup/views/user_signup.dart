import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/Auth/signup/controller/signup_controller.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

import '../../../../../widgets/custom_button.dart';

class UserRegistrationForm extends StatelessWidget {
  UserRegistrationForm({super.key});


  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: formkey,
      child: Column(
        children: [
          Textfield1(
            controller: controller.nameController,

            hinttext: "Name",
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
            controller: controller.mobileController,
            hinttext: "Mobile Number",
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
            controller: controller.emailController,
            hinttext:"Email",
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
            controller: controller.passController,
            hinttext: "Password",
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
           Textfield1(
            controller: controller.confirmPassController,
            hinttext:"Confirm Password" ,
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

          SizedBox(height: 20.0),

          ///Submit Button--->
          CustomButton(
            text: "REGISTER",
            onTap: () {
                if (formkey.currentState!.validate()) {
                  controller.customerRegister();

                  controller.companyMobileController.clear();
                  controller.companyMobile2Controller.clear();
                  controller.companyEmailController.clear();
                  controller.companyClientNameController.clear();
                  controller.companyNameController.clear();
                  controller.companyDesignationController.clear();
                  controller.companyOfficeAddressController.clear();
                  controller.companyPassController.clear();
                  controller.companyConfirmPassController.clear();
                }

            },
          ),
        ],
      ),
    );
  }
}
