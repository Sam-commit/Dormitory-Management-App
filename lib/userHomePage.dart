// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:dormitory_management/dorm_details.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:dormitory_management/admin_homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'functions.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class UserHomePage extends StatefulWidget {
  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  Functions functions = Functions();
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
    Firebase.initializeApp();
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: "IDK",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
        body: PageView(
          children: pages,
          onPageChanged: onPageChanged,
          controller: _pageController,
        ));
  }

  void onPageChanged(int page) {
    setState(() {
      _index = page;
    });
  }
}

class Profile extends StatelessWidget {
  @override
  List<String> lead = [
    "Name",
    "Roll Number",
    "Room Number",
    "Document",
    "Move In",
    "Move Out",
    "Email"
  ];
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    String email = "";
    if (auth.currentUser != null) {
      email = auth.currentUser!.email.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: val.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(lead[index] + ": "),
                title: Text(val[index]),
              );
            }),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {

  Functions func = Functions();
  List<Map<String,dynamic>>roominfo=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout))
        ],
        title: Text("HomePage"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () async{

                      roominfo = await func.roominfo("bh1");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DormDetails(name: "BH1", roominfo: roominfo,),
                        ),
                      );
                    },
                    child: Center(
                      child: hostelCard("BH1"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         DormDetails(name: "BH2", ind: 1),
                      //   ),
                      // );
                    },
                    child: Center(
                      child: hostelCard("BH2"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         DormDetails(name: "BH3", ind: 2),
                      //   ),
                      // );
                    },
                    child: Center(
                      child: hostelCard("BH3"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         DormDetails(name: "BH4", ind: 3),
                      //   ),
                      // );
                    },
                    child: Center(
                      child: hostelCard("BH4"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         DormDetails(name: "BH5", ind: 4),
                      //   ),
                      // );
                    },
                    child: Center(
                      child: hostelCard("BH5"),
                    ),
                  ),
                ],
              ),
            )
          ],
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
