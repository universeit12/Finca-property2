import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/property_utils.dart';
import '../../../../widgets/custom_text.dart';
import '../../all property/view/all_property_details.dart';
import '../../all property/view/all_property_slider.dart';

class FavioriteScreen extends StatelessWidget {
  const FavioriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("FavioriteScreen"),
      ),

    );
  }
}
