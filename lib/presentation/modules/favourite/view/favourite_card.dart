import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../widgets/custom_text.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
          ),
          padding: const EdgeInsets.only(left: 15.0, bottom: 20.0, top: 15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 1.0, blurRadius: 8.0)
              ]),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Favourite",
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
                      Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        width: w / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 120.0,
                              width: w / 2,
                              alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        "assets/images/gallary.png",
                                      ),
                                      fit: BoxFit.contain)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: "The Favourite"),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                ),
                              ],
                            ),
                            const CustomText(
                              text: "Thakurgaon, Bangladesh",
                              color: Colors.black38,
                              fontsize: 14.0,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            const CustomText(
                              text: "Appartment",
                              color: Colors.blue,
                              fontsize: 14.0,
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.house_siding_sharp,
                                  size: 15.0,
                                ),
                                CustomText(
                                  text: " 1460 sqrt-1600 sqrt",
                                  fontsize: 13.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
