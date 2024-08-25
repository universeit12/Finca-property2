import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_screen.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_text.dart';
import '../../all property/contoller/favorte_controller.dart';
import '../../all property/view/all_property_details.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite',
        ),
        titleSpacing: 0,
        actions: [
          TextButton(
              onPressed: () {
                Get.to(() => AllPropertyScreen());
              },
              child: Text("Add"))
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.favoriteItems.length,
          itemBuilder: (context, index) {
            final item = controller.favoriteItems[index];
            return InkWell(
              onTap: () {
                Get.to(() =>
                    AllPropertyDetails(data: controller.favoriteItems[index]));
              },
              child: Container(
                height: 125,
                clipBehavior: Clip.antiAlias,
                margin:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1.0,
                      blurRadius: 8.0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      item["img"],
                      width: w / 3.5,
                      fit: BoxFit.cover,
                      height: 125,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: item["title"],
                              color: Colors.black,
                              maxline: 2,
                              fontsize: 14.0,
                            ),
                            CustomText(
                              text: item["property_name"],
                              color: Colors.black38,
                              fontsize: 12.0,
                            ),
                            CustomText(
                              text: item["location"],
                              color: Colors.black38,
                              fontsize: 12.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: "more..",
                                  color: Colors.blue,
                                  fontsize: 14.0,
                                ),
                                InkWell(
                                  child: const Icon(Icons.delete),
                                  onTap: () {
                                    controller.toggleFavorite(item);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
