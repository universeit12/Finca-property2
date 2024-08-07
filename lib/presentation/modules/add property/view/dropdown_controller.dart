import 'package:get/get.dart';

class OptionController extends GetxController {
  var selectedValue = ''.obs; // Observable for storing the selected value
  final options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }
}
