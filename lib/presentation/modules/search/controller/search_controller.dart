import 'package:get/get.dart';

class SearchControlle extends GetxController {
  var selectedCity = ''.obs;
  var searchQuery = ''.obs;

  List<String> cities = ['Dhaka', 'Chattogram', 'Sylhet', 'Khulna', 'Rajshahi'];

  List<String> filteredCities() {
    if (searchQuery.value.isEmpty) {
      return cities;
    } else {
      return cities
          .where((city) =>
              city.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }
}
