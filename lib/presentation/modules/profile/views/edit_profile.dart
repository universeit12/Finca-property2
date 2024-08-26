import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: 'Edit Profile'),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: 'Phone'),
                Textfield1(),
                CustomText(text: 'Email'),
                Textfield1(),
                CustomText(text: 'Name'),
                Textfield1(),
                CustomText(text: 'Monthly Income'),
                Textfield1(),
                CustomText(text: 'Permanent Address'),
                Textfield1(),
                CustomText(text: 'Present Address'),
                Textfield1(),
                SizedBox(height: 30.0),
                CustomButton(
                  text: 'SUBMIT',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
