import 'dart:convert'; // For decoding JSON data
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/district_model.dart';
// Import the model

class DistrictController extends GetxController {
  // Use RxList of District model
  var districtData = <DistrictModel>[].obs;
  var isLoading = true.obs;

  // Function to fetch district data by ID from API
  Future<void> fetchDistrictDataById(String divisionId) async {
    try {
      isLoading(true); // Set loading to true
      final response = await http.get(
        Uri.parse('https://finca.psdcedu.xyz/api/district/$divisionId'), // Replace with your actual API URL
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        var districts = data.map((json) => DistrictModel.fromJson(json)).toList();
        districtData.assignAll(districts); // Update the observable list with District model objects
        isLoading(false); // Set loading to false
      } else {
        throw Exception('Failed to load districts');
      }
    } catch (e) {
      print('Error fetching data: $e');
      isLoading(false); // Handle errors and stop the loading indicator
    }
  }
}
