


import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio;
import 'addpage1_controller.dart';
import 'addpage2_controller.dart'; // For token storage
class AddController3 extends GetxController {
  final add1Controller = Get.put(Addpage1Controller());
  final add2Controller = Get.put(Addpage2Controller());
  final mapController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // Storage for token
  final storage = GetStorage();

  // Featured Image
  XFile? _imageFile;
  RxString fileName = 'No file chosen'.obs;

  // File Pickers for Multiple Files
  var selectedFiles = <PlatformFile>[].obs;
  var selectedFiles1 = <PlatformFile>[].obs;
  var selectedFiles2 = <PlatformFile>[].obs;

  /// Pick a single featured image
  Future<void> pickFile() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      fileName.value = pickedFile.name;
      _imageFile = pickedFile;
    }
  }

  /// Pick multiple gallery images
  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null && result.files.isNotEmpty) {
      selectedFiles.addAll(result.files);
    }
  }

  /// Pick multiple floor images
  Future<void> pickFilesFloor() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null && result.files.isNotEmpty) {
      selectedFiles1.addAll(result.files);
    }
  }

  /// Pick multiple location map images
  Future<void> pickFilesLocationsMap() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null && result.files.isNotEmpty) {
      selectedFiles2.addAll(result.files);
    }
  }

  /// Remove selected file (gallery)
  void removeFile(PlatformFile file) {
    selectedFiles.remove(file);
  }

  /// Remove selected floor image
  void removeFileFloor(PlatformFile file) {
    selectedFiles1.remove(file);
  }

  /// Remove selected location map image
  void removeFileLocationMap(PlatformFile file) {
    selectedFiles2.remove(file);
  }

  /// Submit property via API
  Future<void> submitProperty() async {
    String? token = storage.read("token");

    if (token == null || token.isEmpty) {
      Get.snackbar('Error', 'Authentication token not found');
      return;
    }
/*
    if (_imageFile == null) {
      Get.snackbar('Error', 'Please select a featured image');
      return;
    }*/

    //Dio dio = Dio();
    dio.Dio dioClient = dio.Dio();

    // Form Data
    dio.FormData formData = dio.FormData.fromMap({
      "instructor_img": "https://i.ibb.co/gt4FcT2/9-Lather-Design.jpg",
      "instructor_name" : 'Riaz',
      "instructor_role": 'Dreamland Towers',
      'course_id': '026572',

    });

    try {
      // POST request
      var response = await dioClient.post(
        'https://lms-server-theta.vercel.app/api/v1/instructor/create',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Property submitted successfully!');
        print(response.data);
      } else {
        Get.snackbar('Error', 'Failed to submit property');
        print('Error: ${response.statusCode} - ${response.data}');
      }
    } catch (e) {
      if (e is dio.DioError) {
        print('DioError: ${e.response?.statusCode} - ${e.message}');
        Get.snackbar('Error', 'Failed to submit property');
      } else {
        print('Unexpected error: $e');
        Get.snackbar('Error', 'Unexpected error occurred');
      }
    }
  }
}
