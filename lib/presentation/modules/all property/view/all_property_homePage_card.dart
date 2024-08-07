import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_screen.dart';
import 'package:universe_it_project/widgets/custom_card.dart';

import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_property_card.dart';

class AllPropertyHomepageCard extends StatelessWidget {
  const AllPropertyHomepageCard({super.key});

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
                      text: "All Property",
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const AllPropertyScreen());
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
                        text: "Aftabnagar, Block-F, Sector-2, roa4, H-31",
                      ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.teal.withOpacity(0.4),
                          child: IconButton(
                              onPressed: () {
                                Get.to(const AllPropertyScreen());
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
