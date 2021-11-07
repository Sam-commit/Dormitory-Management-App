import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dormitory_management/functions.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);


  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  String email="";
  String password="";


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
      appBar: AppBar(title: const Text("Login Page"),),
      body: Column(
        children: [
          TextField(

            onChanged: (value){
              email = value;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
            ),

          ),
          SizedBox(height: 20,),
          TextField(

            onChanged: (value){
              password = value;
            },
            
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          SizedBox(height: 40,),

          ElevatedButton(onPressed: () async{

            Functions func = Functions(email,password);
            await func.signin();
              
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage() ));
            
          }, child: const Text("Log In")),


        ],
      ),

    );
  }
}
