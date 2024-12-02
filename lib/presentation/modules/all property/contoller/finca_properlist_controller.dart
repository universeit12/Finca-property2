import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/all_property_model.dart';
import '../model/property_model.dart';


class FincaPropertyController extends GetxController {
  var propertyList = <PropertyModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProperties();
    super.onInit();
  }

  void fetchProperties() async {
    try {
      isLoading(true);
      var properties = await _fetchPropertiesFromApi();
      if (properties.isNotEmpty) {
        propertyList.assignAll(properties);
      }
    } finally {
      isLoading(false);
    }
  }

  // API call function
  Future<List<PropertyModel>> _fetchPropertiesFromApi() async {
    var response = await http.get(
      Uri.parse('https://finca.psdcedu.xyz/api/property'),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonData = json.decode(jsonString);

      return (jsonData as List)
          .map((property) => PropertyModel.fromJson(property))
          .toList();
    } else {
      return [];
    }
  }
}