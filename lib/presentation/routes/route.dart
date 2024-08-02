import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:universe_it_project/presentation/modules/add%20property/view/add_property_card.dart';
import 'package:universe_it_project/presentation/modules/forget%20password/views/forget_pass.dart';
import 'package:universe_it_project/presentation/modules/signin/bindigns/signinBindingis.dart';
import 'package:universe_it_project/presentation/modules/signin/view/signinpage.dart';
import 'package:universe_it_project/presentation/modules/signup/views/signup_screen.dart';

import '../modules/add property/view/details_screen.dart';
import '../modules/home/home.dart';
import '../modules/splash/splash.dart';
import '../modules/splash/splash_bindings.dart';

const String splash = '/splash_screen';
const String home = '/home_screen';
const String signin = '/signin_screen';
const String signup = '/signup_screen';
const String forgetpass = '/foreget_screen';
const String addproperty = '/add_property';

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
  GetPage(
    name: signup,
    page: () => SignupScreen(),
  ),
  GetPage(
    name: forgetpass,
    page: () => ForgetPass(),
  ),
  GetPage(
    name: addproperty,
    page: () => AddDetailsScreen(),
  ),
];
