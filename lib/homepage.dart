import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

  const Homepage({this.admin});

  final bool admin;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"),),
      body: Column(
        children: [
          Text("Homepage"),
        ],
      ),

    );
  }
}
