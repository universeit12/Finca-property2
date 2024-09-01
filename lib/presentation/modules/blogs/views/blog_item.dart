import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/blogs/views/blogs_details.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/blogUtils.dart';
import '../../../../widgets/custom_card.dart';
import '../model/blog_model.dart';
import 'package:http/http.dart' as http;

class BlogItem extends StatefulWidget {
  const BlogItem({super.key});

  @override
  State<BlogItem> createState() => _BlogItemState();
}

class _BlogItemState extends State<BlogItem> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Blogs"),
        centerTitle: true,
        backgroundColor: AppColor.baseColor,
        elevation: 0,
      ),
      body: FutureBuilder(future: getAllBlog(),
        builder: (context, snapshot) {

          if(snapshot.hasData){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Get.to(()=> BlogsDetails(blog: list[index],));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                    child: Container(
                      height: 130.0,
                      width: 220,
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
                  ),
                );
              },

            );
          }
          else{
            return CircularProgressIndicator();
          }
        },)
    );
  }
}
