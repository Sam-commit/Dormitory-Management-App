import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Functions{

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // String email="";
  // String password="";
  // //bool admin = false;
  //
  //
  // Functions(String email, String password){
  //   this.email = email;
  //   this.password = password;
  // }

  Future <bool>signin(String email,String password) async{

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

  Future<bool> userpower() async {

    bool admin = false;

    if(auth.currentUser!=null){

      CollectionReference users = firestore.collection('Users');
      await users.get().then((QuerySnapshot querySnapshot) {

        for  (var element in querySnapshot.docs) {
          if(element["email"].toString() == auth.currentUser?.email.toString()){
            admin = true;

          }
        }

      });
    }

    return admin;

  }

  Future<Map<String,List<String>>> studentinfo()async{

    Map<String,List<String>>studentRecords={};

    CollectionReference students = firestore.collection('students');
    await students.get().then((QuerySnapshot querySnapshot) {

      for(var element in querySnapshot.docs){
          studentRecords[element["Rollno"].toString()]=[element["Name"].toString(),element["Rollno"].toString(),element["Room"].toString(),element["Document"].toString()];

      }

     print(studentRecords.keys);

    });

    return studentRecords;


  }



}