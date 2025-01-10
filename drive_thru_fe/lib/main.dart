import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'views/menu_page.dart';
import '../views/students_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
