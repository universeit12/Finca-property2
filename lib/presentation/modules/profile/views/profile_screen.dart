import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/Auth/signin/view/signinpage.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/my_properties_screen.dart';
import 'package:universe_it_project/presentation/modules/profile/widgets/profile_listtile.dart';
import 'package:universe_it_project/presentation/modules/settings/views/thame_page.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

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
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 90,
                    width: 90,
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blueAccent),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Mr. Abdul Hakim",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                ProfileListtile(
                  icon: Icons.person,
                  title: "Mr.Abdul Hakim,",
                ),
                ProfileListtile(
                  icon: Icons.email,
                  title: "abdulhakim@gmail.com",
                ),
                ProfileListtile(
                  icon: Icons.phone,
                  title: "01760******",
                ),
                ProfileListtile(
                  icon: Icons.house,
                  title: "My properties",
                  arrowicon: Icons.arrow_forward_ios_outlined,
                  ontap: () {
                    Get.to(() => MyPropertiesScreen());
                  },
                ),
                ProfileListtile(
                  icon: Icons.settings,
                  title: "Settings",
                  arrowicon: Icons.arrow_forward_ios_outlined,
                  ontap: () {
                    Get.to(() => ThemePage());
                  },
                ),
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
