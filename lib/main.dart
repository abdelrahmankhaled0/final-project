import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.routes,
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
