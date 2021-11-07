import 'package:flutter/material.dart';
import 'package:dormitory_management/dormitory_details.dart';

class Hosteldetails extends StatefulWidget {

  Hosteldetails({required this.title});

  final String title;

  @override
  _HosteldetailsState createState() => _HosteldetailsState();
}

class _HosteldetailsState extends State<Hosteldetails> {

  Map<String,String>m={
    "Boys Hostel 1" : "bh1",
    "Boys Hostel 2" : "bh2",
    "Boys Hostel 3" : "bh3",
    "Boys Hostel 4" : "bh4",
    "Boys Hostel 5" : "bh5",
    "Girls Hostel 1" : "gh1",
    "Girls Hostel 2" : "gh2",
  };

  Details details = Details();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: ListView.builder(itemBuilder: (context,index){
        return ListTile(
          title: Row(
            children: [
              Text(details.bh1[index]!)
            ],
          ),
        );
      })  ,
    );
  }
}
