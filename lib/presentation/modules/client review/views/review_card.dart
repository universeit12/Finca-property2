
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universe_it_project/presentation/modules/client%20review/views/video_controller.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import 'package:universe_it_project/widgets/custom_text.dart';


class ReviewCard extends StatelessWidget {
    ReviewCard({super.key});


   final List<Map<String, String>> videoData = [
     {
       'url':
       'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
       'title': 'Video 1'
     },
     {
       'url':
       'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
       'title': 'Video 2'
     },
     // Add more videos as needed
   ];

  @override
  Widget build(BuildContext context) {
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
                      for (int i = 0; i < videoData.length; i++)
                        InkWell(
                          onTap: () {
                            Get.put(VideoController())
                                .initializeVideo(videoData[i]["url"].toString());
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
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text:
                                    videoData[i]["title"].toString(),
                                    maxline: 2,
                                    color: Colors.white,
                                    fontsize: 14.0,
                                  ),
                                  const CustomText(
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
