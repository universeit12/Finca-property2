import 'package:flutter/material.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

class AllPropertyDetails extends StatelessWidget {
  const AllPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Property Details"),
        backgroundColor: AppColor.baseColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: "16000 sqrt let at Gulsan 01",
                fontsize: 22.0,
              ),
              const SizedBox(height: 15.0),
              Image.asset(
                "assets/images/flat.jpg",
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30.0),
              const CustomText(
                text: "Call for sell",
                fontsize: 18.0,
                color: AppColor.baseColor,
              ),
              const CustomText(
                text: "Apartment/Flat for sell",
                fontsize: 18.0,
                color: AppColor.black_,
              ),
              const Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  CustomText(
                    text: "Aftabnagar, badda, dhaka",
                    fontsize: 14.0,
                    color: AppColor.black_2,
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.bedroom_child_outlined),
                      CustomText(
                        text: "03 Beds",
                        fontsize: 14.0,
                        color: AppColor.black_2,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.bathroom_outlined),
                      CustomText(
                        text: "02 bathroom",
                        fontsize: 14.0,
                        color: AppColor.black_2,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.fit_screen),
                      CustomText(
                        text: "1650 sqrt",
                        fontsize: 14.0,
                        color: AppColor.black_2,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              const Divider(
                color: Colors.black12,
              ),
              const SizedBox(height: 15.0),
              const Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Get Phone Num",
                      background: Colors.white70,
                      fontcolor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      text: "Call Owner",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              const Divider(
                color: Colors.black12,
              ),
              const SizedBox(height: 15.0),
              const CustomText(
                text: "PROPERTY SUMMARY",
              ),
              Container(
                height: 5,
                width: 50,
                color: Colors.teal,
              ),
              const SizedBox(height: 10.0),
              const Row(
                children: [
                  Icon(Icons.play_arrow_outlined),
                  CustomText(
                    text: "Property Name: ",
                  ),
                  CustomText(
                    text: "Modhu City",
                    fontsize: 13.0,
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.play_arrow_outlined),
                  CustomText(
                    text: "Property Type: ",
                  ),
                  CustomText(
                    text: "Resitential",
                    fontsize: 13.0,
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.play_arrow_outlined),
                  CustomText(
                    text: "Property for: ",
                  ),
                  CustomText(
                    text: "Sell",
                    fontsize: 13.0,
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.play_arrow_outlined),
                  CustomText(
                    text: "Location: ",
                  ),
                  CustomText(
                    text: "Modhu City",
                    fontsize: 13.0,
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.play_arrow_outlined),
                  CustomText(
                    text: "Constructions state: ",
                  ),
                  CustomText(
                    text: "Ready",
                    fontsize: 13.0,
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.play_arrow_outlined),
                  CustomText(
                    text: "Floor available now: ",
                  ),
                  CustomText(
                    text: "Modhu City",
                    fontsize: 13.0,
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.play_arrow_outlined),
                  CustomText(
                    text: "Floor available now: ",
                  ),
                  CustomText(
                    text: "Modhu City",
                    fontsize: 13.0,
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.play_arrow_outlined),
                  CustomText(
                    text: "Transaction Now: ",
                  ),
                  CustomText(
                    text: "New",
                    fontsize: 13.0,
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.play_arrow_outlined),
                  CustomText(
                    text: "Garages: ",
                  ),
                  CustomText(
                    text: "No parking",
                    fontsize: 13.0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
