import 'package:flutter/material.dart';
import 'functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'userHomePage.dart';
import 'loginpage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  late String movein, moveout, name, Rollno, room, email, pass;
  Functions functions = Functions();
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    final _firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Name"),
            onChanged: (String value) {
              name = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "Roll Number"),
            onChanged: (String value) {
              Rollno = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "Move In"),
            onChanged: (String value) {
              movein = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "Move Out"),
            onChanged: (String value) {
              moveout = value;
            },
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "Email"),
            onChanged: (String value) {
              email = value;
            },
          ),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
            onChanged: (String value) {
              pass = value;
            },
          ),
          TextButton(
            onPressed: () async {
              bool val1 = await functions.register(email, pass);
              if (val1) {
                _firestore.collection("students").add({
                  "Name": name,
                  "Rollno": Rollno,
                  "Room": "",
                  "Movein": movein,
                  "Moveout": moveout,
                  "Document": "Aadhar",
                  "Email": email
                });
                val.clear();
                val.add(name);
                val.add(Rollno);
                val.add("");
                val.add("Aadhar");
                val.add(movein);
                val.add(moveout);
                val.add(email);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => UserHomePage()));
              } else {
                final snackbar = SnackBar(
                  backgroundColor: Colors.blueGrey,
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    "Incorrect User Credentials",
                    style: TextStyle(color: Colors.red),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            },
            child: Text("Register"),
          )
        ],
      ),
    );
  }
}
