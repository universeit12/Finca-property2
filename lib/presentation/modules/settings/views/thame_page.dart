import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/theme_controller.dart';

class ThemePage extends StatelessWidget {
  ThemePage({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeController.toggleTheme();
          },
          child: Obx(() => Icon(themeController.isDarkMode.value
              ? Icons.dark_mode
              : Icons.light_mode)),
        ),
      ),
    );
  }
}
