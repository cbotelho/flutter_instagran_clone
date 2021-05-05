import 'package:flutter/material.dart';
import 'package:flutter_instagram_codingpapa/constants/material_white.dart';
import 'package:flutter_instagram_codingpapa/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MaterialApp 을 앱 전체에 쓰겟다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
