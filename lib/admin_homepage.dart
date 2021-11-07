import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({required this.admin});

  final bool admin;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<String> hostels = const [
    "Boys Hostel 1",
    "Boys Hostel 2",
    "Boys Hostel 3",
    "Boys Hostel 4",
    "Boys Hostel 5",
    "Girls Hostel 1",
    "Girls Hostel 2"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Admin name"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: const Text("Dormitory View"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Student Record"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Payment"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Health/Electricity"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Report Retrieval"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ListView.builder(
          itemCount: hostels.length,
          itemBuilder: (context,index){

            return ListTile(
              title: Text(hostels[index]),
            );

          },
      ),
    );
  }
}
