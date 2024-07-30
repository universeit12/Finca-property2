import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universe_it_project/presentation/modules/header/view/header_view.dart';
import 'package:universe_it_project/utils/app_string.dart';
import 'package:universe_it_project/widgets/custom_searchBar.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              Container(color: Colors.white, child: const HeaderView()),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(40.0))),
                    child: const Column(
                      children: [



                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
