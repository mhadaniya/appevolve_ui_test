import 'package:appevolve_ui_test/presentation/ui/ui.dart';
import 'package:appevolve_ui_test/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orders App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: AppColors.lightGray,
        iconTheme: IconThemeData(color: AppColors.mediumGray),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PixelPerfect(
        assetPath: 'design/screen.png',
        scale: 1.04,
        child: ListOrdersPage(),
      ),
    );
  }
}
