import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// Authmethods class have a signUpUser function that requires email, pass and other field and store them in the cloud database.
class Authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  //signUpUser is a function that checks whether the given fields are filled or empty, if empty it throws error to user to fill the field and avoid app crashing, It is defined as a function, since the user addition is a repeated process

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        //Creates user with email and password and save them into a collection called cred
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        // Store user data in firebase storage
        _firebaseFirestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'password': password,
          'email': email,
          'bio': bio,
          'followers' : [],
          'following': [],
        });
      }
      // email.isNotEmpty
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
