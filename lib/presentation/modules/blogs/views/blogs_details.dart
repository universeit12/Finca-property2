import 'package:flutter/material.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_text.dart';
import '../model/blog_model.dart';

class BlogsDetails extends StatelessWidget {
  final BlogModel blog;
  BlogsDetails({super.key,required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.baseColor,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Blog Details",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              blog.blogImg.toString(),
              height: 250.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 5,
                    height: 70,
                    color: AppColor.baseColor,
                  ),
                  Expanded(
                    child: CustomText(
                      text: blog.title.toString(),
                      fontsize: 20.0,
                      fontweight: FontWeight.bold,
                      maxline: 3,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomText(
                text: "Description",
                fontsize: 18.0,
                fontweight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  blog.details.toString(),
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
