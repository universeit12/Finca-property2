import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = ''.obs;
  var rasidentialvalue = <String>['মান ১', 'মান ২', 'মান ৩'].obs;
  var Commertialvalue = <String>['মান ১', 'মান ২', 'মান ৩'].obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
