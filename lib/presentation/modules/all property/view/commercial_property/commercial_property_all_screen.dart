import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_textfield3.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../widgets/custom_text.dart';
import '../../contoller/all_property_controller.dart';
import '../../contoller/favorte_controller.dart';
import '../../contoller/finca_properlist_controller.dart';
import '../../contoller/search_controller.dart';
import '../all_property_details.dart';

class CommercialAllPropertyScreen extends StatelessWidget {
  CommercialAllPropertyScreen ({super.key});
  final controller = Get.put(AllSearchController());

  final propertyController = Get.put(FincaPropertyController());
  final allProperty = Get.put(AllPropertyController());

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          title: Text('Featured Commercial Property'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() {
          if (propertyController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SafeArea(
                child: Column(
                  children: [
                    // Search Location
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfield3(
                            onchanged: (value) {
                              controller.runFilter(value);
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search,
                              color: AppColor.baseColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    // All properties list
                    Expanded(
                      child: Obx(
                            () => ListView.builder(
                          itemCount: propertyController.propertyList.length,
                          itemBuilder: (context, index) {
                            final property = propertyController.propertyList[index];

                            // Navigate to Details screen
                            return property.property!.mainPropertyTypeName == "Commercial"?InkWell(
                              onTap: () {
                                Get.to(() =>
                                    AllPropertyDetails(property: property));
                              },
                              child: Container(

                                height: 150,
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      spreadRadius: 1.0,
                                      blurRadius: 10.0,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Property image
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(10.0)),
                                          child: Image.network(
                                            property.property!.featuredImage ?? ' ',
                                            width: w / 3,
                                            fit: BoxFit.cover,
                                            height: double.infinity,
                                          ),
                                        ),

                                        Positioned(
                                          bottom: 2,
                                          left: 0,
                                          child: Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomLeft:
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Text(" ৳ ${property.property!.price.toString()} "?? ' ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Property Info
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text:
                                              property.property!.propertyName ?? ' ',
                                              color: Colors.teal,
                                              maxline: 1,
                                              fontsize: 16.0,
                                              fontweight: FontWeight.bold,
                                            ),
                                            SizedBox(height: 5,),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 2),
                                              decoration: BoxDecoration(
                                                  color: Colors.deepOrange),
                                              child: CustomText(
                                                text:
                                                property.property!.propertyTypeName ??
                                                    ' ',
                                                color: Colors.white,
                                                fontsize: 16.0,
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on,size: 15,),
                                                SizedBox(width: 5,),
                                                CustomText(
                                                  text: property.property!.areaName ?? ' ',
                                                  color: Colors.black,
                                                  fontsize: 14.0,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            ///Status
                                            Text(property.property!.size.toString()!=null?" Size ${property.property!.size} sqf":"",style: TextStyle(fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ):Text("");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }


        }


        ));
  }
  Widget CustomColumnText(String property,String text) {
    return Column(
      children: [
        Text(text,style: TextStyle(fontSize: 12,color: Colors.blue),),
        SizedBox(height: 5,),
        Text(property!="null"?property.toString():""),
      ],
    );
  }
}
