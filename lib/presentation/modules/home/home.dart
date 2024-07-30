import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar Example'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Item #$index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
