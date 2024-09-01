import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_text.dart';
import '../controller/add_controller.dart';
import '../controller/addpage1_controller.dart';
import '../widgets/custom_text_icon.dart';
import '../widgets/textfield_custom.dart';

class Addscreen1 extends StatelessWidget {
  final PageController pageController;
  Addscreen1({super.key, required this.pageController});

  final controller = Get.put(Addpage1Controller());
  final addcontroller = Get.put(AddPropertyController());
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
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const CustomText(
                      text: "Add Property",
                      fontsize: 20.0,
                      fontweight: FontWeight.bold,
                    ),
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
                const SizedBox(height: 15.0),

                // PROPERTY TYPE
                const CustomTextIcon(text: "Property type"),
                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'Apartment/Flats', value: "Apartment/Flats"),
                    DropDownValueModel(name: 'Independent House', value: "Independent House"),
                    DropDownValueModel(name: 'Duplex/Home', value: "Duplex/Home"),
                    DropDownValueModel(name: 'Shop/Restaurant', value: "Shop/Restaurant"),
                    DropDownValueModel(name: 'Office Space', value: "Office Space"),
                    DropDownValueModel(name: 'Industrial Space', value: "Industrial Space"),
                    DropDownValueModel(name: 'Residential Plot', value: "Residential Plot"),
                    DropDownValueModel(name: 'Commercial Plot', value: "Commercial Plot"),
                    DropDownValueModel(name: 'Agriculture/Firm', value: "Agriculture/Firm"),
                  ],
                  hintText: "Select an item",
                  enablesearch: false,
                  controller: controller.typeController,
                  onchanged: (value) {
                    addcontroller.type.value = value.value;
                    controller.updatePropertyType(value.value);
                  },
                ),
                const SizedBox(height: 15.0),

                // CONSTRUCTION STATUS
                const CustomTextIcon(text: "Construction Status"),
                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'Any', value: "Any"),
                    DropDownValueModel(name: 'Ready', value: "Ready"),
                    DropDownValueModel(name: 'Under Construction', value: "Under Construction"),
                    DropDownValueModel(name: 'Used', value: "Used"),
                    DropDownValueModel(name: 'Upcoming', value: "Upcoming"),
                    DropDownValueModel(name: 'Almost Ready', value: "Almost Ready"),
                  ],
                  controller: controller.statusController,
                  hintText: "Select an item",
                  enablesearch: false,
                  onchanged: (value) {
                    addcontroller.status.value = value.value;
                  },
                ),
                const SizedBox(height: 15.0),

                // ADDRESS
                const CustomTextIcon(text: "Address"),
                ReusableTextField(
                  hintText: 'Type Address',
                  maxLines: 2,
                  controller: controller.addressController,
                  onchanged: (value) {
                    addcontroller.addressName.value = value;
                  },
                ),
                const SizedBox(height: 15.0),

                // PROPERTY NAME
                const CustomTextIcon(text: "Enter Property Name"),
                ReusableTextField(
                  hintText: 'Enter Property name',
                  maxLines: 2,
                  controller: controller.propertyNameController,
                  onchanged: (value) {
                    addcontroller.propertyName.value = value;
                  },
                ),
                const SizedBox(height: 15.0),

                // PRICING & SIZE
                const CustomText(text: "Properties Size & Pricing"),
                const SizedBox(height: 5.0),

                // SIZE
                const CustomTextIcon(text: "Property size (sft)"),
                ReusableTextField(
                  hintText: "Property size in sft",
                  keyboardtype: TextInputType.number,
                  controller: controller.sizesftController,
                  onchanged: (value) {
                    addcontroller.size.value = value;
                  },
                ),
                const SizedBox(height: 15.0),

                // UTILITY COST
                const CustomTextIcon(text: "Utility & Other Costs"),
                ReusableTextField(
                  hintText: 'If any other costs',
                  keyboardtype: TextInputType.number,
                  controller: controller.utilitytController,
                  onchanged: (value) {
                    addcontroller.utilityCost.value = value;
                  },
                ),
                const SizedBox(height: 15.0),

                // TOTAL PRICE
                const CustomTextIcon(text: "Total Price"),
                ReusableTextField(
                  hintText: 'Total price',
                  keyboardtype: TextInputType.number,
                  controller: controller.priceController,
                  onchanged: (value) {
                    addcontroller.totalPrice.value = value;
                  },
                ),
                const SizedBox(height: 15.0),

                // BEDROOM
                if (controller.propertyvalue.value) ...[
                  const CustomText(text: "Property Basic Features"),
                  const SizedBox(height: 5.0),
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
                    onchanged: (value) {
                      addcontroller.Bedroom.value = value.value;
                    },
                  ),
                  const SizedBox(height: 15.0),

                  // BATHROOM
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
                    onchanged: (value) {
                      addcontroller.Bathroom.value = value.value;
                    },
                  ),
                  const SizedBox(height: 15.0),

                  // BALCONIES
                  const CustomTextIcon(text: "Balconies"),
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
                    onchanged: (value) {
                      addcontroller.Belconis.value = value.value;
                    },
                  ),
                  const SizedBox(height: 15.0),
                ],

                // GARAGES
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
                  onchanged: (value) {
                    addcontroller.garages.value = value.value;
                  },
                ),
                const SizedBox(height: 20),

                // NEXT BUTTON
                CustomButton(
                  text: "Next",
                  ontap: () {
                    if (formkey.currentState!.validate()) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      Fluttertoast.showToast(
                        msg: "${addcontroller.addressName.value} ${addcontroller.propertyName.value}",
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
    });
  }
}
