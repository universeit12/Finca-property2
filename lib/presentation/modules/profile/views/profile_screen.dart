// views/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../Auth/signin/controller/signin _controller.dart';
import '../../my_properties/views/property_list_screen.dart';
import '../controller/profile_controller.dart';
import '../views/edit_company_profile.dart';
import '../views/edit_user_profile.dart';
import '../widgets/profile_listtile.dart';
import 'dashboard_screen.dart';


class Profile_Screen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              profileController.fetchProfile();
              profileController.fetchCompanyProfile();
            },
            icon: Icon(Icons.refresh),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              if (profileController.isReady.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    // Profile Image
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.blueAccent, width: 3),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: profileController.image.isNotEmpty
                              ? NetworkImage(profileController.image.value)
                              : const AssetImage("assets/images/p.png")
                          as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Full Name
                    Text(
                      profileController.fullName.isNotEmpty
                          ? profileController.fullName.value.toString()
                          : "",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    // Email
                    Text(
                      profileController.email.isNotEmpty
                          ? profileController.email.value.toString()
                          : "",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    // Profile Options
                    ProfileListtile(
                      icon: Icons.person,
                      title: "Edit Profile",
                      arrowicon: Iconsax.edit,
                      ontap: () {
                        profileController.profileModel.value.isCustomer == true
                            ? Get.to(() => EditUserProfile(
                          profileModel:
                          profileController.profileModel.value,
                        ))
                            : Get.to(() => EditCompanyProfile(
                          profileModel:
                          profileController.companyProfileModel
                              .value,
                        ));
                      },
                    ),
                    ProfileListtile(
                      icon: Icons.dashboard,
                      title: "Dashboard",
                      arrowicon: Iconsax.arrow_right,
                      ontap: () => Get.to(() => DeshboardScreen()),
                    ),
                    ProfileListtile(
                      icon: Iconsax.home4,
                      title: "Property List",
                      arrowicon: Iconsax.arrow_right,
                      ontap: () => Get.to(() => PropertyListScreen()),
                    ),
                    const SizedBox(height: 30.0),
                    // Logout Button
                    SizedBox(
                      height: 50.0,
                      width: screenSize.width / 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          signInController.logOut();
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
