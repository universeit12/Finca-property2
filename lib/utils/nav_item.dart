import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/settings/views/thame_page.dart';

final List<Map<String, dynamic>> navItem = [
  {'icon': Icons.add_home_work, 'title': 'Add Property', 'screen': ThemePage()},
  {'icon': Icons.favorite_border, 'title': 'Favorite', 'screen': ThemePage()},
  {'icon': Icons.library_books, 'title': 'Blogs', 'screen': ThemePage()},
  {
    'icon': Icons.add_home_work_outlined,
    'title': 'Contact Us',
    'screen': ThemePage()
  },
  {
    'icon': Icons.person_outline_rounded,
    'title': 'Contact Us',
    'screen': ThemePage()
  },
  {'icon': Icons.message, 'title': 'About Us', 'screen': ThemePage()},
  {'icon': Icons.settings, 'title': 'Settings', 'screen': ThemePage()},
];
