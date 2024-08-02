import 'package:flutter/material.dart';

import 'custom_text.dart';

class HomePropertyCard extends StatelessWidget {
  const HomePropertyCard({super.key, this.icon, this.text});
  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 30.0),
      width: w / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120.0,
            width: w / 2,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/flat.jpg",
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomText(
                text: text ?? "The Favourite",
                maxline: 2,
              )),
              Icon(
                icon,
                color: Colors.redAccent,
              ),
            ],
          ),
          const CustomText(
            text: "Thakurgaon, Bangladesh",
            color: Colors.black38,
            fontsize: 14.0,
          ),
          const SizedBox(
            height: 15.0,
          ),
          const CustomText(
            text: "Appartment",
            color: Colors.blue,
            fontsize: 14.0,
          ),
          const Row(
            children: [
              Icon(
                Icons.house_siding_sharp,
                size: 15.0,
              ),
              CustomText(
                text: " 1460 sqrt-1600 sqrt",
                fontsize: 13.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
