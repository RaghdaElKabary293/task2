import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_8/widgets/mytext.dart';

class AppAuth {
  static Future<bool> registerUser(
      {required String email,
      required String pass,
      required String name,
      required String phone,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: pass,
      )
          .then((value) {
        if (value.user != null) {
          SaveNewUserToDB(
              mail: email,
              pass: pass,
              uid: value.user!.uid,
              name: name,
              phone: phone);
          return true;
        } else {
          return false;
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: myText(
        data: 'User Registered Successfully',
        color: Colors.green,
      )));
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: myText(
          data: 'The password provided is too weak.',
          color: Colors.red,
        )));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: myText(
          data: 'The account already exists for that email.',
          color: Colors.red,
        )));
      }
      return false;
    }
  }

  //!==============================================================

  static Future<bool> signIn(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: myText(
        data: 'User Logged In Successfully',
        color: Colors.green,
      )));
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: myText(
          data: 'No user found for that email.',
          color: Colors.red,
        )));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: myText(
          data: 'Wrong password provided for that user.',
          color: Colors.red,
        )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: myText(
          data: 'Check Your Credentials and Try Again!!',
          color: Colors.red,
        )));
      }
      return false;
    }
  }

  //!==========================================================================

  static Future<void> SaveNewUserToDB(
      {required String mail,
      required String pass,
      required String uid,
      required String name,
      required String phone}) async {
    await FirebaseFirestore.instance.collection("Users").doc(uid).set({
      'Name': name,
      'Email': mail,
      'Password': pass,
      'UID': uid,
      'PhoneNumber': phone
    });
  }
}
