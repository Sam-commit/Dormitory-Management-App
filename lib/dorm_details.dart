import 'package:dormitory_management/functions.dart';
import 'package:flutter/material.dart';
import 'random_val.dart';

class DormDetails extends StatefulWidget {
  String name;
  int ind;
  DormDetails({required this.name, required this.ind});

  @override
  _DormDetailsState createState() => _DormDetailsState();
}

class _DormDetailsState extends State<DormDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: values[widget.ind].length,
        itemBuilder: (BuildContext context, int index) {
          Color background;
          if (values[widget.ind][index] == 0) {
            background = Colors.red;
          } else if (values[widget.ind][index] == 1) {
            background = Colors.yellow;
          } else {
            background = Colors.green;
          }
          return Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text("${index + 1}"),
            ),
            color: background,
          );
        },
      ),
    );
  }
}
