import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/image_upload/image_upload_screen.dart';
import 'package:universe_it_project/presentation/modules/add%20property/views/add_home_card.dart';

import 'package:universe_it_project/presentation/modules/blogs/views/blog_card.dart';
import 'package:universe_it_project/presentation/modules/client%20review/views/review_card.dart';
import 'package:universe_it_project/presentation/modules/favourite/view/favourite_card.dart';
import 'package:universe_it_project/presentation/modules/header/views/header_view.dart';
import 'package:universe_it_project/presentation/modules/populer%20citys/views/populer_city_card.dart';
import 'package:universe_it_project/widgets/custom_drawer.dart';

import '../all property/view/commercial_property/commercial_property_card.dart';
import '../all property/view/land_plot_property/land_or_property_card.dart';
import '../all property/view/residential_property/residential_property_card.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              color: Colors.white,
              child: HeaderView(
                onpressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            // Body Section
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 8.0,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ImageUpload(),));
                        }, child: Text("Image Upload Screen")),
                        const AddHomeCard(),
                        ResidentialPropertyCard(),
                        CommercialPropertyCard(),
                        LandOrPlotPropertyCard(),
                       // const FavouriteCard(),
                        const BlogCard(),
                        const PopulerCity(),
                        const ReviewCard(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
