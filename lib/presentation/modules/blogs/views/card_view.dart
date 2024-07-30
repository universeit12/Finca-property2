import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/custom_card.dart';



class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: () {},
        child: CustomCard(
          width: double.infinity,
            child: Column(
          children: [




          ],
        )));
  }
}
