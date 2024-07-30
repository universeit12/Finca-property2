import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_string.dart';
import '../../../../widgets/custom_searchBar.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25.0),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 35.0,
                  )),
              const Text(
                AppString.name,
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Text(
                  "Sell",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const CustomSearchBar()
        ],
      ),
    );
  }
}
