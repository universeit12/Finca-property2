import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';
import '../../add property/widgets/custom_text_icon.dart';
import '../controller/profile_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: 'Edit Profile'),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextIcon(text: "Phone"),
                Textfield1(
                  controller: controller.phoneController,
                ),
                CustomTextIcon(text: "Email"),
                Textfield1(
                  controller: controller.emailController,
                ),
                CustomTextIcon(text: "Name"),
                Textfield1(
                  controller: controller.nameController,
                ),
                CustomTextIcon(text: "Monthly"),
                Textfield1(
                  controller: controller.monthly_incomeController,
                ),
                CustomTextIcon(text: "Permanent Address"),
                Textfield1(
                  controller: controller.permanent_addreessController,
                ),
                CustomTextIcon(text: "Present Address"),
                Textfield1(
                  controller: controller.present_addressController,
                ),
                SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 10.0),
        height: 60,
        child: CustomButton(
          text: 'SUBMIT',
          ontap: () {
            Fluttertoast.showToast(msg: 'Profile Updated');
          },
        ),
      ),
    );
  }
}
