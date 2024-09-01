import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import '../../populer citys/model/district_model.dart';
import '../../populer citys/model/division_model.dart';
import '../model/property_type_model.dart';

class Addpage1Controller extends GetxController {
  final typeController = SingleValueDropDownController();
  final statusController = SingleValueDropDownController();
  final bedroomController = SingleValueDropDownController();
  final bathroomController = SingleValueDropDownController();
  final belconisController = SingleValueDropDownController();
  final garagesController = SingleValueDropDownController();
  final addressController = TextEditingController();
  final propertyNameController = TextEditingController();
  //final priceController = TextEditingController(text: total.toStringAsFixed(2),);
  final sizesFtController = TextEditingController();
  final sizesPerFtController = TextEditingController();
  final utilitytController = TextEditingController();
  final RxBool propertyvalue = false.obs;
  var total = 0.0.obs;



  var type = ''.obs;
  var status = ''.obs;
  var addressName = ''.obs;
  var propertyName = ''.obs;
  var size = ''.obs;
  var utilityCost = ''.obs;
  var totalPrice = ''.obs;
  var Bedroom = ''.obs;
  var Bathroom = ''.obs;
  var Belconis = ''.obs;
  var garages = ''.obs;
  var floorNumber = ''.obs;
  var title = ''.obs;
  var Description = ''.obs;
  var mobile = ''.obs;
  var priceIs = ''.obs;
  void setSelectedOption(String value) {
    priceIs.value = value;
  }
  

  void updatePropertyType(String type) {
    propertyvalue.value = [
      'Apartment/Flats',
      'Independent House',
      'Duplex/Home',
    ].contains(type);
  }

  var divisions = <DivisionModel>[].obs;
  var districts = <DistrictModel>[].obs;
  var propertyType = <PropertyTypeModel>[].obs;
  var selectedDivision = Rxn<DivisionModel>();
  var selectedDistrict = Rxn<DistrictModel>();
  var selectedPropertyType = Rxn<PropertyTypeModel>();

  @override
  void onInit() {
    fetchDivisions();
    fetchPropertyType();

    // Add listeners to the text field controllers
    sizesFtController.addListener(_calculateTotal);
    sizesPerFtController.addListener(_calculateTotal);
    utilitytController.addListener(_calculateTotal);
    super.onInit();
  }

  // Function to calculate the total
  void _calculateTotal() {
    double field1Value = double.tryParse(sizesFtController.text) ?? 0.0;
    double field2Value = double.tryParse(sizesPerFtController.text) ?? 0.0;
    double field3Value = double.tryParse(utilitytController.text) ?? 0.0;

    total.value = (field1Value * field2Value) + field3Value;
  }

  void fetchPropertyType() async {
    final response = await http.get(Uri.parse('https://finca.psdcedu.xyz/api/property-type'));
    if (response.statusCode == 200) {
      var propertyTypeData = json.decode(response.body);
      propertyType.value = (propertyTypeData as List).map((e) => PropertyTypeModel.fromJson(e)).toList();
    } else {
      Get.snackbar('Error', 'Failed to load Property Type');
    }
  }
  void onPropertyTypeSelected(PropertyTypeModel? type) {
    selectedPropertyType.value = type;
  }

  void fetchDivisions() async {
    final response = await http.get(Uri.parse('https://finca.psdcedu.xyz/api/division'));
    if (response.statusCode == 200) {
      var divisionData = json.decode(response.body);
      divisions.value = (divisionData as List).map((e) => DivisionModel.fromJson(e)).toList();
    } else {
      Get.snackbar('Error', 'Failed to load divisions');
    }
  }

  void fetchDistricts(divisionId) async {
    final response = await http.get(Uri.parse('https://finca.psdcedu.xyz/api/district/$divisionId'));
    if (response.statusCode == 200) {
      var districtData = json.decode(response.body);
      districts.value = (districtData as List).map((e) => DistrictModel.fromJson(e)).toList();
    } else {
      Get.snackbar('Error', 'Failed to load districts');
    }
  }

  void onDivisionSelected(DivisionModel? division) {
    selectedDivision.value = division;
    selectedDistrict.value = null;
    if (division != null) {
      fetchDistricts(division.id);
    } else {
      districts.clear();
    }
  }

  void onDistrictSelected(DistrictModel? district) {
    selectedDistrict.value = district;
  }


}