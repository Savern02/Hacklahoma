import 'package:flutter/material.dart';
import 'package:my_app/screens/homepage.dart';
import 'package:my_app/screens/theme/apptheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeDashboard',
      theme: appTheme,
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}

