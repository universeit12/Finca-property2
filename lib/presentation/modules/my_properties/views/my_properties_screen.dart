import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/my_all_properties.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/my_complete_properties.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/my_pending_properties.dart';


class MyPropertiesScreen extends StatelessWidget {
  MyPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("My Properties"),
            titleSpacing: 0,
            bottom: TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Complete'),
                Tab(text: 'Pending'),
              ],
            ),
          ),
          body: TabBarView(children: [
            MyAllProperties(),
            MyCompleteProperties(),
            MyPendingProperties()
          ])),
    );
  }
}
