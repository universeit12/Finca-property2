import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/Privacy/views/privacy_screen.dart';
import 'package:universe_it_project/presentation/modules/add%20property/views/add_property_screen.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_screen.dart';
import 'package:universe_it_project/presentation/modules/blogs/views/blog_item.dart';
import 'package:universe_it_project/presentation/modules/favourite/view/faviorite_screen.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/my_properties_screen.dart';
import 'package:universe_it_project/presentation/modules/profile/views/profile_screen.dart';
import 'package:universe_it_project/presentation/modules/settings/views/thame_page.dart';
import '../presentation/modules/contact/views/contact_screen.dart';

final List<Map<String, dynamic>> navItem = [
  {'icon': Icons.person, 'title': 'Profile', 'screen': Profile_Screen()},
  {
    'icon': Icons.home,
    'title': 'My Properties',
    'screen': MyPropertiesScreen()
  },
  {
    'icon': Icons.add_home_outlined,
    'title': 'All Property',
    'screen': AllPropertyScreen()
  },
  {
    'icon': Icons.add_home_work_outlined,
    'title': 'Add Property',
    'screen': AddPropertyScreen()
  },
  {
    'icon': Icons.favorite_border,
    'title': 'Favorite',
    'screen': const FavoriteScreen()
  },
  {'icon': Icons.library_books, 'title': 'Blogs', 'screen': const BlogItem()},
  {
    'icon': Icons.privacy_tip_outlined,
    'title': 'Privacy',
    'screen': const PrivacyScreen()
  },
  {
    'icon': Icons.message,
    'title': 'Contact Us',
    'screen': const ContactScreen()
  },
  {'icon': Icons.settings, 'title': 'Settings', 'screen': ThemePage()},
];
