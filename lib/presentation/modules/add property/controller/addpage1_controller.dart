import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class Addpage1Controller extends GetxController {
  final SingleValueDropDownController typeController =
      SingleValueDropDownController();
  final SingleValueDropDownController statusController =
      SingleValueDropDownController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController sizesftController = TextEditingController();
  final TextEditingController utilitytController = TextEditingController();
  final SingleValueDropDownController bedroomController =
      SingleValueDropDownController();
  final SingleValueDropDownController bathroomController =
      SingleValueDropDownController();
  final SingleValueDropDownController belconisController =
      SingleValueDropDownController();
  final SingleValueDropDownController garagesController =
      SingleValueDropDownController();
  final RxBool propertyvalue = false.obs;


  void updatePropertyType(String type) {
    propertyvalue.value = [
      'Apartment/Flats',
      'Independent House',
      'Duplex/Home',
    ].contains(type);
  }
}
