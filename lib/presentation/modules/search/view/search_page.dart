import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/search/view/search_result.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import '../../add property/controller/custom_text_icon.dart';
import '../../add property/controller/radioController.dart';
import '../controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final OptionController controller = Get.put(OptionController());
  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());

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
                return TextField(
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Search text',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () {},
                  controller: TextEditingController(
                      text: controller.selectedValue.value),
                );
              }), //Property type
              const CustomTextIcon(
                text: "Property Caterogy",
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
                  controller: TextEditingController(
                      text: controller.selectedValue.value),
                );
              }),
              //Constructions status
              const CustomTextIcon(
                text: "Construction Status",
              ),
              Obx(() {
                return TextField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: 'Ready',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),
                  onTap: () {},
                  controller: TextEditingController(
                      text: controller.selectedValue.value),
                );
              }),
              const CustomTextIcon(
                text: "Location",
              ),
              Obx(() {
                return TextField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: 'Select Location',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),
                  onTap: () {},
                  controller: TextEditingController(
                      text: controller.selectedValue.value),
                );
              }),

              const SizedBox(
                height: 25.0,
              ),
              CustomButton(
                text: "Search Now",
                ontap: () {
                  if (locationController.selectedLocation.value.isEmpty) {
                    Get.snackbar('Error', 'Please select a location');
                  } else {
                    Get.to(() => ResultsPage(
                        location: locationController.selectedLocation.value));
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
