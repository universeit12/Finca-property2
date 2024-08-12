import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/add%20property/controller/add_controller.dart';
import 'package:universe_it_project/presentation/modules/add%20property/view/addpage2.dart';
import 'addpage1.dart';

class AddPropertyScreen extends StatefulWidget {
  AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final _pageController = PageController();
  final controller = Get.put(AddPropertyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AddPage1(
            pageController: _pageController,
          ),
          AddPage2(pageController: _pageController)
        ],
      ),
    );
  }
}
