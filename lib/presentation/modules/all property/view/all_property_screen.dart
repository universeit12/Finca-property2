import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_slider.dart';

class AllPropertyScreen extends StatelessWidget {
  const AllPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Property"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AllPropertySlider(),

          ],
        ),
      ),
    );
  }
}
