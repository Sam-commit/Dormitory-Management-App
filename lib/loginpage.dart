import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'admin_homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dormitory_management/functions.dart';
import 'userHomePage.dart';
import 'register.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              email = value;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              password = value;
            },
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () async {
              Functions func = Functions();

              if (await func.signin(email, password)) {
                if (await func.userpower()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Homepage(admin: false)));
                } else {
                  val.clear();
                  func.profileinfo(email);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserHomePage()));
                }
              } else {
                print("error");
              }
            },
            child: const Text("Log In"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
