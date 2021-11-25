import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'functions.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Column(
          children: [
            SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF3FC979).withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Text("Name"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Roll Number"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Room Number"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Document"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Move In"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Move Out"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Email")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Text(val[0]),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(val[1]),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(val[2]),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(val[3]),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(val[4]),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(val[5]),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(val[6]),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/iiita.jpg"))),
                      ),
                      radius: 80,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
