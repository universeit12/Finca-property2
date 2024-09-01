import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';

import '../../../../backend/services/ApiServices.dart';
import '../../../../widgets/custom_button.dart';
import '../../profile/controller/profile_controller.dart';
import '../controller/booking_controller.dart';
import '../controller/booking_property_controller.dart';
import '../model/booking_model.dart';

class BookingScreen2 extends StatelessWidget {
  BookingScreen2({super.key});
  final controller = Get.put(BookingController());
  final bookingController = Get.put(BookingPropertyController());

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ProfileController());
    var selectedValue;

    final nameController = TextEditingController(text: controller.fullName.toString());
    final emailController = TextEditingController(text: controller.email.toString());

    final phoneController = TextEditingController(text: controller.phone.toString());
    final messageController = TextEditingController();
    final propertyType = TextEditingController();

    Future<void> bookingRegister() async {
      try {
        var user = {
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "property_description": messageController.text,
          "property_type":bookingController.selectedProperty.value?.id.toString(),
        };
        var response =
        await ApiServices().post2("/booking", user).catchError((err) {
          debugPrint("Unsuccessful");
        });
        if (response == null) return;
        debugPrint("Successful");
        Get.snackbar("Successful", "Submitted Successfully");
      } catch (e) {
        Get.snackbar("Error", "Something went wrong");
      }
    }

    return Scaffold(
      appBar: Backappbar(title: "Booking Now"),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(rect);
                  },
                  child: Text(
                    'Booking Now',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Provide information about your desired properties.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),

                // Name Input
                buildTextField(
                  hintText: "Your Name",
                  controller: nameController

                ),
                SizedBox(height: 15),

                // Email Input
                buildTextField(
                  hintText: "Your Email",
                  controller: emailController,

                ),
                SizedBox(height: 15),

                // Phone Input
                buildTextField(
                  hintText: "Your Phone",
                  controller: phoneController,

                ),
                SizedBox(height: 20),

                // Property Dropdown
                Obx(() {
                  if (bookingController.isLoading.value) {
                    return CircularProgressIndicator(
                      color: Colors.purple,
                    );
                  }

                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<BookingModel>(
                        hint: Text(
                          'Choose a property',
                          style:
                          TextStyle(color: Colors.grey[600], fontSize: 16),
                        ),
                        isExpanded: true,
                        value: bookingController.selectedProperty.value,
                        onChanged: (BookingModel? newValue) {
                          bookingController.selectedProperty.value = newValue;
                          print(bookingController.selectedProperty.value);
                        },
                        items: [
                          for (int i = 0;
                          i < bookingController.properties.length;
                          i++)
                            DropdownMenuItem<BookingModel>(
                              value: bookingController.properties[i],
                              child: Text(
                                bookingController.properties[i].title,
                                style: TextStyle(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                        ],
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 20),

                // Description Input
                buildTextField(
                  hintText: "Write A Short Description",
                  controller: messageController,
                  maxLines: 4,

                ),
                SizedBox(height: 30),

                // Send Button with Gradient Background
                CustomButton(
                  text: "Send Message",
                  onTap: () {
                    bookingRegister();
                    Get.snackbar("Success", "Successfully submitted");
                    //Fluttertoast.showToast(msg: controller.name.value);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String hintText,
    required TextEditingController controller,

    int maxLines = 1,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.5, color: Colors.blue),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,

        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black54),
          border: InputBorder.none,
        ),
      ),
    );
  }
}