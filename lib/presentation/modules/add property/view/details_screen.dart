import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';

import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';
import '../controller/radioController.dart';
import 'add_dropdown.dart';

class AddDetailsScreen extends StatelessWidget {
  AddDetailsScreen({super.key});
  final DropdownController dropdownController = Get.put(DropdownController());
  final RadioController controller = Get.put(RadioController());
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.person),
                      CustomText(
                        text: "  User Information",
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  const CustomTextfield(
                    hintText: "Your Name",
                    suffixIcon: Icon(Icons.person_outline_rounded),
                  ),
                  const SizedBox(height: 20.0,),
                  const CustomTextfield(
                    hintText: "Phone Number",
                    suffixIcon: Icon(Icons.phone),
                  ),
                  const SizedBox(height: 20.0,),
                  const CustomTextfield(
                    hintText: "Your Email",
                  ),
                  const SizedBox(height: 20.0,),
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
                  const SizedBox(height:25.0,),
                  const Row(
                    children: [
                      Icon(Icons.person_3_rounded),
                      CustomText(
                        text: "  Roles",
                      )
                    ],
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Obx(() => Row(
                              children: [
                                Radio(
                                  value: 'Owner',
                                  groupValue: controller.selectedValue.value,
                                  onChanged: (value) {
                                    controller.selectedValue.value = value!;
                                  },
                                ),
                                const Text("Owner"),
                              ],
                            )),
                        Obx(() => Row(
                          children: [
                            Radio(
                              value: 'Manager',
                              groupValue: controller.selectedValue.value,
                              onChanged: (value) {
                                controller.selectedValue.value = value!;
                              },
                            ),
                            const Text("Manager"),
                          ],
                        )),
                        Obx(() => Row(
                              children: [
                                Radio(
                                  value: 'Representative',
                                  groupValue: controller.selectedValue.value,
                                  onChanged: (value) {
                                    controller.selectedValue.value = value!;
                                  },
                                ),
                                const Text("Representative"),
                              ],
                            )),

                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0,),
                  const Row(
                    children: [
                      Icon(Icons.production_quantity_limits),
                      CustomText(
                        text: "  Porpose",
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0,),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4.0)
                      ),
                      child: const Text("Only for Sell"),
                    ),
                  ),
                  const SizedBox(height: 15.0,),

                  const Row(
                    children: [
                      Icon(Icons.add_home_work),
                      CustomText(
                        text: "  Property Type",
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  const Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      CustomText(
                        text: "Locations",
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  CustomButton(
                    text: "Add Property",
                    ontap: (){
                      Fluttertoast.showToast(
                          msg:
                          'Selected value: ${controller.selectedValue.value}');
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
