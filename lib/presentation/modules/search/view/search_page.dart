import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import '../../add property/controller/custom_text_icon.dart';
import '../../add property/controller/radioController.dart';
import '../../add property/controller/textfield_custom.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final OptionController controller = Get.put(OptionController());
  final TextEditingController locationcontroller = TextEditingController();
  final locationformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.teal,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            children: [
              //Property type
              const CustomTextIcon(
                text: "Search Keyword",
              ),
              Obx(() {
                return ReusableTextField(
                  hintText: 'Search text',
                  maxLines: 2,
                  controller: TextEditingController(
                      text: controller.selectedValue.value),
                );
              }),
              //Property type
              const CustomTextIcon(
                text: "Property Caterogy",
              ),
              Obx(() {
                return ReusableTextField(
                  hintText: 'Tap to select',
                  readOnly: true,
                  controller: TextEditingController(
                      text: controller.selectedValue.value),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                );
              }),

              //Constructions status
              const CustomTextIcon(
                text: "Construction Status",
              ),
              Obx(() {
                return ReusableTextField(
                  hintText: 'ready',
                  readOnly: true,
                  controller: TextEditingController(
                      text: controller.selectedValue.value),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                );
              }),
              const CustomTextIcon(
                text: "Location",
              ),
              ReusableTextField(
                hintText: 'Select a location',
                readOnly: true,
                formkey: locationformkey,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select a locaiton';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              CustomButton(
                text: "Search Now",
                ontap: () {
                  if (locationcontroller.text.isNotEmpty ||
                      locationformkey.currentState!.validate()) {
                    Fluttertoast.showToast(
                      msg: "Send a Code",
                    );
                    locationcontroller.clear();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
