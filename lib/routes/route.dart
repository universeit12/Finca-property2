import 'package:get/get_navigation/src/routes/get_route.dart';

import '../presentation/modules/Auth/forget password/views/forget_pass.dart';
import '../presentation/modules/Auth/signin/view/signinpage.dart';
import '../presentation/modules/Auth/signup/views/signup_screen.dart';
import '../presentation/modules/add property/view/add_property_screen.dart';
import '../presentation/modules/home/home.dart';
import '../presentation/modules/splash/splash.dart';
import '../presentation/modules/splash/splash_bindings.dart';

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
    page: () => AddPropertyScreen(),
  ),
];
