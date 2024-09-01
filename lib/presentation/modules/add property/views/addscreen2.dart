import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/add%20property/controller/add_controller.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../controller/addpage2_controller.dart';
import '../widgets/custom_text_icon.dart';
import '../widgets/textfield_custom.dart';

class Addscreen2 extends StatelessWidget {
  final PageController pageController;
  Addscreen2({super.key, required this.pageController});

  final controller = Get.put(Addpage2Controller());
  final addcontroller = Get.put(AddPropertyController());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const SizedBox(height: 10.0),
              const CustomText(
                text: "Property Additional Information",
                fontsize: 20.0,
                fontweight: FontWeight.bold,
              ),
              const Divider(),
              const CustomTextIcon(text: "Total Number of Floors"),
              const SizedBox(height: 5.0),

              // Number of Floors Dropdown
              DropdownWidget(
                dropDownList: const [
                  DropDownValueModel(name: '1', value: "1"),
                  DropDownValueModel(name: '2', value: "2"),
                  DropDownValueModel(name: '3', value: "3"),
                  DropDownValueModel(name: '4', value: "4"),
                  DropDownValueModel(name: '5', value: "5"),
                  DropDownValueModel(name: '6', value: "6"),
                  DropDownValueModel(name: '7', value: "7"),
                  DropDownValueModel(name: '8', value: "8"),
                ],
                hintText: "Select an item",
                enablesearch: false,
                controller: controller.florController,
                onchanged: (value) {
                  addcontroller.floorNumber.value = value.value;
                },
              ),
              const SizedBox(height: 15.0),

              // Title Text Field
              const CustomTextIcon(text: "Title"),
              ReusableTextField(
                hintText: '212 sqft, 1 Bed Almost Ready Apartment/Flats for Sale at Karatia',
                maxLines: 2,
                controller: controller.titlecontroller,
                onchanged: (value) {
                  addcontroller.title.value = value;
                },
              ),
              const SizedBox(height: 15.0),

              // Description Text Field
              const CustomTextIcon(text: "Description"),
              ReusableTextField(
                hintText: 'Enter Description',
                maxLines: 4,
                controller: controller.descriptioncontroller,
                onchanged: (value) {
                  addcontroller.Description.value = value;
                },
              ),
              const SizedBox(height: 15.0),

              // Phone Number Text Field
              const CustomTextIcon(text: "Phone Number"),
              ReusableTextField(
                hintText: '+8801*********',
                keyboardtype: TextInputType.phone,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                controller: controller.mobilecontroller,
                onchanged: (value) {
                  addcontroller.mobile.value = value;
                },
              ),
              const SizedBox(height: 20.0),

              // Post Button
              CustomButton(
                text: "Post",
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    Fluttertoast.showToast(
                      msg: "Property: ${addcontroller.title.value}\n"
                          "Address: ${addcontroller.addressName.value}, ${addcontroller.propertyName.value}",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
