import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:universe_it_project/presentation/modules/all%20property/contoller/favorte_controller.dart';
import 'package:universe_it_project/presentation/modules/all%20property/utils/property_data.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_details.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_screen.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import '../../../../widgets/custom_text.dart';

class AllPropertyHomepageCard extends StatelessWidget {
  AllPropertyHomepageCard({super.key});
  final favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: "All Property",
                ),
                InkWell(
                  onTap: () {
                    Get.to(AllPropertyScreen());
                  },
                  child: const CustomText(
                    text: "See all..",
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: propertyData.length > 2 ? 2 : propertyData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final item = propertyData[index];
                // ignore: unused_local_variable
                final isFavorite = favoriteController.favoriteItems
                    .any((fav) => fav['Id'] == item['Id']);
                return InkWell(
                  onTap: () {
                    Get.to(() => AllPropertyDetails(
                          data: propertyData[index],
                        ));
                  },
                  child: Container(
                    width: 210.0,
                    height: 200,
                    margin: const EdgeInsets.only(right: 30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 100.0,
                              width: 220.0,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage(propertyData[index]["img"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Obx(() {
                                bool isFavorite =
                                    favoriteController.isFavorite(item['id']);
                                return IconButton(
                                  onPressed: () {
                                    favoriteController.toggleFavorite(item);
                                  },
                                  icon: Icon(
                                    isFavorite ? Iconsax.heart5 : Iconsax.heart,
                                    color: Colors.red,
                                    size: 30.0,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5.0),
                              CustomText(
                                text: propertyData[index]["title"],
                                color: Colors.teal,
                                maxline: 2,
                                fontsize: 14.0,
                              ),
                              CustomText(
                                text: "Gulsan 45, Dhaka",
                                color: Colors.black,
                                fontsize: 14.0,
                              ),
                              CustomText(
                                text: "Aug. 7, 2024",
                                color: Colors.black38,
                                fontsize: 1.0,
                              ),
                              SizedBox(height: 5.0),
                              const CustomText(
                                text: "Tk- 545454",
                                color: Colors.blue,
                                fontsize: 16.0,
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
        ],
      ),
    );
  }
}
