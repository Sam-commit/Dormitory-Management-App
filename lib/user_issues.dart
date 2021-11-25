import 'package:dormitory_management/student.dart';
import 'package:flutter/material.dart';
import 'functions.dart';

class UserIssuePage extends StatefulWidget {
  @override
  _UserIssuePageState createState() => _UserIssuePageState();
}

class _UserIssuePageState extends State<UserIssuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Issues"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          String issue = "";
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("Add Issue"),
              content: TextField(
                onChanged: (String value) {
                  issue = value;
                },
                decoration: InputDecoration(hintText: "Issue"),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await functions.addIssue(issue);
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text("Add Issue"),
                )
              ],
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Sr No."),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Issue"),
                  ],
                ),
                Text("Status")
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: func_issues.length,
                itemBuilder: (BuildContext context, index) {
                  String status = issues_resolved[index]
                      ? "Issue Resolved"
                      : "Issue Not Resolved";

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("${index + 1}"),
                          SizedBox(
                            width: 20,
                          ),
                          Text(func_issues[index]),
                        ],
                      ),
                      Text(status),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
