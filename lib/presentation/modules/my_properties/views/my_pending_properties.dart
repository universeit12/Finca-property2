
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_text.dart';

class MyPendingProperties extends StatelessWidget {
  const MyPendingProperties({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 1; i++)
              InkWell(
                onTap: () {},
                child: Container(
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.only(
                      left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1.0,
                        blurRadius: 8.0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/flat3.jpg",
                        width: w / 3.5,
                        fit: BoxFit.cover,
                        height: 120,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: "1770 sqrt Rampura flat",
                                color: Colors.black,
                                maxline: 2,
                                fontsize: 16.0,
                              ),
                              CustomText(
                                text: "Modhu flat",
                                color: Colors.black38,
                                fontsize: 12.0,
                              ),
                              CustomText(
                                text: "Aftabnagar, Badda, Dhaka",
                                color: Colors.black38,
                                fontsize: 12.0,
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              CustomDialog(
                                                title: 'Do you now delete post',
                                                onConfirm: () {
                                                  Navigator.pop(context);
                                                  Fluttertoast.showToast(
                                                      msg:
                                                      "Successfully Delete.");
                                                },
                                              ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
