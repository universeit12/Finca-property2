import 'package:flutter/material.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

class AllPropertyDetails extends StatelessWidget {
  final data;
  const AllPropertyDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apartment/Flat Sell"),
        backgroundColor: AppColor.baseColor,
        titleSpacing: 0,
      ),
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
                  CustomText(
                    text: data["title"],
                    fontsize: 22.0,
                    maxline: 3,
                  ),
                  CustomText(
                    text: data["location"],
                    fontsize: 14.0,
                    color: AppColor.black_2,
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.bedroom_child_outlined),
                          CustomText(
                            text: data["bedroom"],
                            fontsize: 14.0,
                            color: AppColor.black_2,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.bathroom_outlined),
                          CustomText(
                            text: data["bathroom"],
                            fontsize: 14.0,
                            color: AppColor.black_2,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.fit_screen),
                          CustomText(
                            text: data["size"],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomButton(
                          text: "Call Owner",
                          ontap: () async {},
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        size: 35.0,
                        color: Colors.teal,
                      )
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
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow_outlined),
                      const CustomText(
                        text: "Property Name: ",
                      ),
                      CustomText(
                        text: data["property_name"],
                        fontsize: 13.0,
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow_outlined),
                      const CustomText(
                        text: "Property Type: ",
                      ),
                      CustomText(
                        text: data["type"],
                        fontsize: 13.0,
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow_outlined),
                      const CustomText(
                        text: "Property for: ",
                      ),
                      CustomText(
                        text: data["for"],
                        fontsize: 13.0,
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow_outlined),
                      const CustomText(
                        text: "Location: ",
                      ),
                      CustomText(
                        text: data["location"],
                        fontsize: 13.0,
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow_outlined),
                      const CustomText(
                        text: "Constructions state: ",
                      ),
                      CustomText(
                        text: data["status"],
                        fontsize: 13.0,
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow_outlined),
                      const CustomText(
                        text: "Floor available now: ",
                      ),
                      CustomText(
                        text: data["floor_available_now"],
                        fontsize: 13.0,
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow_outlined),
                      const CustomText(
                        text: "Transaction Now: ",
                      ),
                      CustomText(
                        text: data["transaction_now"],
                        fontsize: 13.0,
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.play_arrow_outlined),
                      const CustomText(
                        text: "Garages: ",
                      ),
                      CustomText(
                        text: data["transaction_now"],
                        fontsize: 13.0,
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const CustomText(
                    text: "DESCRIPTION",
                  ),
                  Container(
                    height: 5,
                    width: 50,
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    data["dis"],
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
