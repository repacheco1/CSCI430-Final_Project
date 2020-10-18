import 'package:flutter/material.dart';
import 'package:booking_app/widgets/bottomBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Foodfficient',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BottomBar(),
    );
  }
  
}