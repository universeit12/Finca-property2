import 'package:flutter/material.dart';
import 'package:universe_it_project/utils/app_string.dart';
import 'package:universe_it_project/widgets/custom_searchBar.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(30.0))),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 35.0,
                      )),
                  const Text(
                    AppString.name,
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  )
                ],
              ),
              CustomSearchBar()
            ],
          ),
        )
      ],
    ));
  }
}
