import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupController extends GetxController {
  final mobilegecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final passcontroller = TextEditingController();
   var selectedOption = 'User'.obs;

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }

}
