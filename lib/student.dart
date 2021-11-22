import 'dart:ffi';

import 'package:flutter/material.dart';
import 'studentinfo.dart';
import 'allot_dormview.dart';
import 'functions.dart';

Functions functions = Functions();

class Student extends StatefulWidget {
  Map<String, List<String>> studentRecords;

  Student({required this.studentRecords});

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  get keys => widget.studentRecords.keys.toList();
  List<bool> ischecked = [];
  List<String> todelete = [];

  bool checklist = false;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i <= widget.studentRecords.length; i++) {
      ischecked.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    todelete.clear();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student record"),
      ),
      floatingActionButton: Visibility(
        visible: checklist,
        child: FloatingActionButton(
          onPressed: () {
            for (int i = 0; i < ischecked.length; i++) {
              if (ischecked[i] == true) {
                todelete.add(keys[i]);
              }
            }

            print(todelete);
          },
          child: const Icon(Icons.delete_forever),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.studentRecords.length,
          itemBuilder: (context, index) {
            bool alloted = true;
            if (widget.studentRecords[keys[index]]![2] == "") {
              alloted = false;
            }
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentInfo(
                          studentinfo: widget.studentRecords[keys[index]]!),
                    ),
                  );
                },
                onLongPress: () {
                  checklist = checklist ? false : true;

                  for (var i = 0; i <= widget.studentRecords.length; i++) {
                    ischecked[i] = false;
                  }

                  setState(() {});
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.studentRecords[keys[index]]![0]),
                      TextButton(
                        onPressed: () {
                          if (alloted == false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Allot_DormView(
                                    admin: true,
                                    studentinfo:
                                        widget.studentRecords[keys[index]]!),
                              ),
                            );
                          } else {
                            functions.removeRoom(
                                widget.studentRecords[keys[index]]!);
                          }
                        },
                        child: alloted
                            ? Text(
                                "Remove Room",
                                style: TextStyle(color: Colors.red),
                              )
                            : Text("Allot Room"),
                      )
                    ],
                  ),
                  subtitle: Text(keys[index]),
                  trailing: checklist
                      ? Checkbox(
                          onChanged: (bool? value) {
                            setState(() {
                              ischecked[index] = value!;
                            });
                          },
                          value: ischecked[index],
                        )
                      : const SizedBox(),
                ));
          }),
    );
  }
}
