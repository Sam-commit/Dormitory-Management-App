import 'dart:ffi';

import 'package:flutter/material.dart';
import 'studentinfo.dart';

class Student extends StatefulWidget {
  Map<String, List<String>> studentRecords;

  Student({required this.studentRecords});

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  // void getinfo()async{
  //
  //   Functions func = Functions();
  //   studentRecords = await func.studentinfo();
  //
  // }

  // @override
  // void initState(){
  //   super.initState();
  //
  //   getinfo();
  //
  // }

  get keys => widget.studentRecords.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student record"),
      ),
      body: ListView.builder(
          itemCount: widget.studentRecords.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.studentRecords[keys[index]]![0]),
              subtitle: Text(keys[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentInfo(
                        studentinfo: widget.studentRecords[keys[index]]!),
                  ),
                );
              },
            );
          }),
    );
  }
}
