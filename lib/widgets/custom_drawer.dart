import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/utils/app_string.dart';
import 'package:universe_it_project/utils/nav_item.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Drawer(
      width: w / 1.5,
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: [
                const Text(
                  AppString.name,
                  style: TextStyle(
                      color: AppColor.baseColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/signin_screen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.baseColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Text(
                    "Sign In/Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                for (int i = 0; i < navIcons.length; i++)
                  CustomDrawerTile(
                      text: navTitles[i],
                      icon: navIcons[i],
                      onTap: () {
                        Navigator.pop(context);
                      })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
