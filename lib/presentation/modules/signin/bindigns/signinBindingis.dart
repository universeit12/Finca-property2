import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/signin/controller/signin%20_controller.dart';

class Signinbindingis implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}
