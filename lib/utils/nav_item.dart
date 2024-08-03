import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/add%20property/view/add_property_card.dart';
import 'package:universe_it_project/presentation/modules/add%20property/view/details_screen.dart';
import 'package:universe_it_project/presentation/modules/blogs/views/blog_item.dart';
import 'package:universe_it_project/presentation/modules/favourite/view/faviorite_screen.dart';
import 'package:universe_it_project/presentation/modules/settings/views/thame_page.dart';

import '../presentation/modules/about_us/views/about_screen.dart';

final List<Map<String, dynamic>> navItem = [
  {
    'icon': Icons.add_home_outlined,
    'title': 'All Property',
    'screen': AddDetailsScreen()
  },
  {
    'icon': Icons.add_home_work_outlined,
    'title': 'Add Property',
    'screen':  AddDetailsScreen()
  },
  {
    'icon': Icons.favorite_border,
    'title': 'Favorite',
    'screen': FavioriteScreen()
  },
  {'icon': Icons.library_books, 'title': 'Blogs', 'screen': BlogItem()},
  {
    'icon': Icons.person_outline_rounded,
    'title': 'Contact Us',
    'screen': AboutScreen()
  },
  {'icon': Icons.message, 'title': 'About Us', 'screen': ThemePage()},
  {'icon': Icons.settings, 'title': 'Settings', 'screen': ThemePage()},
];
