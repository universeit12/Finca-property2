

import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/home/home.dart';
import '../modules/splash/splash.dart';
import '../modules/splash/splash_bindings.dart';

const String splash = '/splash-screen';
const String home = '/home-page';

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => const Splash(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: home,
    page: () => const Home(),
  ),
];
