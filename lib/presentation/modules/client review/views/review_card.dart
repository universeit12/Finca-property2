
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universe_it_project/presentation/modules/client%20review/views/video_screen.dart';

import 'package:universe_it_project/widgets/custom_card.dart';
import 'package:universe_it_project/widgets/custom_text.dart';


class ReviewCard extends StatelessWidget {
   const ReviewCard({super.key});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {
        },
        child: CustomCard(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Review",
                      ),
                      CustomText(
                        text: "See all..",
                        color: Colors.teal,
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
                      for (int i = 0; i < 10; i++)
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height: 130.0,
                            width: 220,
                            margin: const EdgeInsets.only(right: 10),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                image: const DecorationImage(
                                    image: AssetImage("assets/images/flat.jpg"),
                                    fit: BoxFit.cover)),
                            child: Container(
                              color: Colors.black26,
                              padding:
                                  const EdgeInsets.only(left: 5.0, bottom: 5.0),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text:
                                        "Tips for Selling Your Home Quickly and Efficiently",
                                    maxline: 2,
                                    color: Colors.white,
                                    fontsize: 14.0,
                                  ),
                                  CustomText(
                                    text: "May 16, 2024",
                                    color: Colors.white,
                                    fontsize: 12.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            )));
  }
}
