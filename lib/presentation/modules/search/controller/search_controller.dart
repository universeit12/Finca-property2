import 'package:get/get.dart';

class LocationController extends GetxController {
  var selectedLocation = ''.obs;

  void setLocation(String location) {
    selectedLocation.value = location;
  }
}
