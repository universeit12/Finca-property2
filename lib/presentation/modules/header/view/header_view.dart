import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../utils/app_string.dart';
import '../../../../widgets/custom_searchBar.dart';

class HeaderView extends StatelessWidget {
  final onpressed;
  const HeaderView({super.key, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 10.0, right: 15.0, bottom: 25.0, top: 10.0),
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
                  onPressed: onpressed,
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30.0,
                  )),
              const CustomText(
                text: AppString.name,
                fontsize: 19.0,
                color: Colors.white,
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
