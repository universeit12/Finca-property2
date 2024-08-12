import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/favourite/view/faviorite_screen.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import '../../../../widgets/custom_text.dart';
import '../../all property/utils/property_data.dart';


class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: CustomCard(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Favourite",
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(FavoriteScreen());
                      },
                      child: const CustomText(
                        text: "See all..",
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: propertyData.length > 2 ? 2 : propertyData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
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
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5.0),
                                CustomText(
                                  text: propertyData[index]["title"],
                                  color: Colors.black,
                                  maxline: 2,
                                  fontsize: 14.0,
                                ),
                                CustomText(
                                  text: propertyData[index]["property_name"],
                                  color: Colors.black38,
                                  fontsize: 12.0,
                                ),
                                CustomText(
                                  text: propertyData[index]["location"],
                                  color: Colors.black38,
                                  fontsize: 12.0,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: propertyData[index]["for"],
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
