import 'package:flutter/material.dart';
import 'functions.dart';

class AdminPaymentPage extends StatefulWidget {
  List<List<dynamic>> values;
  AdminPaymentPage({required this.values});
  @override
  _AdminPaymentPageState createState() => _AdminPaymentPageState();
}

class _AdminPaymentPageState extends State<AdminPaymentPage> {
  Functions functions = Functions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Page"),
      ),
      body: ListView.builder(
        itemCount: widget.values.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(widget.values[index][0]),
                    Text(widget.values[index][1]),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Hostel Fee"),
                        Icon(
                            widget.values[index][2] ? Icons.check : Icons.close)
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text("Other Fee"),
                        Icon(
                            widget.values[index][3] ? Icons.check : Icons.close)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
