import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/add%20property/view/add_property_card.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_homePage_card.dart';
import 'package:universe_it_project/presentation/modules/blogs/views/blog_card.dart';
import 'package:universe_it_project/presentation/modules/client%20review/views/review_card.dart';
import 'package:universe_it_project/presentation/modules/favourite/view/favourite_card.dart';
import 'package:universe_it_project/presentation/modules/header/view/header_view.dart';
import 'package:universe_it_project/presentation/modules/populer%20citys/views/populer_city.dart';
import 'package:universe_it_project/widgets/custom_drawer.dart';

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
            //header section
            Container(
                color: Colors.white,
                child: HeaderView(
                  onpressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                )),

            //body section all property is here....
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(40.0)),
                    ),
                    child:  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          AddPropertyCard(),
                          AllPropertyHomepageCard(),
                          FavouriteCard(),
                          BlogCard(),
                          PopulerCity(),
                          ReviewCard(),
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
