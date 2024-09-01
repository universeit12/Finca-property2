import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/profile/controller/profile_controller.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';
import '../../../../backend/services/ApiServices.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';

import '../../add property/widgets/custom_text_icon.dart';
import '../../all property/model/all_property_model.dart';
import '../../all property/model/property_model.dart';
import '../model/booking_model.dart';
import 'package:http/http.dart' as http;

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    var selectedValue;

    final nameController = TextEditingController(text: controller.fullName.toString());
    final emailController = TextEditingController(text: controller.email.toString());

    final phoneController = TextEditingController(text: controller.phone.toString());
    final messageController = TextEditingController();
    final propertyType = TextEditingController(text: property.property?.propertyName.toString());
    final formKey = GlobalKey<FormState>();
    Future<void> bookingRegister() async {
      try {
        var user = {
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "property_description": messageController.text,
          "property_type":property.property?.id.toString(),
        };
        var response =
        await ApiServices().post2("/booking", user).catchError((err) {
          debugPrint("Unsuccessful");
        });
        if (response == null) return;
        debugPrint("Successful");
        Get.snackbar("Successful", "Submitted Successfully");
      } catch (e) {
        Get.snackbar("Error", "Something went wrong");
      }
    }



    return Scaffold(
      appBar: Backappbar(title: "Booking Now"),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.0),
            Text(
              'Booking Now',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.0),
            Text(
              'You can provide information what type properties are your choice',
              style: TextStyle(color: Colors.pink.shade400, fontSize: 15.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomText(text: "Name"),
                  Textfield1(
                    hintText: "Your Name",
                    controller: nameController,
                  ),
                  SizedBox(height: 5.0),
                  CustomText(text: "Email"),

                  Textfield1(
                    hintText: "Your Email",
                    controller: emailController,
                  ),
                  SizedBox(height: 5.0),
                  CustomText(text: "Phone Number"),
                  Textfield1(
                    hintText: "Your Phone Number",
                    controller: phoneController,
                  ),
                  SizedBox(height: 5.0),
                  CustomText(text: "Property Type"),
                  Textfield1(
                    hintText: "Property Type",
                    controller: propertyType,

                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(text: "Short Description"),
                  Textfield1(
                    hintText: "Write A Short Description",

                    controller: messageController,
                    maxline: 4,
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.0),
            CustomButton(
              text: "Send Message",
              onTap: () {
                debugPrint("Tapped");

                bookingRegister();
              },
            )
          ],
        ),
      )),
    );


  }

  Row CustomText({required String text}) {
    return Row(
                  children: [
                    SizedBox(width: 10,),
                    CustomTextIcon(text: text),
                  ],
                );
  }
}



