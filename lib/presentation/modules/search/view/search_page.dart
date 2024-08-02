import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({
    super.key,
  });
  final controller = Get.put(SearchControlle());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
