import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_details.dart';
import 'package:universe_it_project/presentation/modules/search/view/search_page.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_searchBar.dart';
import '../../../../widgets/custom_text.dart';
import '../utils/property_data.dart';

class AllPropertyScreen extends StatelessWidget {
  const AllPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                    Flexible(child: CustomSearchBar(
                      ontap: () {
                        Get.to(() => SearchPage());
                      },
                    ))
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                for (int i = 0; i < propertyData.length; i++)
                  InkWell(
                    onTap: () {
                      Get.to(() => AllPropertyDetails(
                            data: propertyData[i],
                          ));
                    },
                    child: Container(
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                      decoration: BoxDecoration(
                          color: AppColor.white_1,
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1.0,
                                blurRadius: 8.0)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            propertyData[i]["img"],
                            width: w / 3.5,
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: propertyData[i]["title"],
                                    color: Colors.black,
                                    maxline: 2,
                                    fontsize: 14.0,
                                  ),
                                  CustomText(
                                    text: propertyData[i]["property_name"],
                                    color: Colors.black38,
                                    fontsize: 12.0,
                                  ),
                                  CustomText(
                                    text: propertyData[i]["location"],
                                    color: Colors.black38,
                                    fontsize: 12.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: propertyData[i]["for"],
                                        color: Colors.blue,
                                        fontsize: 14.0,
                                      ),
                                      const CustomText(
                                        text: "more..",
                                        color: Colors.blue,
                                        fontsize: 14.0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
