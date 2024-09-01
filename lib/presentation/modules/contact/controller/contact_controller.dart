import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../backend/services/ApiServices.dart';

class ContactController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  RxString name = RxString('');
  RxString email = RxString('');
  RxString subject = RxString('');
  RxString phone = RxString('');
  RxString message = RxString('');


  Future<void> contactUsPost() async {
    try{
      var user = {
        "name":nameController.text,
        "email":emailController.text,
        "phone":phoneController.text,
        "subject":subjectController.text,
        "message":messageController.text
      };



      var response = await ApiServices().post("/contact-us", user).catchError((err){debugPrint("Unsuccessful");});
      if(response == null)return;
      debugPrint("Successful");
      Get.snackbar("Successful", "Submitted Successfully");
    }catch (e){
      Get.snackbar("Error", "Something went wrong");

    }

  }
}
