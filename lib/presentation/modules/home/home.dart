
import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/add%20property/view/add_property_card.dart';
import 'package:universe_it_project/presentation/modules/blogs/views/card_view.dart';
import 'package:universe_it_project/presentation/modules/favourite/view/favourite_card.dart';
import 'package:universe_it_project/presentation/modules/header/view/header_view.dart';
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
        child: SingleChildScrollView(
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
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(40.0)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        AddPropertyCard(),
                        FavouriteCard(),
                        CardView(),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
