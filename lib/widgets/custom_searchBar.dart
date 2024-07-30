import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.ontap,
  });

  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Expanded(
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: 50.0,
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: Colors.black45, width: 0.3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.search),
              const SizedBox(
                width: 5.0,
              ),
              const Text("Search properties..."),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50.0,
                  decoration: const BoxDecoration(),
                  child: const Text("Dhaka")),
              const Icon(
                Icons.arrow_circle_right_rounded,
                color: Colors.teal,
                size: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
