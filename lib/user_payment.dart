import 'package:flutter/material.dart';
import 'functions.dart';

class UserPaymentPage extends StatefulWidget {
  const UserPaymentPage({Key? key}) : super(key: key);

  @override
  _UserPaymentPageState createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  @override
  Widget build(BuildContext context) {
    String hostel = payment[0] ? "Paid" : "Not Paid";
    String other = payment[1] ? "Paid" : "Not Paid";
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Info"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF3FC979).withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Hostel",style: TextStyle(fontSize: 20),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Fee : " + hostel),
                      Text("Amount Due : 0.00" ),
                      Text("Due date : 22/09/2022" ),
                      SizedBox(height: 20),

                      ElevatedButton(onPressed: (){}, child:Text("Pay Hostel Fee"),
                        style: ElevatedButton.styleFrom(primary: Color(0xFF3FC979)),
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF3FC979).withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Amenities",style: TextStyle(fontSize: 20),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Fee : " + other),
                      Text("Amount Due : 0.00" ),
                      Text("Due date : 22/09/2022" ),
                      SizedBox(height: 20),

                      ElevatedButton(onPressed: (){}, child:Text("Pay Amenities Fee"),
                        style: ElevatedButton.styleFrom(primary: Color(0xFF3FC979)),
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
