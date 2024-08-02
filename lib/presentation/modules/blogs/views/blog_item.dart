import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/blogUtils.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blogs"),
        titleSpacing: 0,
      ),
      body: SizedBox(
          child: ListView(
        children: [
          for (int i = 0; i < blogUtils.length; i++)
            Container(
              height: 120,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  color: AppColor.baseColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1.0,
                        blurRadius: 8.0)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/flat.jpg",
                    width: w / 3.5,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            text:
                                "Tips for Selling Your Home Quickly and Efficiently",
                            fontsize: 14.0,
                            color: Colors.white,
                            maxline: 2,
                          ),
                          CustomText(
                            text:
                                "Selling a home can be both exciting and stressful. Whether you're upgrading to a bigger space or relocating to a new city, ensuring a smooth and quick sale is crucial. Here are some tips to help you sell your home efficiently and get the best value for it.",
                            fontsize: 12.0,
                            color: Colors.white70,
                            maxline: 2,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.white60,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "23s ago",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 15),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white60,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      )),
    );
  }
}
