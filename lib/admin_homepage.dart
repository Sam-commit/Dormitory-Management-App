import 'package:flutter/material.dart';
import 'package:dormitory_management/room_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dormitory_management/student.dart';
import 'package:dormitory_management/functions.dart';
import 'add_room.dart';
import 'report_retrieval.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'admin_issues.dart';
import 'admin_payment.dart';
import 'userHomePage.dart';

class Homepage extends StatefulWidget {
  Homepage({required this.admin});

  final bool admin;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Functions functions = Functions();
  List<String> hostels = const [
    "Boys Hostel 1",
    "Boys Hostel 2",
    "Boys Hostel 3",
    "Boys Hostel 4",
    "Boys Hostel 5",
    "Girls Hostel 1",
    "Girls Hostel 2"
  ];
  List<String> titl = const ["bh1", "bh2", "bh3", "bh4", "bh5", "gh1", "gh2"];

  Map<String, List<String>> studentRecords = {};

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
                onTap: () async {
                  Functions func = Functions();
                  studentRecords = await func.studentinfo();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Student(studentRecords: studentRecords)));
                }),
            ListTile(
              title: const Text("Payment"),
              onTap: () async {
                List<List<dynamic>> values = await functions.adminPaymentinfo();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminPaymentPage(
                      values: values,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Issues"),
              onTap: () async {
                List<List<dynamic>> values = await functions.adminIssues();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminIssuePage(
                      values: values,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Report Retrieval"),
              onTap: () async {
                Functions func = Functions();
                studentRecords = await func.studentinfo();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ReportRetrieval(studentRecords: studentRecords),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: hostels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(hostels[index]),
            onTap: () async {
              List<Map<String, dynamic>> val =
                  await functions.roominfo(titl[index]);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRoom(val: val, title: titl[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
