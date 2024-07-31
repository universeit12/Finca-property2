import 'dart:async';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed('/signup_screen'); // Navigate to HomeScreen after 3 seconds
    });
  }
}
