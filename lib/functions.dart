import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Functions{

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String email="";
  String password="";
  bool admin = false;

  Functions(String email, String password){
    this.email = email;
    this.password = password;
  }

  Future signin() async{

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }



  }

  bool userpower(){

    bool admin = false;

    if(auth.currentUser!=null){

      CollectionReference users = firestore.collection('Users');
      users.get().then((QuerySnapshot querySnapshot) {

        querySnapshot.docs.forEach((element) {
          if(element["email"] == email){
            admin = true;
          }
        });

      });

    }

    return admin;

  }



}