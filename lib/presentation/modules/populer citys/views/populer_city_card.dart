import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/populer%20citys/controller/popular_city_controller.dart';
import 'package:universe_it_project/presentation/modules/populer%20citys/views/populer_district_screen.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

class PopulerCity extends StatelessWidget {
  const PopulerCity({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PopularCityController());
    return CustomCard(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Populer City",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Obx(() {
              // Observe the loading state and division data
              if (controller.isLoading.value) {
                return Center(
                    child: CircularProgressIndicator()); // Show loading spinner
              } else if (controller.divisionData.isEmpty) {
                return Center(child: Text('No data found.'));
              } else {
                return SizedBox(

                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.divisionData.length,
                    itemBuilder: (context, index) {
                      final division = controller.divisionData[index];
                      return InkWell(
                        onTap: () {
                          Get.to(() => PopularCityScreen(division: controller.divisionData[index],));
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(width: 2,color: Colors.blueAccent),
                                  ),
                              child: Image.network(division.image.toString(),height: 200,width: 250,fit: BoxFit.fill),
                            ),
                            Positioned(

                              bottom: 1,


                              child: Container(

                                height: 40,
                                width: 254,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(width: 2,color: Colors.blue),


                                ),
                                //width: 240,

                                child: Center(
                                  child: Text(division.name.toString(),style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            })
          ],
        ));
  }
}
