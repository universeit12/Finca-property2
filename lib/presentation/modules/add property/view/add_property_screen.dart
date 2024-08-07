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
            Obx(() {
              return ReusableTextField(
                hintText: 'Tap to select',
                controller: TextEditingController(text: controller.selectedValue.value),
                readOnly: true,
                suffixIcon: const Icon(Icons.arrow_drop_down),
              );
            }),
            const CustomTextIcon(text: "Address"),
            Obx(() {
              return ReusableTextField(
                hintText: 'Type Address',
                controller: TextEditingController(text: controller.selectedValue.value),
                maxLines: 2,
              );
            }),
            const CustomTextIcon(text: "Enter Property name"),
            Obx(() {
              return ReusableTextField(
                hintText: 'Enter Property name',
                controller: TextEditingController(text: controller.selectedValue.value),
                maxLines: 2,
              );
            }),
            const CustomTextIcon(text: "Construction Status"),
            Obx(() {
              return ReusableTextField(
                hintText: 'Ready',
                readOnly: true,
                controller: TextEditingController(text: controller.selectedValue.value),
                suffixIcon: const Icon(Icons.arrow_drop_down),
              );
            }),
            const SizedBox(height: 10),
            const CustomText(text: "Properties Size & Pricing"),
            const CustomTextIcon(text: "Property size in sft"),
            Obx(() {
              return ReusableTextField(
                hintText: 'Enter Property sft',
                keyboardtype: TextInputType.phone,
                controller: TextEditingController(text: controller.selectedValue.value),
              );
            }),
            const CustomTextIcon(text: "Utility & Others cost"),
            Obx(() {
              return ReusableTextField(
                hintText: 'If any others cost',
                keyboardtype: TextInputType.phone,
                controller: TextEditingController(text: controller.selectedValue.value),
              );
            }),
            const CustomTextIcon(text: "Price in total"),
            Obx(() {
              return ReusableTextField(
                hintText: 'total price',
                keyboardtype: TextInputType.phone,
                controller: TextEditingController(text: controller.selectedValue.value),
              );
            }),
            const SizedBox(height: 10),
            const CustomText(text: "Property basic features"),
            const CustomTextIcon(text: "Bedroom"),
            Obx(() {
              return ReusableTextField(
                hintText: '1',
                readOnly: true,
                controller: TextEditingController(text: controller.selectedValue.value),
                suffixIcon: const Icon(Icons.arrow_drop_down),
              );
            }),
            const CustomTextIcon(text: "Bathroom"),
            Obx(() {
              return ReusableTextField(
                hintText: '1',
                readOnly: true,
                controller: TextEditingController(text: controller.selectedValue.value),
                suffixIcon: const Icon(Icons.arrow_drop_down),
              );
            }),
            const CustomTextIcon(text: "Belconis"),
            Obx(() {
              return ReusableTextField(
                hintText: '1',
                readOnly: true,
                controller: TextEditingController(text: controller.selectedValue.value),
                suffixIcon: const Icon(Icons.arrow_drop_down),
              );
            }),
            const CustomTextIcon(text: "Garages"),
            Obx(() {
              return ReusableTextField(
                hintText: '1',
                readOnly: true,
                controller: TextEditingController(text: controller.selectedValue.value),
                suffixIcon: const Icon(Icons.arrow_drop_down),
              );
            }),
            const SizedBox(height: 20),
            CustomButton(
              text: "Next",

              ontap: () {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
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
                controller: TextEditingController(text: controller.selectedValue.value),
                readOnly: true,
                suffixIcon: const Icon(Icons.arrow_drop_down),
              );
            }),
            const CustomTextIcon(text: "Title"),
            Obx(() {
              return ReusableTextField(
                hintText: '212 sqft, 1 Bed Almost Ready Apartment/Flats for Sale at Karatia',
                controller: TextEditingController(text: controller.selectedValue.value),
                maxLines: 2,
              );
            }),
            const CustomTextIcon(text: "Description"),
            Obx(() {
              return ReusableTextField(
                hintText: 'Enter Description',
                controller: TextEditingController(text: controller.selectedValue.value),
                maxLines: 4,
              );
            }),
            const CustomTextIcon(text: "Phone Number"),
            Obx(() {
              return ReusableTextField(
                hintText: '+8801*********',
                keyboardtype: TextInputType.phone,
                controller: TextEditingController(text: controller.selectedValue.value),
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
