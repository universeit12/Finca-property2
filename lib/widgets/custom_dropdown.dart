import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../presentation/modules/search/controller/search_dropdown_controller.dart';

class DropdownWidget extends StatelessWidget {
  final List<DropDownValueModel> dropDownList;
  final String hintText;
  final SearchDropdownController controller;
  final enablesearch;
  final onchanged;
  const DropdownWidget({
    super.key,
    required this.dropDownList,
    this.hintText = "Select an option",
    required this.controller,
    this.enablesearch,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(6.0)),
      child: DropDownTextField(
          enableSearch: enablesearch ?? true,
          clearOption: false,
          searchTextStyle: const TextStyle(color: Colors.red),
          searchDecoration: InputDecoration(
            hintText: hintText,
          ),
          textFieldDecoration: const InputDecoration(
              hintText: "Tap to select", border: InputBorder.none),
          validator: (value) {
            if (value == null) {
              return "Required field";
            } else {
              return null;
            }
          },
          dropDownItemCount: dropDownList.length,
          dropDownList: dropDownList,
          onChanged: onchanged),
    );
  }
}
