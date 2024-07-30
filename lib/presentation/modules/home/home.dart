import 'package:flutter/material.dart';
import 'package:universe_it_project/utils/app_string.dart';
import 'package:universe_it_project/widgets/custom_drawer.dart';


class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            backgroundColor: Colors.teal,
            title: Text(AppString.name),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'এখানে লেখুন',
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0), // প্যাডিং কাস্টমাইজ করুন
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.star),
                  title: Text('Item #$index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
