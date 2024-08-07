import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../controller/custom_text_icon.dart';
import '../controller/radioController.dart';

class AddPropertyScreen extends StatelessWidget {
  AddPropertyScreen({super.key});
  final OptionController controller = Get.put(OptionController());
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Property"),
        backgroundColor: AppColor.baseColor,
        titleSpacing: 0,
      ),
      body: PageView(
        controller: _pageController,
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
            //property for-->
            const CustomTextIcon(
              text: "Property for",
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Row(
              children: [
                Icon(
                  Icons.radio_button_on,
                  color: Colors.blueAccent,
                ),
                CustomText(
                  text: "  Sell",
                ),
              ],
            ),
            //Property type
            const CustomTextIcon(
              text: "Property type",
            ),
            Obx(() {
              return TextField(
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: 'Tap to select',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            //Address
            const CustomTextIcon(
              text: "Address",
            ),
            Obx(() {
              return TextField(
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Type Address',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            //Property name
            const CustomTextIcon(
              text: "Enter Property name",
            ),
            Obx(() {
              return TextField(
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Enter Property name',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            //Constructions status
            const CustomTextIcon(
              text: "Construction Status",
            ),
            Obx(() {
              return TextField(
                decoration: const InputDecoration(
                  hintText: 'Ready',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            const SizedBox(
              height: 10,
            ),

            const CustomText(
              text: "Properties Size & Pricing",
            ),

            //'Property size in sft
            const CustomTextIcon(
              text: "Property size in sif",
            ),
            Obx(() {
              return TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter Property sft',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            //Utility & Others cost
            const CustomTextIcon(
              text: "Utility & Others cost",
            ),
            Obx(() {
              return TextField(
                decoration: const InputDecoration(
                  hintText: 'If any others cost',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            const CustomTextIcon(
              text: "Price in total",
            ),
            Obx(() {
              return TextField(
                decoration: const InputDecoration(
                  hintText: 'total price',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            const SizedBox(
              height: 10,
            ),

            const CustomText(
              text: "Property basic features",
            ),

            const CustomTextIcon(
              text: "Bedroom",
            ),
            Obx(() {
              return TextField(
                decoration: const InputDecoration(
                  hintText: '1',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            const CustomTextIcon(
              text: "Bathroom",
            ),
            Obx(() {
              return TextField(
                decoration: const InputDecoration(
                  hintText: '1',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            const CustomTextIcon(
              text: "Belconis",
            ),
            Obx(() {
              return TextField(
                decoration: const InputDecoration(
                  hintText: '1',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            const CustomTextIcon(
              text: "Garages",
            ),
            Obx(() {
              return TextField(
                decoration: const InputDecoration(
                  hintText: '1',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            SizedBox(
              height: 20,
            ),
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
            const CustomText(
              text: "Property additional information",
            ),

            const CustomTextIcon(
              text: "Total number of floor",
            ),
            Obx(() {
              return TextField(
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: '1',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            //Address
            const CustomTextIcon(
              text: "Title",
            ),
            Obx(() {
              return TextField(
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText:
                      '212 sqft, 1 Bed Almost Ready Apartment/Flats for Sale at Karatia',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            //Property name
            const CustomTextIcon(
              text: "Discription",
            ),
            Obx(() {
              return TextField(
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Enter Discription',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
            //Constructions status
            const CustomTextIcon(
              text: "Phone Number",
            ),
            Obx(() {
              return TextField(
                decoration: const InputDecoration(
                  hintText: '+8801*********',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                onTap: () {},
                controller:
                    TextEditingController(text: controller.selectedValue.value),
              );
            }),
          const SizedBox(height: 10.0,),
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
