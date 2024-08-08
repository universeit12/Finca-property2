import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PopupController extends GetxController {
  var selectedValue = ''.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}