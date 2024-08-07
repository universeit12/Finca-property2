import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/add%20property/controller/custom_text_icon.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
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
              text: "Propejgkldjgkjrty for",
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
            CustomButton(
              text: "Next",
              ontap: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
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
            //property for-->
            const CustomTextIcon(
              text: "Propejgkldjgkjrty for",
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
            CustomButton(
              text: "Previous",
              ontap: () {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
            )
          ],
        ),
      ),
    );
  }
}
