import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:universe_it_project/presentation/modules/signin/bindigns/signinBindingis.dart';
import 'package:universe_it_project/presentation/modules/signin/view/signinpage.dart';

import '../modules/home/home.dart';
import '../modules/splash/splash.dart';
import '../modules/splash/splash_bindings.dart';

const String splash = '/splash-screen';
const String home = '/home-screen';
const String signin = '/signin_screen';

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => const Splash(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: home,
    page: () => Home(),
  ),
  GetPage(
    name: signin,
    page: () => Signinpage(),
  ),
];
