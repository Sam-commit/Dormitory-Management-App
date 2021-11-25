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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Hostel Fees"), Text(hostel)],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Other Fees"), Text(other)],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Pay Hostel"),
              ),
              SizedBox(
                width: 50,
              ),
              TextButton(
                onPressed: () {},
                child: Text("Pay Other"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
