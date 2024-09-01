import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:universe_it_project/presentation/modules/all%20property/view/residential_property/featured_residentials_property_all_screen.dart';
import 'package:universe_it_project/widgets/custom_card.dart';

import '../../../../../widgets/custom_text.dart';
import '../../contoller/finca_properlist_controller.dart';
import '../../widgets/see_all_line.dart';
import '../all_property_details.dart';
import 'commercial_property_all_screen.dart';


class CommercialPropertyCard extends StatelessWidget {
  CommercialPropertyCard({super.key});

  final propertyController = Get.put(FincaPropertyController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (propertyController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return CustomCard(
          child: Column(
            children: [
              ///All Property See all...
              SeeAllLine(propertyTitle: "Commercial Property",onTap: (){
                Get.to(()=>CommercialAllPropertyScreen ());
              },),
              const SizedBox(height: 15.0),

              ///Property Card...
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: propertyController.propertyList.length > 10
                      ? 10
                      : propertyController.propertyList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final property = propertyController.propertyList[index];

                    return property.property!.mainPropertyTypeName == "Commercial"?InkWell(
                      onTap: () {
                        Get.to(() => AllPropertyDetails(property: property));
                      },
                      child: Container(
                        width: 210.0,
                        margin: const EdgeInsets.only(right: 30.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ///Images...
                                Container(
                                  height: 120.0,
                                  width: 220.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          property.property?.featuredImage.toString() ?? ' '),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                ///Favorite Icon...


                                ///Property Type ...
                                Positioned(
                                    left: -5,
                                    bottom: 20,
                                    child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              bottomLeft: Radius.circular(10.0),
                                            topLeft:Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0)
                                          )),
                                      child: Text(" ৳ ${property.property!.price.toString()} "?? ' ',
                                        style: TextStyle(color: Colors.white,fontSize: 10),
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //const SizedBox(height: 5.0),

                                  ///Title...
                                  CustomText(
                                    text: property.property!.propertyName ?? ' ',
                                    color: Colors.teal,
                                    maxline: 1,
                                    fontsize: 14.0,

                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    decoration:
                                    BoxDecoration(color: Colors.deepOrange),
                                    child: CustomText(
                                      text: property.property!.propertyTypeName ?? ' ',
                                      color: Colors.white,
                                      fontsize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  ///Location...
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
                          ],
                        ),
                      ),
                    ): Center(child: Text(""));
                  },
                ),
              ),
            ],
          ),
        );
      }
    });
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