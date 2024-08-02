import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/property_utils.dart';
import '../../../../widgets/custom_text.dart';
import '../../all property/view/all_property_details.dart';
import '../../all property/view/all_property_slider.dart';

class FavioriteScreen extends StatelessWidget {
  const FavioriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("FavioriteScreen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AllPropertySlider(),
            const SizedBox(
              height: 15.0,
            ),
            for (int i = 0; i < propertyUtils.length; i++)
              InkWell(
                onTap: () {
                  Get.to(const AllPropertyDetails());
                },
                child: Container(
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColor.white_1,
                      borderRadius: BorderRadius.circular(8),
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
                        propertyUtils[i]["img"],
                        width: w / 3.5,
                        fit: BoxFit.cover,
                        height: 120,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: propertyUtils[i]["city"],
                                fontsize: 16.0,
                                color: Colors.teal,
                                maxline: 2,
                              ),
                              CustomText(
                                text: propertyUtils[i]["features"],
                                fontsize: 12.0,
                                color: Colors.black54,
                                maxline: 2,
                              ),
                              CustomText(
                                text: propertyUtils[i]["price"],
                                fontsize: 15.0,
                                color: Colors.red,
                                maxline: 2,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.black54,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    propertyUtils[i]["location"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                ],
                              ),
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
    );
  }
}
