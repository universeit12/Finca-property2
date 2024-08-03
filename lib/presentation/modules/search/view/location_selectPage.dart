import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/search_controller.dart';

class LocationSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.find<LocationController>();
    final TextEditingController controller = TextEditingController();
    List<String> allLocations = ['Location1', 'Location2', 'Location3'];
    RxList<String> filteredLocations = allLocations.obs;

    void filterLocations(String query) {
      filteredLocations.value = allLocations
          .where((location) => location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              onChanged: filterLocations,
              decoration: const InputDecoration(
                hintText: 'Search locations...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (context, index) {
                  final location = filteredLocations[index];
                  return ListTile(
                    title: Text(location),
                    onTap: () {
                      locationController.setLocation(location);
                      Get.back(result: location);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
