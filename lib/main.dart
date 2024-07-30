import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/pages/splash.dart';
import 'package:universe_it_project/presentation/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: splash,
      getPages: getPages,
      home: const Splash(),
    );
  }
}
