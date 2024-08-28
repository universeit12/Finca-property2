import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/all%20property/contoller/all_property_controller.dart';
import 'package:universe_it_project/presentation/modules/all%20property/widgets/contact_button.dart';
import 'package:universe_it_project/presentation/modules/all%20property/widgets/property_semmary.dart';
import 'package:universe_it_project/presentation/modules/booking%20now/views/booking_screen.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

class AllPropertyDetails extends StatelessWidget {
  final data;
  AllPropertyDetails({super.key, this.data});
  final controller = Get.put(AllPropertyController());
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: 'Apartment/Flat Sell', bgcolor: Colors.teal),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200, // Set the height to 2/3 of the screen
                  child: Obx(() {
                    return PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.imageList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          controller.imageList[index],
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  }),
                ),
                Positioned(
                  right: 16,
                  top: 80,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (_pageController.page!.toInt() <
                          controller.imageList.length - 1) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 80,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (_pageController.page!.toInt() <
                          controller.imageList.length - 1) {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ],
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
                        ontap: () {
                          controller.makePhoneCall('01763551316');
                        },
                      ),
                      ContactButton(
                        text: "Booking Now",
                        ontap: () {
                          Get.to(()=>BookingScreen());
                        },
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
