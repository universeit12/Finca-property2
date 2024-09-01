
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../utils/app_color.dart';

import '../controller/popular_district_controller.dart';
import '../model/division_model.dart';

class PopularCityScreen extends StatelessWidget {

  PopularCityScreen({super.key, required this.division});
  final DivisionModel division;


  @override
  Widget build(BuildContext context) {
     final controller = Get.put(DistrictController());
     controller.fetchDistrictDataById(division.id.toString());


    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          title: Text(division.name.toString()),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SafeArea(
                child: Column(
                  children: [
                    // Search Location
                    const SizedBox(height: 15.0),
                    // All properties list
                    Expanded(
                      child: Obx(
                            () => ListView.builder(
                          itemCount: controller.districtData.length,
                          itemBuilder: (context, index) {
                            final district=
                            controller.districtData[index];

                            // Navigate to Details screen
                            return InkWell(
                              onTap: () {
                                //Get.to(() => AllPropertyDetails(property: property));
                              },
                              child: Container(

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
                                    Column(
                                      children: [
                                        SizedBox(height: 40,),
                                        Container(
                                          height:100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 2,color: Colors.blue)
                                          ),
                                          child: Center(
                                            child: district.image != null?Image.network(
                                              district.image.toString(),
                                              width: w / 3,
                                              fit: BoxFit.cover,
                                              height: double.infinity,
                                            ):Center(child: Text("No image file")),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Property Info
                                    SizedBox(width: 20,),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 30,),
                                          Row(
                                            children: [
                                              Text("Divison:   ",style: TextStyle(fontSize: 18,color: Colors.black12),),
                                              Text("${district.divisionName.toString()}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                            ],
                                          ),

                                          SizedBox(height: 20,),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 2),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                                color: Colors.deepOrange,
                                            ),
                                            child: Row(
                                              children: [
                                                Text("District: ",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                                                Text("${district.name.toString()}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
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
        Text(property!="null"?property.toString():"",style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}
