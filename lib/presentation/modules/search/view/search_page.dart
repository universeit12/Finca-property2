import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/search/view/search_result.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../controller/search_controller.dart';
import 'location_selectPage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.teal,
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.play_arrow_outlined),
                    CustomText(
                      text: "I want to",
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: CustomText(
                    text: "Buy",
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            Obx(() {
              return Card(
                child: ListTile(
                  title: const Text('Select Location'),
                  trailing: locationController.selectedLocation.value.isNotEmpty
                      ? Text(locationController.selectedLocation.value)
                      : const Text("....."),
                  onTap: () async {
                    final result = await Get.to(() => LocationSelectionPage());
                    if (result != null) {
                      locationController.setLocation(result);
                    }
                  },
                ),
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
    );
  }
}
