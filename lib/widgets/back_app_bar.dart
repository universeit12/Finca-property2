import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_color.dart';
var a=10;
class Backappbar extends StatelessWidget implements PreferredSizeWidget {

  final  title;
  final actions;
  final bgcolor;
  final double? fontSize;
  Backappbar({this.title,this.actions,this.fontSize=16.0, this.bgcolor});


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
      backgroundColor:bgcolor?? AppColor.white2,
      titleSpacing: 0,
      title: Text(
        title,
        style: TextStyle(fontSize: fontSize, color: AppColor.black_),
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
