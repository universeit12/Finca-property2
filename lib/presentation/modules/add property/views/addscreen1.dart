import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_text.dart';
import '../../populer citys/model/district_model.dart';
import '../../populer citys/model/division_model.dart';
import '../controller/add_controller.dart';
import '../controller/addpage1_controller.dart';
import '../model/property_type_model.dart';
import '../widgets/custom_text_icon.dart';
import '../widgets/textfield_custom.dart';

class Addscreen1 extends StatelessWidget {
  final PageController pageController;
  Addscreen1({super.key, required this.pageController});

  final controller = Get.put(Addpage1Controller());

  final addcontroller = Get.put(AddController());

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  CustomText(
                    text: 'Basic Information',
                    fontsize: 22.0,
                  ),
        
                  SizedBox(
                    height: 5,
                  ),
        
                  Obx(() {
                    return Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButton<PropertyTypeModel>(
                          underline: SizedBox.shrink(),
                          isExpanded: true,
                          hint: Text('Select Property Type',style: TextStyle(
                            color: Colors.grey, // Hint text color
                            fontSize: 12.0,
                          ),),
                          value: controller.selectedPropertyType.value,
                          onChanged: (PropertyTypeModel? value) {
                            controller.onPropertyTypeSelected(value);
                            //controller.fetchDivisions();
                          },
                          items: controller.propertyType.map((propertyType) {
                            return DropdownMenuItem<PropertyTypeModel>(
                              value: propertyType,
                              child: Text(propertyType.name.toString()??""),
                            );
                          }).toList(),
                        ));
                  }),
        
                  // City DropDown
        
                  Obx(() {
                    return Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButton<DivisionModel>(
                          underline: SizedBox.shrink(),
                          isExpanded: true,
                          hint: Text('Select Division',style: TextStyle(
                            color: Colors.grey, // Hint text color
                            fontSize: 12.0,
                          ),),
                          value: controller.selectedDivision.value,
                          onChanged: (DivisionModel? value) {
                            controller.onDivisionSelected(value);
                            //controller.fetchDivisions();
                          },
                          items: controller.divisions.map((division) {
                            return DropdownMenuItem<DivisionModel>(
                              value: division,
                              child: Text(division.name.toString()??""),
                            );
                          }).toList(),
                        ));
                  }),
                  Obx(() {
                    return Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButton<DistrictModel>(
                          underline: SizedBox.shrink(),
                          isExpanded: true,
                          hint: Text('Select District',style: TextStyle(
                            color: Colors.grey, // Hint text color
                            fontSize: 12.0,
                          ),),
                          value: controller.selectedDistrict.value,
                          onChanged: (DistrictModel? value) {
                            controller.onDistrictSelected(value);
                            //controller.fetchDivisions();
                          },
                          items: controller.districts.map((district) {
                            return DropdownMenuItem<DistrictModel>(
                              value: district,
                              child: Text(district.name.toString()??""),
                            );
                          }).toList(),
                        ));
                  }),
        
                  DropdownWidget(
                    dropDownList: const [
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
                    hinttext: "Construction Status",
                    enablesearch: false,
                    onchanged: (value) {
                      controller.status.value = value.value;
                    },
                  ),
        
                  ReusableTextField(
                    hintText: 'Property name',
                    controller: controller.propertyNameController,
                    onchanged: (value) {
                      controller.propertyName.value = value;
                    },
                  ),
                  ReusableTextField(
                    hintText: 'Type Address',
                    maxLines: 2,
                    controller: controller.addressController,
                    onchanged: (value) {
                      controller.addressName.value = value;
                    },
                  ),
        
                  SizedBox(height: 15.0),
                  CustomText(
                    text: 'Property Size & Pricing',
                    fontsize: 22.0,
                  ),
                  ReusableTextField(
                    hintText: "Property Size in sfd",
                    keyboardtype: TextInputType.number,
                    controller: controller.sizesFtController,

                  ),
                  ReusableTextField(
                    hintText: "Price per sft",
                    keyboardtype: TextInputType.number,
                    controller: controller.sizesPerFtController,

                  ),
        
                  ReusableTextField(
                    hintText: 'Utility & Other Cost',
                    keyboardtype: TextInputType.number,
                    controller: controller.utilitytController,

                  ),
                  ReusableTextField(
                    hintText: 'Total Price',
                    keyboardtype: TextInputType.number,
                    controller: TextEditingController(
                      text: controller.total.value.toStringAsFixed(2),
                    ),

                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: RadioListTile<String>(
                            activeColor: Colors.amber,
                            contentPadding: EdgeInsets.zero,
                            title: Text('Fixed'),
                            value: 'Fixed',
                            groupValue: controller.priceIs.value,
                            onChanged: (value) {
                              if (value != null) {
                                controller.setSelectedOption(value);
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          flex: 2,
                          child: RadioListTile<String>(
                            activeColor: Colors.amber,
                            contentPadding: EdgeInsets.zero,
                            title: Text('Negotiatable'),
                            value: 'Negotiatable',
                            groupValue: controller.priceIs.value,
                            onChanged: (value) {
                              if (value != null) {
                                controller.setSelectedOption(value);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  /// Property Basic Features...
                  const SizedBox(height: 15.0),
                  CustomText(
                    text: 'Property Basic Features',
                    fontsize: 22.0,
                  ),
        
                  // BEDROOM
                  if (controller.propertyvalue.value) ...[
                    const SizedBox(height: 5.0),
                    DropdownWidget(
                      dropDownList: const [
                        DropDownValueModel(name: '1', value: "1"),
                        DropDownValueModel(name: '2', value: "2"),
                        DropDownValueModel(name: '3', value: "3"),
                        DropDownValueModel(name: '4', value: "4"),
                        DropDownValueModel(name: '5+', value: "5+"),
                      ],
                      hinttext: "Bedroom",
                      enablesearch: false,
                      controller: controller.bedroomController,
                      onchanged: (value) {
                        controller.Bedroom.value = value.value;
                      },
                    ),
                    DropdownWidget(
                      dropDownList: const [
                        DropDownValueModel(name: '1', value: "1"),
                        DropDownValueModel(name: '2', value: "2"),
                        DropDownValueModel(name: '3', value: "3"),
                        DropDownValueModel(name: '4', value: "4"),
                        DropDownValueModel(name: '5+', value: "5+"),
                      ],
                      hinttext: "Bathroom",
                      enablesearch: false,
                      controller: controller.bathroomController,
                      onchanged: (value) {
                        controller.Bathroom.value = value.value;
                      },
                    ),
                    DropdownWidget(
                      dropDownList: [
                        DropDownValueModel(name: '1', value: "1"),
                        DropDownValueModel(name: '2', value: "2"),
                        DropDownValueModel(name: '3', value: "3"),
                        DropDownValueModel(name: '4', value: "4"),
                        DropDownValueModel(name: '5+', value: "5+"),
                      ],
                      hinttext: "Balconies",
                      enablesearch: false,
                      controller: controller.belconisController,
                      onchanged: (value) {
                        controller.Belconis.value = value.value;
                      },
                    ),
                  ],
        
                  // GARAGES
        
                  DropdownWidget(
                    dropDownList: const [
                      DropDownValueModel(name: 'No Parking', value: "No Parking"),
                      DropDownValueModel(name: '1', value: "1"),
                      DropDownValueModel(name: '2', value: "2"),
                      DropDownValueModel(name: '3', value: "3"),
                      DropDownValueModel(name: '4', value: "4"),
                      DropDownValueModel(name: '5+', value: "5+"),
                    ],
                    hinttext: "Garages",
                    enablesearch: false,
                    controller: controller.garagesController,
                    onchanged: (value) {
                      controller.garages.value = value.value;
                    },
                  ),
                  const SizedBox(height: 20),
        
                  // NEXT BUTTON
                  CustomButton(
                    text: "Continue",
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Fluttertoast.showToast(
                          msg:
                              "${controller.addressName.value} ${controller.propertyName.value}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                      }
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
