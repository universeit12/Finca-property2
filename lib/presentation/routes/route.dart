import 'package:get/get.dart';
import 'package:universe_it_project/pages/home.dart';
import 'package:universe_it_project/pages/splash.dart';

const String splash = '/splash-screen';
const String unknown = '/not-found';
const String home = '/home-page';

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => Splash(),
  ),
  GetPage(
    name: home,
    page: () => Home(),
  ),
];
