import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../controller/custom_text_icon.dart';
import '../controller/radioController.dart';
import '../controller/textfield_custom.dart';

class AddPropertyScreen extends StatelessWidget {
  AddPropertyScreen({super.key});
  final OptionController controller = Get.put(OptionController());
  final PageController _pageController = PageController();

  final TextEditingController pTypecontroller = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pNameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController utilityController = TextEditingController();
  final TextEditingController totalpriceController = TextEditingController();
  final TextEditingController bedroomController = TextEditingController();
  final TextEditingController bathroomController = TextEditingController();
  final TextEditingController belconisController = TextEditingController();
  final TextEditingController garagesController = TextEditingController();
  final pTypeKey = GlobalKey<FormState>();
  final addressKey = GlobalKey<FormState>();
  final pNameKey = GlobalKey<FormState>();
  final statusKey = GlobalKey<FormState>();
  final sizeKey = GlobalKey<FormState>();
  final utilityKey = GlobalKey<FormState>();
  final totalpriceKey = GlobalKey<FormState>();
  final bedroomKey = GlobalKey<FormState>();
  final bathroomKey = GlobalKey<FormState>();
  final belconisKey = GlobalKey<FormState>();
  final garagesKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildPage1(),
          _buildPage2(),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const CustomText(
                  text: "Add Property",
                )
              ],
            ),
            const Divider(),
            const CustomTextIcon(text: "Property for"),
            const SizedBox(height: 5.0),
            const Row(
              children: [
                Icon(Icons.radio_button_on, color: Colors.blueAccent),
                CustomText(text: "  Sell"),
              ],
            ),
            const CustomTextIcon(text: "Property type"),
            ReusableTextField(
                hintText: 'Tap to select',
                readOnly: true,
                formkey: pTypeKey,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: pTypecontroller),
            const CustomTextIcon(text: "Address"),
            ReusableTextField(
                hintText: 'Type Address',
                maxLines: 2,
                formkey: addressKey,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: addressController),
            const CustomTextIcon(text: "Enter Property name"),
            ReusableTextField(
                hintText: 'Enter Property name',
                maxLines: 2,
                formkey: pNameKey,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: pNameController),
            const CustomTextIcon(text: "Construction Status"),
            ReusableTextField(
                hintText: 'Ready',
                readOnly: true,
                formkey: statusKey,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: statusController),
            const SizedBox(height: 10),
            const CustomText(text: "Properties Size & Pricing"),
            const CustomTextIcon(text: "Property size in sft"),
            ReusableTextField(
                hintText: 'Enter Property sft',
                keyboardtype: TextInputType.phone,
                formkey: sizeKey,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: sizeController),
            const CustomTextIcon(text: "Utility & Others cost"),
            ReusableTextField(
                hintText: 'If any others cost',
                keyboardtype: TextInputType.phone,
                formkey: utilityKey,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: utilityController),
            const CustomTextIcon(text: "Price in total"),
            ReusableTextField(
                hintText: 'total price',
                keyboardtype: TextInputType.phone,
                formkey: totalpriceKey,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: totalpriceController),
            const SizedBox(height: 10),
            const CustomText(text: "Property basic features"),
            const CustomTextIcon(text: "Bedroom"),
            ReusableTextField(
                hintText: '1',
                readOnly: true,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                formkey: bedroomKey,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: bedroomController),
            const CustomTextIcon(text: "Bathroom"),
            ReusableTextField(
                hintText: '1',
                readOnly: true,
                formkey: bathroomKey,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: bathroomController),
            const CustomTextIcon(text: "Belconis"),
            ReusableTextField(
                hintText: '1',
                readOnly: true,
                formkey: belconisKey,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Complete the fields';
                  }
                  return null;
                },
                controller: belconisController),
            const CustomTextIcon(text: "Garages"),
            ReusableTextField(
                hintText: '1',
                readOnly: true,
                formkey: garagesKey,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
                controller: garagesController),
            const SizedBox(height: 20),
            CustomButton(
              text: "Next",
              ontap: () {
                if (pTypecontroller.text.isNotEmpty ||
                    pTypeKey.currentState!.validate() &&
                        addressController.text.isNotEmpty ||
                    addressKey.currentState!.validate() &&
                        pNameController.text.isNotEmpty ||
                    pNameKey.currentState!.validate() &&
                        statusController.text.isNotEmpty ||
                    statusKey.currentState!.validate() &&
                        sizeController.text.isNotEmpty ||
                    sizeKey.currentState!.validate() &&
                        utilityController.text.isNotEmpty ||
                    utilityKey.currentState!.validate() &&
                        totalpriceController.text.isNotEmpty ||
                    totalpriceKey.currentState!.validate() &&
                        bedroomController.text.isNotEmpty ||
                    bedroomKey.currentState!.validate() &&
                        bathroomController.text.isNotEmpty ||
                    bathroomKey.currentState!.validate() &&
                        belconisController.text.isNotEmpty ||
                    belconisKey.currentState!.validate() &&
                        garagesController.text.isNotEmpty ||
                    garagesKey.currentState!.validate()) {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPage2() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            const CustomText(text: "Property additional information"),
            const CustomTextIcon(text: "Total number of floor"),
            Obx(() {
              return ReusableTextField(
                hintText: '1',
                controller:
                    TextEditingController(text: controller.selectedValue.value),
                readOnly: true,
                suffixIcon: const Icon(Icons.arrow_drop_down),
              );
            }),
            const CustomTextIcon(text: "Title"),
            Obx(() {
              return ReusableTextField(
                hintText:
                    '212 sqft, 1 Bed Almost Ready Apartment/Flats for Sale at Karatia',
                controller:
                    TextEditingController(text: controller.selectedValue.value),
                maxLines: 2,
              );
            }),
            const CustomTextIcon(text: "Description"),
            Obx(() {
              return ReusableTextField(
                hintText: 'Enter Description',
                controller:
                    TextEditingController(text: controller.selectedValue.value),
                maxLines: 4,
              );
            }),
            const CustomTextIcon(text: "Phone Number"),
            Obx(() {
              return ReusableTextField(
                hintText: '+8801*********',
                keyboardtype: TextInputType.phone,
                controller:
                    TextEditingController(text: controller.selectedValue.value),
                suffixIcon: Icon(Icons.arrow_drop_down),
              );
            }),
            const SizedBox(height: 10.0),
            CustomButton(
              text: "Post",
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
