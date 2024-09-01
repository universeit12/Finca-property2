import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/utils/app_config.dart';
import 'package:universe_it_project/utils/nav_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Drawer(
      width: w / 1.5,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          Container(
            color: AppColor.baseColor,
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              children: [
                Image.asset(
                  AppConfig.appLogo,
                  width: 80,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/signin_screen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: Text(
                    "Sign In/Sign Up",
                    style: TextStyle(color: AppColor.baseColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.home_outlined, color: Colors.teal),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(height: 1.0, color: Colors.black12),
          for (int i = 0; i < navItem.length; i++)
            ListTile(
              title: Text(
                navItem[i]["title"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(navItem[i]["icon"]),
              onTap: () {
                Get.to(navItem[i]["screen"]);
              },
            ),
          const Divider(height: 1.0, color: Colors.black12),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'All rights reserved by ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '© Finca Properties',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Design & Developed by ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '© Universe Soft Tech',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
