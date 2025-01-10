import 'package:flutter/material.dart';
import '../views/menu_page.dart';
import '../views/items_list_page.dart';
import '../views/items_list_page_short.dart';
import '../views/admin_page.dart';
import '../views/students_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) => MenuPage(),
      '/itemsList': (context) => ItemsListPage(),
      '/itemsListShort': (context) => ItemsListPageShort(),
      '/admin': (context) => AdminPage(),
      '/students': (context) => StudentsPage(),
    };
  }
}
