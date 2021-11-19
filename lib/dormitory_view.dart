import 'package:flutter/material.dart';
import 'functions.dart';
import 'add_room.dart';

class DormView extends StatefulWidget {
  const DormView({Key? key}) : super(key: key);

  @override
  _DormViewState createState() => _DormViewState();
}

class _DormViewState extends State<DormView> {
  Functions functions = Functions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dormitory View"),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () async {
              List<Map<String, dynamic>> val = await functions.roominfo("bh1");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRoom(val: val, title: "bh1"),
                ),
              );
            },
            child: hostelCard("BH1"),
          ),
          GestureDetector(
            onTap: () async {
              List<Map<String, dynamic>> val = await functions.roominfo("bh2");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRoom(val: val, title: "bh2"),
                ),
              );
            },
            child: hostelCard("BH2"),
          ),
          GestureDetector(
            onTap: () async {
              List<Map<String, dynamic>> val = await functions.roominfo("bh3");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRoom(val: val, title: "bh3"),
                ),
              );
            },
            child: hostelCard("BH3"),
          ),
          GestureDetector(
            onTap: () async {
              List<Map<String, dynamic>> val = await functions.roominfo("bh4");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRoom(val: val, title: "bh4"),
                ),
              );
            },
            child: hostelCard("BH4"),
          ),
          GestureDetector(
            onTap: () async {
              List<Map<String, dynamic>> val = await functions.roominfo("bh5");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRoom(val: val, title: "bh5"),
                ),
              );
            },
            child: hostelCard("BH5"),
          ),
        ],
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
