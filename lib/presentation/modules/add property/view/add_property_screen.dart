import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/add%20property/controller/add_property_controller.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../widgets/custom_text_icon.dart';
import '../widgets/textfield_custom.dart';

class AddPropertyScreen extends StatelessWidget {
  AddPropertyScreen({super.key});
  final _pageController = PageController();
  final controller = Get.put(AddPropertyController());

  //validation---->>>
  final typeController = SingleValueDropDownController();
  final statusController = SingleValueDropDownController();
  final addressController = TextEditingController();
  final properyNameController = TextEditingController();
  final priceController = TextEditingController();
  final bedroomController = SingleValueDropDownController();
  final bathroomController = SingleValueDropDownController();
  final belconisController = SingleValueDropDownController();
  final garagesController = SingleValueDropDownController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          addPage1(),
          addPage2(),
        ],
      ),
    );
  }

  //PAGE NUMBER-2------------>>>

  Widget addPage1() {
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

              //PROPERTY TYPE
              const Row(
                children: [
                  Icon(Icons.radio_button_on, color: Colors.blueAccent),
                  CustomText(text: "  Sell"),
                ],
              ),
              const CustomTextIcon(text: "Property type"),
              const DropdownWidget(
                dropDownList: [
                  DropDownValueModel(
                      name: 'Apartment/Flats', value: "Apartment/Flats"),
                  DropDownValueModel(
                      name: 'Independent House', value: "Independent House"),
                  DropDownValueModel(name: 'Duplex/Home', value: "Duplex/Home"),
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
              ),

              //STATUS
              const CustomTextIcon(text: "Construction Status"),
              const DropdownWidget(
                dropDownList: [
                  DropDownValueModel(name: 'Any', value: "Any"),
                  DropDownValueModel(name: 'Ready', value: "Ready"),
                  DropDownValueModel(
                      name: 'Under Construction', value: "Under Construction"),
                  DropDownValueModel(name: 'Used', value: "Used"),
                  DropDownValueModel(name: 'Upcomming', value: "Upcomming"),
                  DropDownValueModel(
                      name: 'Almost Ready', value: "Almost Ready"),
                ],
                hintText: "Select an item",
                enablesearch: false,
              ),

              //ADDRESS
              const CustomTextIcon(text: "Address"),
              ReusableTextField(
                hintText: 'Type Address',
                maxLines: 2,
                controller: addressController,
              ),

              //PROPERTY NAME
              const CustomTextIcon(text: "Enter Property name"),
              ReusableTextField(
                hintText: 'Enter Property name',
                maxLines: 2,
                controller: properyNameController,
              ),
              const SizedBox(height: 10),

              //PRICEING & SIZE
              const CustomText(text: "Properties Size & Pricing"),

              //SIZE
              const CustomTextIcon(text: "Property size in sft"),
              const ReusableTextField(
                hintText: 'Enter Property sft',
                keyboardtype: TextInputType.phone,
              ),

              //UTILITY COST
              const CustomTextIcon(text: "Utility & Others cost"),
              const ReusableTextField(
                hintText: 'If any others cost',
                keyboardtype: TextInputType.phone,
              ),

              //TOTAL PRICE
              const CustomTextIcon(text: "Price in total"),
              const ReusableTextField(
                hintText: 'total price',
                keyboardtype: TextInputType.phone,
              ),
              const SizedBox(height: 10),

              //BASIC FEATURES
              const CustomText(text: "Property basic features"),

              //BEDROOM
              const CustomTextIcon(text: "Bedroom"),
              const DropdownWidget(
                dropDownList: [
                  DropDownValueModel(name: '1', value: "1"),
                  DropDownValueModel(name: '2', value: "2"),
                  DropDownValueModel(name: '3', value: "3"),
                  DropDownValueModel(name: '4', value: "4"),
                  DropDownValueModel(name: '5', value: "5"),
                ],
                hintText: "Select an item",
                enablesearch: false,
              ),

              //BATHROOM
              const CustomTextIcon(text: "Bathroom"),
              const DropdownWidget(
                dropDownList: [
                  DropDownValueModel(name: '1', value: "1"),
                  DropDownValueModel(name: '2', value: "2"),
                  DropDownValueModel(name: '3', value: "3"),
                  DropDownValueModel(name: '4', value: "4"),
                ],
                hintText: "Select an item",
                enablesearch: false,
              ),

              //BELCONIS
              const CustomTextIcon(text: "Belconis"),
              const DropdownWidget(
                dropDownList: [
                  DropDownValueModel(name: '1', value: "1"),
                  DropDownValueModel(name: '2', value: "2"),
                  DropDownValueModel(name: '3', value: "3"),
                  DropDownValueModel(name: '4', value: "4"),
                ],
                hintText: "Select an item",
                enablesearch: false,
              ),

              //GARAGES
              const CustomTextIcon(text: "Garages"),
              const DropdownWidget(
                dropDownList: [
                  DropDownValueModel(name: '1', value: "1"),
                  DropDownValueModel(name: '2', value: "2"),
                  DropDownValueModel(name: '3', value: "3"),
                  DropDownValueModel(name: '4', value: "4"),
                ],
                hintText: "Select an item",
                enablesearch: false,
              ),
              const SizedBox(height: 20),

              //NEXT BUTTON
              CustomButton(
                text: "Next",
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    _pageController.nextPage(
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
  }

  //PAGE NUMBER-2------------>>>

  Widget addPage2() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            const CustomText(text: "Property additional information"),
            const CustomTextIcon(text: "Total number of floor"),
        ReusableTextField(
          hintText: '1',
          readOnly: true,
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
            const CustomTextIcon(text: "Title"),
            ReusableTextField(
              hintText:
              '212 sqft, 1 Bed Almost Ready Apartment/Flats for Sale at Karatia',
              maxLines: 2,
            ),
            const CustomTextIcon(text: "Description"),
        ReusableTextField(
          hintText: 'Enter Description',
          maxLines: 4,
        ),
            const CustomTextIcon(text: "Phone Number"),
        ReusableTextField(
          hintText: '+8801*********',
          keyboardtype: TextInputType.phone,
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
            const SizedBox(height: 10.0),
            CustomButton(
              text: "Post",
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
