import 'dart:ffi';

import 'package:flutter/material.dart';
import 'functions.dart';


class StudentRecord extends StatefulWidget {

  Map<String,List<String>>studentRecords;

  StudentRecord({required this.studentRecords});

  @override
  _StudentRecordState createState() => _StudentRecordState();
}

class _StudentRecordState extends State<StudentRecord> {

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
          itemBuilder: (context,index){
            return ListTile(
              title: Text(widget.studentRecords[keys[index]]![0]),
              subtitle: Text(keys[index]),
            );
          }

      ),
    );
  }
}
