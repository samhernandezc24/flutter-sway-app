import 'package:flutter/material.dart';
import 'package:flutter_sway_app/core/constants/app_colors.dart';
import 'package:flutter_sway_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_sway_app/features/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const dummyAvatarUrl =
      'https://st2.depositphotos.com/2703645/5669/v/950/depositphotos_56695433-stock-illustration-female-avatar.jpg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SwayApp',
      //theme: AppTheme.appTheme(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.whiteColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: AppColors.headerTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
          displayMedium: TextStyle(
            color: AppColors.headerTextColor,
            fontSize: 24,
          ),
          displaySmall: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.appBarShadeColor,
          elevation: 0,
        ),

      ),
      home: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     CircleAvatar(
        //       backgroundImage: NetworkImage(dummyAvatarUrl),
        //       radius: 24,
        //     ),
        //     SizedBox(width: 24),
        //   ],
        // ),
        body: Stack(
          children: <Widget>[
            LoginScreen(),
          ],
        ),
      ),
    );
  }
}
