import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universe_it_project/presentation/modules/add%20property/view/add_property_card.dart';
import 'package:universe_it_project/presentation/modules/header/view/header_view.dart';
import 'package:universe_it_project/utils/app_string.dart';
import 'package:universe_it_project/widgets/custom_searchBar.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              //header section
              Container(color: Colors.white, child: const HeaderView()),

              //body section all property is here....

              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(40.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: const Column(
                        children: [

                          AddPropertyCard(),



                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
