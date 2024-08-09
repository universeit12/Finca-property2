import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

import '../widgets/custom_text_icon.dart';
import '../widgets/textfield_custom.dart';

class AddPage2 extends StatelessWidget {
  final PageController pageController;

  const AddPage2({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
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
            const ReusableTextField(
              hintText: '1',
              readOnly: true,
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
            const CustomTextIcon(text: "Title"),
            const ReusableTextField(
              hintText:
                  '212 sqft, 1 Bed Almost Ready Apartment/Flats for Sale at Karatia',
              maxLines: 2,
            ),
            const CustomTextIcon(text: "Description"),
            const ReusableTextField(
              hintText: 'Enter Description',
              maxLines: 4,
            ),
            const CustomTextIcon(text: "Phone Number"),
            const ReusableTextField(
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
