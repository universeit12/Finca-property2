import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/blogs/views/blog_item.dart';
import 'package:universe_it_project/utils/blogUtils.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../model/blog_model.dart';
import 'blogs_details.dart';
import 'package:http/http.dart' as http;

class BlogCard extends StatefulWidget {
  const BlogCard({super.key});

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {

  var  list = <BlogModel>[];
  Future<List<BlogModel>> getAllBlog() async{
    final response = await http.get(Uri.parse("https://finca.psdcedu.xyz/api/blogs"));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map<String, dynamic> index in data){
        list.add(BlogModel.fromJson(index));
      }
      return list;
    }
    else{
      return list;
    }
  }
  @override
  Widget build(BuildContext context) {
    return CustomCard(
        width: double.infinity,

        padding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Blogs",
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const BlogItem());
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
              height: 170,
              child: FutureBuilder(future: getAllBlog(),
                  builder: (context, snapshot) {

                if(snapshot.hasData){
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Get.to(()=> BlogsDetails(blog: list[index]));
                        },
                        child: Container(
                          height: 130.0,
                          width: 250,
                          margin: const EdgeInsets.only(right: 10),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              image: DecorationImage(
                                  image: NetworkImage(list[index].blogImg.toString()),
                                  fit: BoxFit.cover)),
                          child: Container(
                            color: Colors.black26,
                            padding:
                            const EdgeInsets.only(left: 5.0, bottom: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: list[index].title.toString(),
                                  maxline: 2,
                                  color: Colors.white,
                                  fontsize: 14.0,
                                ),
                                CustomText(
                                  text: list[index].created.toString(),
                                  color: Colors.white,
                                  fontsize: 12.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },

                  );
                }
                else{
                  return CircularProgressIndicator();
                }
                  },),
            ),

          ],
        ));
  }
}
