import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_details.dart';
import 'package:universe_it_project/widgets/custom_textfield3.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_text.dart';
import '../contoller/favorte_controller.dart';
import '../contoller/search_controller.dart';

class AllPropertyScreen extends StatelessWidget {
  AllPropertyScreen({super.key});
  final controller = Get.put(AllSearchController());
  final favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text('All Properties'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: [
              // Search Location
              Row(
                children: [
                  Expanded(
                    child: CustomTextfield3(
                      onchanged: (value) {
                        controller.runFilter(value);
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Optionally, add an advanced search or filter icon here
                    },
                    icon: const Icon(Icons.search, color: AppColor.baseColor),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              // All properties list
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.foundItem.length,
                    itemBuilder: (context, index) {
                      final item = controller.foundItem[index];
                      final isFavorite = favoriteController.favoriteItems
                          .any((fav) => fav['Id'] == item['Id']);

                      // Navigate to Details screen
                      return InkWell(
                        onTap: () {
                          Get.to(() => AllPropertyDetails(
                                data: item,
                              ));
                        },
                        child: Container(
                          key: ValueKey(item["Id"]),
                          height: 140,
                          margin: const EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 1.0,
                                blurRadius: 10.0,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Property image
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10.0)),
                                    child: Image.asset(
                                      item["img"],
                                      width: w / 3,
                                      fit: BoxFit.cover,
                                      height: double.infinity,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Obx(() {
                                      bool isFavorite = favoriteController
                                          .isFavorite(item['id']);
                                      return GestureDetector(
                                        onTap: () {
                                          favoriteController
                                              .toggleFavorite(item);
                                        },
                                        child: Icon(
                                          isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                          size: 30.0,
                                        ),
                                      );
                                    }),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Text(
                                        "Duplex Housing",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Property Info
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text:
                                            "16000 sqrt let at Gulsan -116000 sqrt let at Gulsan-1",
                                        color: Colors.teal,
                                        maxline: 2,
                                        fontsize: 16.0,
                                        fontweight: FontWeight.bold,
                                      ),
                                      CustomText(
                                        text: "Gulsan 45, Dhaka",
                                        color: Colors.black87,
                                        fontsize: 14.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: CustomText(
                                              text: "Aug. 7, 2024",
                                              color: Colors.black38,
                                              fontsize: 14.0,
                                            ),
                                          ),
                                          Flexible(
                                            child: CustomText(
                                              text: "Tk- 545454",
                                              color: AppColor.baseColor,
                                              fontsize: 16.0,
                                              fontweight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
