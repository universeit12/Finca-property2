import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Popupmenu extends StatelessWidget {
  Popupmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onSelected: (String value) {},
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                value: 'Option 1',
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LOG OUT"),
                  ],
                )),
          ];
        },
      ),
    );
  }
}
