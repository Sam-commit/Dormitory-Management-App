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
        backgroundColor: Color(0xFF3FC979),
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
        child: Stack(



        ),
      ),
    );
  }
}
