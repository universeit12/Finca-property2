import 'package:get/get.dart';

class AddPropertyController extends GetxController {
  RxString selectedPropertyType = RxString("");
  RxString sizeFieldLabel = RxString("Property size in sft");

  void updatePropertyType(String type) {
    selectedPropertyType.value = type;

    if (['Residential Plot', 'Commercial Plot', 'Agriculture/Firm']
        .contains(type)) {
      sizeFieldLabel.value = 'Property Size in Katha';
    } else {
      sizeFieldLabel.value = 'Property size in sft';
    }
  }
}
