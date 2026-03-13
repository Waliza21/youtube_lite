import 'package:flutter/material.dart';
import 'package:youtube_lite/presentation/home/screen/home_screen.dart';

import 'presentation/core/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Lite',
      theme: ThemeData(
        colorScheme: .dark(
          primary: AppColors.youtubePrimary,
          surface: AppColors.surfaceDark,
        ),
        scaffoldBackgroundColor: AppColors.backgroundDark,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
