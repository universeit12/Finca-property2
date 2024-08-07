import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/client%20review/views/video_screen.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

import '../controller/video_utils.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Review",
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videoData.length,
                  itemBuilder: (_, index) {
                    final video = videoData[index];
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoReviewPage(
                                  videoId: video['videoId']!,
                                  reviewText: video['review']!,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 130.0,
                            width: 200,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.play_circle_outline_sharp,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  CustomText(
                                    text: video['review']!,
                                    maxline: 2,
                                    color: Colors.white,
                                    fontsize: 14.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}
