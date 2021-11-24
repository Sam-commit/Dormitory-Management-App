import 'package:flutter/material.dart';

import 'constants.dart';




class RoomDetails extends StatefulWidget {

  Map<String,dynamic>roominfo;
  int number;

  RoomDetails({required this.roominfo,required this.number});

  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {

  List<Widget>names=[];

  List check(){

    if(widget.roominfo["allocated"]!=0){

      for(int i =0;i<widget.roominfo["allocated"];i++){

        names.add(Text(widget.roominfo["students"][i],style: kstyle,));

      }

      return names;


    }
    else {

      names.add( Text("No bed alloted",style: kstyle,));
      return names;

    }


  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Room No. " + widget.number.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text("Beds : "+widget.roominfo["beds"].toString(),style: kstyle,),
            SizedBox(height: 20,),
            Text("allocated : "+widget.roominfo["allocated"].toString(),style: kstyle,),
            SizedBox(height: 20,),
            Text("Available : "+(widget.roominfo["beds"] -widget.roominfo["allocated"]).toString(),style: kstyle,),
            SizedBox(height: 20,),

            Text("beds alloted to :- ",style: kstyle,),
            SizedBox(height: 20,),

            Column(
              children: names,
            )

          ],

        ),
      )
    );
  }
}
