// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:dormitory_management/homepage.dart';

class UserHomePage extends StatefulWidget {
  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  int _index = 0;

  List<Widget> pages = [
    FirstScreen(),
    Homepage(admin: false),
    Profile(),
  ];
  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _index);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _index,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mail),
                  title: Text("IDK"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                ),
              ],
            ),
            body: PageView(
              children: pages,
              onPageChanged: onPageChanged,
              controller: _pageController,
            )),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _index = page;
    });
    void onTabTapped(int index) {
      this._pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(child: Text("Profile")),
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(child: hostelCard("BH1")),
                    Center(child: hostelCard("BH2")),
                    Center(child: hostelCard("BH3")),
                    Center(child: hostelCard("BH4")),
                    Center(child: hostelCard("BH5")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget hostelCard(String title) {
  return Container(
    height: 100,
    width: 300,
    margin: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey,
    ),
    child: Center(child: Text(title)),
  );
}
