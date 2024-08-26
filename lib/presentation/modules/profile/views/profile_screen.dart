import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:universe_it_project/presentation/modules/Auth/signin/view/signinpage.dart';
import 'package:universe_it_project/presentation/modules/profile/controller/image_controller.dart';
import 'package:universe_it_project/presentation/modules/profile/views/dashboard_screen.dart';
import 'package:universe_it_project/presentation/modules/profile/views/profile_property_list.dart';
import 'package:universe_it_project/presentation/modules/profile/widgets/profile_listtile.dart';

import '../../my_properties/views/property_list_screen.dart';

class Profile_Screen extends StatelessWidget {
  Profile_Screen({super.key});
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                            Icons.add_a_photo,
                            color: Colors.red,
                          )),
                    );
            }),
            const SizedBox(height: 20.0),
            const Text(
              "Mr. Abdul Hakim",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ProfileListtile(
              icon: Icons.person,
              title: "Edit Profile",
              arrowicon: Iconsax.edit,
            ),
            ProfileListtile(
              icon: Icons.dashboard,
              title: "Dashboard",
              arrowicon: Iconsax.arrow_right,
              ontap: () {
                Get.to(() => DeshboardScreen());
              },
            ),
            ProfileListtile(
              icon: Iconsax.home4,
              title: "Property List",
              arrowicon: Iconsax.arrow_right,
              ontap: () {
                Get.to(() => PropertyListScreen());
              },
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 45.0,
              width: screenSize.width / 2,
              child: OutlinedButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Successfully logout');
                    Get.offAll(() => Signinpage());
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
