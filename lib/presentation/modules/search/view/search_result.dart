import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_details.dart';

import '../../../../utils/Properties.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_text.dart';

class ResultsPage extends StatelessWidget {
  final String location;

  const ResultsPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final filteredProperties =
        properties.where((p) => p.location == location).toList();
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: ListView.builder(
        itemCount: filteredProperties.length,
        itemBuilder: (context, index) {
          final property = filteredProperties[index];
          return InkWell(
            onTap: (){
              Get.to(()=>AllPropertyDetails());
            },
            child: Container(
              height: 120,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  color: AppColor.white_1,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 1.0, blurRadius: 8.0)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    property.image,
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
                            text: property.city,
                            fontsize: 16.0,
                            color: Colors.teal,
                            maxline: 2,
                          ),
                          CustomText(
                            text: property.rent,
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
                                property.location,
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
          );
        },
      ),
    );
  }
}
/*
 ListTile(
            title: Text(property.title),
            subtitle: Text(property.rent),
            leading: Image.asset(property.image),
            onTap: () {
              // Handle item tap
            },
          );
* */
