import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../controller/addpage2_controller.dart';
import '../widgets/custom_text_icon.dart';
import '../widgets/textfield_custom.dart';

class AddPage2 extends StatelessWidget {
  final PageController pageController;

  AddPage2({super.key, required this.pageController});
  final controller = Get.put(Addpage2Controller());
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
                        curve: Curves.easeInOut);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const CustomText(text: "Property additional information"),
              const CustomTextIcon(text: "Total number of floor"),
              DropdownWidget(
                dropDownList: [
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
              ),
              const CustomTextIcon(text: "Title"),
              ReusableTextField(
                hintText:
                    '212 sqft, 1 Bed Almost Ready Apartment/Flats for Sale at Karatia',
                maxLines: 2,
                controller: controller.titlecontroller,
              ),
              const CustomTextIcon(text: "Description"),
              ReusableTextField(
                hintText: 'Enter Description',
                maxLines: 4,
                controller: controller.descriptioncontroller,
              ),
              const CustomTextIcon(text: "Phone Number"),
              ReusableTextField(
                hintText: '+8801*********',
                keyboardtype: TextInputType.phone,
                suffixIcon: Icon(Icons.arrow_drop_down),
                controller: controller.mobilecontroller,
              ),
              const SizedBox(height: 10.0),
              CustomButton(
                text: "Post",
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    Fluttertoast.showToast(msg: "Post Done");
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
