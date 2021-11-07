import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

bool admin = false;

class Functions{

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String email="";
  String password="";
  //bool admin = false;


  Functions(String email, String password){
    this.email = email;
    this.password = password;
  }

  Future <bool>signin() async{

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      return true;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

      return false;

    }


  }

  bool userpower(){



    if(auth.currentUser!=null){

      CollectionReference users = firestore.collection('Users');
      users.get().then((QuerySnapshot querySnapshot) {

        querySnapshot.docs.forEach((element) {
          if(element["email"].toString() == auth.currentUser?.email.toString()){
            admin = true;
            print(admin);
            print(element["email"]);
            print(auth.currentUser?.email.toString());

          }
        });

      });

    }
    print(admin);
    return admin;

  }



}