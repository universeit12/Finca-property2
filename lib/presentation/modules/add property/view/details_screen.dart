import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

import 'add_dropdown.dart';

class AddDetailsScreen extends StatelessWidget {
  AddDetailsScreen({super.key});
  final DropdownController dropdownController = Get.put(DropdownController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add your property"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180.0,
              width: double.infinity,
              child: Image.asset(
                "assets/images/flat.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      CustomText(
                        text: "User Information",
                      )
                    ],
                  ),
                  CustomTextfield(
                    hintText: "Your Name",
                    suffixIcon: Icon(Icons.person_outline_rounded),
                  ),
                  CustomTextfield(
                    hintText: "Phone Number",
                    suffixIcon: Icon(Icons.phone),
                  ),
                  CustomTextfield(
                    hintText: "Your Email",
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: "Property Type",
                      readonly: true,
                      controller: TextEditingController(
                          text: dropdownController.selectedValue.value),
                      ontap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('একটি মান নির্বাচন করুন'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: dropdownController.rasidentialvalue
                                    .map((value) {
                                  return ListTile(
                                    title: Text(value),
                                    onTap: () {
                                      dropdownController
                                          .setSelectedValue(value);
                                      Navigator.of(context).pop();
                                    },
                                  );
                                }).toList(),
                              ),
                            );
                          },


                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
