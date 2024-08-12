import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/Auth/signin/view/signinpage.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/my_properties_screen.dart';
import 'package:universe_it_project/presentation/modules/profile/controller/image_controller.dart';
import 'package:universe_it_project/presentation/modules/profile/widgets/profile_listtile.dart';
import 'package:universe_it_project/presentation/modules/settings/views/thame_page.dart';

class Profile_Screen extends StatelessWidget {
  Profile_Screen({super.key});
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20.0),

                //Profile image--->
                Obx(() {
                  return imageController.imagePath.value.isNotEmpty
                      ? Container(
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Image.file(
                            File(imageController.imagePath.value),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          height: 90,
                          width: 90,
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/p.png"),
                                  fit: BoxFit.cover)),
                          child: IconButton(
                              onPressed: () {
                                imageController.pickImage();
                              },
                              icon: Icon(
                                Icons.add_a_photo_rounded,
                                color: Colors.black,
                              )),
                        );
                }),
                const SizedBox(height: 20.0),

                //User name--->
                const Text(
                  "Mr. Abdul Hakim",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 20.0),

                //User name
                ProfileListtile(
                  icon: Icons.person,
                  title: "Mr.Abdul Hakim,",
                ),

                //User Email
                ProfileListtile(
                  icon: Icons.email,
                  title: "abdulhakim@gmail.com",
                ),

                //User phone Number
                ProfileListtile(
                  icon: Icons.phone,
                  title: "01760******",
                ),

                //User Properties
                ProfileListtile(
                  icon: Icons.house,
                  title: "My properties",
                  arrowicon: Icons.arrow_forward_ios_outlined,
                  ontap: () {
                    Get.to(() => MyPropertiesScreen());
                  },
                ),

                //Settings
                ProfileListtile(
                  icon: Icons.settings,
                  title: "Settings",
                  arrowicon: Icons.arrow_forward_ios_outlined,
                  ontap: () {
                    Get.to(() => ThemePage());
                  },
                ),

                //Logout
                ProfileListtile(
                  icon: Icons.logout,
                  title: "Log Out",
                  arrowicon: Icons.arrow_forward_ios_outlined,
                  ontap: () {
                    Get.to(() => Signinpage());
                  },
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
