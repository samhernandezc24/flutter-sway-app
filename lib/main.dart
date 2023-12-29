import 'package:flutter/material.dart';
import 'package:flutter_sway_app/config/theme/app_theme.dart';
import 'package:flutter_sway_app/features/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SwayApp',
      theme: AppTheme.appTheme(),
      home: HomeScreen(),
    );
  }
}
