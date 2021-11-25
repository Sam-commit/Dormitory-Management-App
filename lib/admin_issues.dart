import 'package:flutter/material.dart';
import 'functions.dart';

class AdminIssuePage extends StatefulWidget {
  List<List<dynamic>> values;
  AdminIssuePage({required this.values});

  @override
  _AdminIssuePageState createState() => _AdminIssuePageState();
}

class _AdminIssuePageState extends State<AdminIssuePage> {
  Functions functions = Functions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Issues"),
      ),
      body: ListView.builder(
          itemCount: widget.values.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Text((index + 1).toString()),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(widget.values[index][0]),
                      Text(widget.values[index][1])
                    ],
                  ),
                ],
              ),
              trailing: TextButton(
                onPressed: () async {
                  await functions.markResolved(
                      widget.values[index][3], widget.values[index][0]);
                  widget.values.clear();
                  widget.values = await functions.adminIssues();
                  setState(() {});
                },
                child: Text("Mark as Resolved"),
              ),
            );
          }),
    );
  }
}
