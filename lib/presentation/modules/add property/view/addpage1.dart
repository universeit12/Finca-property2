import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_dropdown.dart';
import '../controller/addpage1_controller.dart';
import '../widgets/custom_text_icon.dart';
import '../widgets/textfield_custom.dart';

class AddPage1 extends StatelessWidget {
  final PageController pageController;
  AddPage1({super.key, required this.pageController});

  final controller = Get.put(Addpage1Controller());
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const CustomText(
                      text: "Add Property",
                    )
                  ],
                ),
                const Divider(),
                const CustomTextIcon(text: "Property for"),
                const SizedBox(height: 5.0),
                const Row(
                  children: [
                    Icon(Icons.radio_button_on, color: Colors.blueAccent),
                    CustomText(text: "  Sell"),
                  ],
                ),

                //PROPERTY TYPE
                const CustomTextIcon(text: "Property type"),
                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(
                        name: 'Apartment/Flats', value: "Apartment/Flats"),
                    DropDownValueModel(
                        name: 'Independent House', value: "Independent House"),
                    DropDownValueModel(
                        name: 'Duplex/Home', value: "Duplex/Home"),
                    DropDownValueModel(
                        name: 'Shop/Restaurant', value: "Shop/Restaurant"),
                    DropDownValueModel(
                        name: 'Office Space', value: "Office Space"),
                    DropDownValueModel(
                        name: 'Industrial Space', value: "Industrial Space"),
                    DropDownValueModel(
                        name: 'Residential Plot', value: "Residential Plot"),
                    DropDownValueModel(
                        name: 'Commercial Plot', value: "Commercial Plot"),
                    DropDownValueModel(
                        name: 'Agriculture/Firm', value: "Agriculture/Firm"),
                  ],
                  hintText: "Select an item",
                  enablesearch: false,
                  controller: controller.typeController,
                  onchanged: (value) {
                    controller.updatePropertyType(value.value);
                  },
                ),

                //STATUS
                const CustomTextIcon(text: "Construction Status"),
                DropdownWidget(
                  dropDownList: [
                    DropDownValueModel(name: 'Any', value: "Any"),
                    DropDownValueModel(name: 'Ready', value: "Ready"),
                    DropDownValueModel(
                        name: 'Under Construction',
                        value: "Under Construction"),
                    DropDownValueModel(name: 'Used', value: "Used"),
                    DropDownValueModel(name: 'Upcoming', value: "Upcoming"),
                    DropDownValueModel(
                        name: 'Almost Ready', value: "Almost Ready"),
                  ],
                  controller: controller.statusController,
                  hintText: "Select an item",
                  enablesearch: false,
                ),

                //ADDRESS
                const CustomTextIcon(text: "Address"),
                ReusableTextField(
                  hintText: 'Type Address',
                  maxLines: 2,
                  controller: controller.addressController,
                ),

                //PROPERTY NAME
                const CustomTextIcon(text: "Enter Property name"),
                ReusableTextField(
                  hintText: 'Enter Property name',
                  maxLines: 2,
                  controller: controller.propertyNameController,
                ),
                const SizedBox(height: 10),

                //PRICEING & SIZE
                const CustomText(text: "Properties Size & Pricing"),

                //SIZE

                const CustomTextIcon(text: "Property size & sft"),
                ReusableTextField(
                  hintText: "Property size & sft",
                  keyboardtype: TextInputType.phone,
                  controller: controller.sizesftController,
                ),

                //UTILITY COST
                const CustomTextIcon(text: "Utility & Others cost"),
                ReusableTextField(
                  hintText: 'If any others cost',
                  keyboardtype: TextInputType.phone,
                  controller: controller.utilitytController,
                ),

                //TOTAL PRICE

                const CustomTextIcon(text: "Price in total"),
                ReusableTextField(
                  hintText: 'total price',
                  keyboardtype: TextInputType.phone,
                  controller: controller.priceController,
                ),

                //BASIC FEATURES
                if (controller.showAdditionalFields.value)
                  const CustomText(text: "Property basic features"),

                //BEDROOM
                if (controller.showAdditionalFields.value) ...[
                  const CustomTextIcon(text: "Bedroom"),
                  DropdownWidget(
                    dropDownList: const [
                      DropDownValueModel(name: '1', value: "1"),
                      DropDownValueModel(name: '2', value: "2"),
                      DropDownValueModel(name: '3', value: "3"),
                      DropDownValueModel(name: '4', value: "4"),
                      DropDownValueModel(name: '5', value: "5"),
                    ],
                    hintText: "Select an item",
                    enablesearch: false,
                    controller: controller.bedroomController,
                  )
                ],

                //BATHROOM

                if (controller.showAdditionalFields.value) ...[
                  const CustomTextIcon(text: "Bathroom"),
                  DropdownWidget(
                    dropDownList: const [
                      DropDownValueModel(name: '1', value: "1"),
                      DropDownValueModel(name: '2', value: "2"),
                      DropDownValueModel(name: '3', value: "3"),
                      DropDownValueModel(name: '4', value: "4"),
                    ],
                    hintText: "Select an item",
                    enablesearch: false,
                    controller: controller.bathroomController,
                  ),
                ],

                //BELCONIS

                if (controller.showAdditionalFields.value) ...[
                  const CustomTextIcon(text: "Belconis"),
                  DropdownWidget(
                    dropDownList: const [
                      DropDownValueModel(name: '1', value: "1"),
                      DropDownValueModel(name: '2', value: "2"),
                      DropDownValueModel(name: '3', value: "3"),
                      DropDownValueModel(name: '4', value: "4"),
                    ],
                    hintText: "Select an item",
                    enablesearch: false,
                    controller: controller.belconisController,
                  ),
                ],

                //GARAGES
                const CustomTextIcon(text: "Garages"),
                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'No Parking', value: "No Parking"),
                    DropDownValueModel(name: '1', value: "1"),
                    DropDownValueModel(name: '2', value: "2"),
                    DropDownValueModel(name: '3', value: "3"),
                    DropDownValueModel(name: '4', value: "4"),
                  ],
                  hintText: "Select an item",
                  enablesearch: false,
                  controller: controller.garagesController,
                ),
                const SizedBox(height: 20),

                //NEXT BUTTON
                CustomButton(
                  text: "Next",
                  ontap: () {
                    if (formkey.currentState!.validate()) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
