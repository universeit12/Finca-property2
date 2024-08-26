import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/accepted_property.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/pending_properties.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/rejected_properties.dart';

class PropertyListScreen extends StatelessWidget {
  PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "My Properties",
              style: TextStyle(fontSize: 16.0),
            ),
            titleSpacing: 0,
            bottom: TabBar(
              labelStyle:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: 'Accepted'),
                Tab(text: 'Pending'),
                Tab(text: 'Rejected'),
              ],
            ),
          ),
          body: TabBarView(children: [
            AcceptedProperty(),
            PendingProperties(),
            RejectedProperties()
          ])),
    );
  }
}
