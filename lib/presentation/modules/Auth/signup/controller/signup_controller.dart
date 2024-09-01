
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/backend/services/ApiServices.dart';


class SignupController extends GetxController {

  // Customer Variables
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  // Customer Variables
  final companyMobileController = TextEditingController();
  final companyMobile2Controller = TextEditingController();
  final companyEmailController = TextEditingController();
  final companyClientNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final companyDesignationController = TextEditingController();
  final companyOfficeAddressController = TextEditingController();
  final companyPassController = TextEditingController();
  final companyConfirmPassController = TextEditingController();

  var selectedOption = 'User'.obs;

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }


  Future<void> customerRegister() async {
    try{
      var user = {
        "password": passController.text,
        "full_name": nameController.text,
        "phone": mobileController.text,
        "email": emailController.text,
        "is_customer": true,
        "is_seller": false,


      };
      var response = await ApiServices().post("/user/create", user).catchError((err){debugPrint("Unsuccessful");});
      if(response == null)return;
      debugPrint("Successful");
      Get.snackbar("Successful", "Submitted Successfully");

    }catch(e){
      Get.snackbar("Error", "Something went wrong");

    }

  }
  Future<void> CompanyRegister() async {
    try{
      var user = {
        "password": companyPassController.text,
        "full_name": companyClientNameController.text,
        "phone": companyMobileController.text,
        "email": companyEmailController.text,
        "is_customer": false,
        "is_seller": true,
        "profile": {
          "company_name": companyNameController.text,
          "designation": companyDesignationController.text,
          "phone2": companyMobile2Controller.text,
          "office_address": companyOfficeAddressController.text
        }


      };
      var response = await ApiServices().post("/user/create", user).catchError((err){debugPrint("Unsuccessful");});
      if(response == null)return;
      debugPrint("Successful");
      Get.snackbar("Successful", "Submitted Successfully");
    }catch (e){
      Get.snackbar("Error", "Something went wrong");

    }

  }


}
