import 'package:flutter/material.dart';


class CustomPopupmenu extends StatelessWidget {
  final ontap;
  const CustomPopupmenu({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
      onSelected: (String value) {},
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
              value: 'Option 1',
              onTap: ontap,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Favorite"),
                ],
              )),
        ];
      },
    );
  }
}
