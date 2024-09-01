


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../profile/controller/profile_controller.dart';


class BookingController extends GetxController {
 // final controller = Get.put(ProfileController());

  final nameController = TextEditingController(text: ProfileController().fullName.toString());
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  RxString name = RxString('');
  RxString email = RxString('');
  RxString subject = RxString('');
  RxString phone = RxString('');
  RxString message = RxString('');
  }



