import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:universe_it_project/presentation/modules/all%20property/widgets/contact_button.dart';
import 'package:universe_it_project/presentation/modules/all%20property/widgets/property_semmary.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

class AllPropertyDetails extends StatelessWidget {
  final data;
  const AllPropertyDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: 'Apartment/Flat Sell', bgcolor: Colors.teal),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              data["img"],
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Property Title
                  CustomText(
                    text: data["title"],
                    fontsize: 20.0,
                    maxline: 3,
                    color: Colors.teal,
                  ),

                  ///Location
                  CustomText(
                    text: data["location"],
                    fontsize: 16.0,
                    color: AppColor.black_,
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),

                  ///Property Summary
                  const CustomText(
                    text: "PROPERTY SUMMARY",
                  ),
                  Container(
                    height: 5,
                    width: 50,
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: 'Size: 1231.00 sft',
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: 'Total Apartment: 2',
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: 'Facing: North',
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: '5 Beds',
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: '5 Belconies',
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: 'Size: 121.00 Katha',
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: 'Apartment Size: 1231.00 Ft',
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: 'Status: Ready',
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: '5 Bathroom',
                  ),
                  const SizedBox(height: 10.0),
                  PropertySemmary(
                    text: '1 Garages',
                  ),
                  SizedBox(height: 30.0),

                  ///Contact Now

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ContactButton(
                        text: "Call Now",
                        ontap: () {},
                      ),
                      ContactButton(
                        text: "Booking Now",
                        ontap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
