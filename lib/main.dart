import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'admin_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const Loginpage(),
      //theme: ThemeData.(),
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(color: Color(0xFF3FC979)),
          scaffoldBackgroundColor: Color(0xFFE5E5E5),
          canvasColor: Color(0xFFE5E5E5)),
    );
  }
}
