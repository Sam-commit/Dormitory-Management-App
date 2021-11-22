import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<String> val = [];

class Functions {
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

  Future<bool> signin(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

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

    if (auth.currentUser != null) {
      CollectionReference users = firestore.collection('Users');
      await users.get().then((QuerySnapshot querySnapshot) {
        for (var element in querySnapshot.docs) {
          if (element["email"].toString() ==
              auth.currentUser?.email.toString()) {
            admin = true;
          }
        }
      });
    }

    return admin;
  }

  Future<Map<String, List<String>>> studentinfo() async {
    Map<String, List<String>> studentRecords = {};

    CollectionReference students = firestore.collection('students');
    await students.get().then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        studentRecords[element["Rollno"].toString()] = [
          element["Name"].toString(),
          element["Rollno"].toString(),
          element["Room"].toString(),
          element["Document"].toString(),
          element["Movein"].toString(),
          element["Moveout"].toString(),
          element["Email"].toString(),
        ];
      }

      print(studentRecords.keys);
    });

    return studentRecords;
  }

  Future roominfo(String room) async {
    List<Map<String, dynamic>> rooms = [];

    CollectionReference hostel = firestore.collection(room);
    await hostel.orderBy("number").get().then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        rooms.add({
          "allocated": element["allocated"],
          "beds": element["beds"],
          "number": element["number"],
          "students": element["students"],
        });
      }
    });

    return rooms;
  }

  void addroom(int room, int beds, String hostelname) {
    CollectionReference hostel = firestore.collection(hostelname);
    hostel.add({
      "allocated": 0,
      "beds": beds,
      "number": room,
      "students": [],
    });
  }

  Future<bool> register(String email, String password) async {
    bool val = false;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      val = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return val;
  }

  Future profileinfo(String email) async {
    CollectionReference students = firestore.collection('students');
    await students.get().then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        if (element["Email"] == email) {
          val.clear();
          val.add(element["Name"].toString());
          val.add(element["Rollno"].toString());
          val.add(element["Room"].toString());
          val.add(element["Document"].toString());
          val.add(element["Movein"].toString());
          val.add(element["Moveout"].toString());
          val.add(element["Email"].toString());
          break;
        }
      }
    });
  }

  Future allotRoom(
      List<String> studentinfo, String hostelname, int room) async {
    await firestore
        .collection('students')
        .where('Name', isEqualTo: studentinfo[0])
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((documentSnapshot) {
        documentSnapshot.reference.update({
          "Name": studentinfo[0],
          "Document": "Aadhar",
          "Email": studentinfo[6],
          "Movein": studentinfo[4],
          "Moveout": studentinfo[5],
          "Rollno": studentinfo[1],
          "Room": "${hostelname} ${room}",
        });
      });
    });
    await firestore
        .collection(hostelname)
        .where('number', isEqualTo: room)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((documentSnapshot) {
        print(documentSnapshot["students"]);
        documentSnapshot.reference.update({
          "allocated": documentSnapshot["allocated"] + 1,
          "beds": documentSnapshot["beds"],
          "number": room,
          "students": FieldValue.arrayUnion([studentinfo[1]])
        });
      });
    });
  }
}
