import 'package:flutter/material.dart';

class StudentInfo extends StatefulWidget {

  List<String>studentinfo=[];

  StudentInfo({required this.studentinfo});

  @override
  _StudentInfoState createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Info"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name : " + widget.studentinfo[0],
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20,),
            Text("Roll No. : " + widget.studentinfo[1],
              style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Text("Room Alloted : " + widget.studentinfo[2],
              style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Text("Document Submitted : " + widget.studentinfo[3],
              style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Text("Move In Date : " + widget.studentinfo[4],
              style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Text("Move Out Date : " + widget.studentinfo[5],
              style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
