import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_textfield3.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_text.dart';
import '../../all property/view/all_property_details.dart';
import '../controller/populer_city_search_controller.dart';

class PopulerCityScreen extends StatelessWidget {
  PopulerCityScreen({super.key});
  final searchcontroller = Get.put(PopulerCitySearchController());
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                    Flexible(child: CustomTextfield3(
                      onchanged: (value) {
                        searchcontroller.runFilter(value);
                      },
                    )),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchcontroller.foundItem.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => AllPropertyDetails(
                                data: searchcontroller.foundItem[index],
                              ));
                        },
                        child: Container(
                          key:
                              ValueKey(searchcontroller.foundItem[index]["Id"]),
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.only(left: 10.0, top: 10.0),
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
                                searchcontroller.foundItem[index]["img"],
                                width: w / 3.5,
                                fit: BoxFit.cover,
                                height: 120,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomText(
                                        text: searchcontroller.foundItem[index]
                                            ["title"],
                                        color: Colors.black,
                                        maxline: 2,
                                        fontsize: 14.0,
                                      ),
                                      CustomText(
                                        text: searchcontroller.foundItem[index]
                                            ["property_name"],
                                        color: Colors.black38,
                                        fontsize: 12.0,
                                      ),
                                      CustomText(
                                        text: searchcontroller.foundItem[index]
                                            ["location"],
                                        color: Colors.black38,
                                        fontsize: 12.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: searchcontroller
                                                .foundItem[index]["for"],
                                            color: Colors.blue,
                                            fontsize: 14.0,
                                          ),
                                          const CustomText(
                                            text: "more..",
                                            color: Colors.blue,
                                            fontsize: 14.0,
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
