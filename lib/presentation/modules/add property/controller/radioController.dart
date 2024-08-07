import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker _picker = ImagePicker();
  var imageFile = Rxn<File>();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile.value = File(image.path);
    }
  }
}
