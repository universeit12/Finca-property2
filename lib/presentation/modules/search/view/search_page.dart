import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../add property/controller/custom_text_icon.dart';
import '../../add property/controller/textfield_custom.dart';
import '../controller/search_dropdown_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final SearchDropdownController _controller =
      Get.put(SearchDropdownController());
  final TextEditingController locationcontroller = TextEditingController();
  final locationformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.teal,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            children: [
              //Property type
              const CustomTextIcon(
                text: "Search Keyword",
              ),
              const ReusableTextField(
                hintText: 'Search text',
                maxLines: 2,
              ),
              //Property type
              const CustomTextIcon(
                text: "Property Caterogy",
              ),
              const ReusableTextField(
                hintText: 'Tap to select',
                readOnly: true,
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),

              DropdownWidget(
                dropDownList: const [
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
                controller: _controller,
                enablesearch: false,
                onchanged: (val) {
                  _controller.statusSelectedValue.value = val.value;
                },
              ),
              //Constructions status
              const CustomTextIcon(
                text: "Construction Status",
              ),
              DropdownWidget(
                dropDownList: const [
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
                controller: _controller,
                enablesearch: false,
                onchanged: (val) {
                  _controller.statusSelectedValue.value = val.value;
                },
              ),
              const CustomTextIcon(
                text: "Location",
              ),

              DropdownWidget(
                dropDownList: const [
                  DropDownValueModel(name: 'Dhaka', value: "Dhaka"),
                  DropDownValueModel(name: 'Chittagong', value: "Chittagong"),
                  DropDownValueModel(name: 'Sylhet', value: "Sylhet"),
                  DropDownValueModel(name: 'Rajshahi', value: "Rajshahi"),
                  DropDownValueModel(name: 'Khulna', value: "Khulna"),
                  DropDownValueModel(name: 'Barisal', value: "Barisal"),
                  DropDownValueModel(name: 'Rangpur', value: "Rangpur"),
                  DropDownValueModel(name: 'Mymensingh', value: "Mymensingh"),
                  DropDownValueModel(name: 'Jashore', value: "Jashore"),
                  DropDownValueModel(name: 'Tangail', value: "Tangail"),
                ],
                hintText: "Select an item",
                onchanged: (location) {
                  _controller.locationSelectedValue.value = location.value;
                },
                controller: _controller,
              ),
              const SizedBox(
                height: 25.0,
              ),
              CustomButton(
                text: "Search Now",
                ontap: () {
                  print(_controller.statusSelectedValue);
                  print(_controller.locationSelectedValue);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
