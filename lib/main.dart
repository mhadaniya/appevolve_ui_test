import 'package:appevolve_ui_test/presentation/ui/ui.dart';
import 'package:appevolve_ui_test/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: ListOrdersPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
