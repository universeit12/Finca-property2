import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_color.dart';

class Backappbar extends StatelessWidget implements PreferredSizeWidget {
  const Backappbar({super.key, this.title, this.actions});
  final title;
  final actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.black_,
          )),
      backgroundColor: AppColor.white2,
      titleSpacing: 0,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16.0, color: AppColor.black_),
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
