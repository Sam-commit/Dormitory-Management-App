import 'package:flutter/material.dart';

class StudentInfo extends StatefulWidget {

  List<String>studentinfo=[];

  StudentInfo({required this.studentinfo});

  @override
  _StudentInfoState createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {

  String hostel='NA';

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Allot Room'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[

              DropdownButton<String>(
                value: hostel,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    hostel = newValue!;
                  });
                },
                items: <String>['NA','bh1', 'bh2', 'bh3', 'bh4','bh5']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),


              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showMyDialog();
        },
        child: const Icon(
          Icons.edit
        ),
      ),
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
            Text("Room Alloted : " + (widget.studentinfo[2]=="" ? "No room Alloted" : widget.studentinfo[2]),
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
