import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/blogs/views/blog_item.dart';
import 'package:universe_it_project/presentation/modules/favourite/view/faviorite_screen.dart';
import 'package:universe_it_project/presentation/modules/home/home.dart';
import 'package:universe_it_project/presentation/modules/profile/views/profile_screen.dart';

import '../../modules/booking now/views/booking_screen2.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [Home(), BlogItem(), BookingScreen2(), Profile_Screen ()];

  // Method to change the selected index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
