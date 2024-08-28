import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/contact/controller/contact_controller.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../widgets/custom_textfield.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});
  final controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        titleSpacing: 0,
        backgroundColor: AppColor.baseColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Get In Touch",
                maxline: 5,
                fontsize: 30.0,
              ),
              SizedBox(height: 10.0),
              CustomText(
                text:
                    "If you have any questions about this Privacy Policy, please contact us at:\n",
                maxline: 20,
                fontsize: 15.0,
              ),
              Textfield1(
                hintText: "Your Name",
                controller: controller.nameController,
                onchanged: (value) {
                  controller.name.value = value;
                },
              ),
              Textfield1(
                hintText: "Your Email",
                controller: controller.nameController,
                onchanged: (value) {
                  controller.email.value = value;
                },
              ),
              Textfield1(
                hintText: "Subject",
                controller: controller.nameController,
                onchanged: (value) {
                  controller.subject.value = value;
                },
              ),
              Textfield1(
                hintText: "Your Phone",
                controller: controller.nameController,
                onchanged: (value) {
                  controller.phone.value = value;
                },
              ),
              Textfield1(
                hintText: "Message",
                controller: controller.nameController,
                maxline: 3,
                onchanged: (value) {
                  controller.message.value = value;
                },
              ),
              SizedBox(height: 30.0),
              CustomButton(
                text: "Send Message",
                ontap: () {
                  Fluttertoast.showToast(msg: controller.name.value);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
