import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_color.dart';
import '../controller/theme_controller.dart';

class ThemePage extends StatelessWidget {
  ThemePage({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Settings"),
            titleSpacing: 0,
            backgroundColor: AppColor.baseColor),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  themeController.toggleTheme();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                            themeController.isDarkMode.value
                                ? "DARK MODE"
                                : "LIGHT MODE",
                            style: const TextStyle(color: Colors.white),
                          )),
                      Obx(() => Icon(
                            themeController.isDarkMode.value
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
