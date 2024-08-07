import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/favourite/view/faviorite_screen.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import 'package:universe_it_project/widgets/home_property_card.dart';

import '../../../../widgets/custom_text.dart';

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
                      onTap: (){
                        Get.to(FavioriteScreen());
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 2; i++)
                      const HomePropertyCard(
                        icon: Icons.favorite,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.teal.withOpacity(0.4),
                          child: IconButton(
                              onPressed: () {
                                Get.to(FavioriteScreen());
                              },
                              icon: const Icon(Icons.arrow_forward_outlined))),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
