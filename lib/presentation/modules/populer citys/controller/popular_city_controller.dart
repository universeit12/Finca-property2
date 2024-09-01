import 'dart:convert'; // For decoding JSON data
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:universe_it_project/presentation/modules/populer%20citys/model/division_model.dart';

class PopularCityController extends GetxController {
  // RxList to hold the division data and an RxBool for loading state
  var divisionData = <DivisionModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDivisionData(); // Fetch data when the controller is initialized
  }

  // Function to fetch division data from API
  Future<void> fetchDivisionData() async {
    try {
      final response = await http.get(
        Uri.parse('https://finca.psdcedu.xyz/api/division'), // Replace with your actual API URL
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        var divisions = data.map((json) => DivisionModel.fromJson(json)).toList();
        divisionData.assignAll(divisions);
        isLoading(false); // Set loading to false
      } else {
        throw Exception('Failed to load divisions');
      }
    } catch (e) {
      print('Error fetching data: $e');
      isLoading(false); // Handle errors and stop the loading indicator
    }
  }
}
