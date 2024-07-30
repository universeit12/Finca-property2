import 'package:flutter/material.dart';

import '../../../../widgets/custom_text.dart';

class AddPropertyCard extends StatelessWidget {
  const AddPropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
          ),
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 1.0, blurRadius: 8.0)
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/flat.png",
                    height: 80.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Expanded(
                    child: CustomText(
                      text: "Loking to sell or out your property?",
                      fontweight: FontWeight.bold,
                      maxline: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(width: 0.5)),
                child: const Text(
                  "Add Property",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
