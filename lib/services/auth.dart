import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groupon/models/user.dart';
import 'package:groupon/models/uid.dart';
import 'package:groupon/services/database.dart';



class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  UserID _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? UserID(user.uid) : null;
  }

  Stream<UserID> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }


  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      p = password;
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      current_user_uid = user.uid;
      print(user.isEmailVerified);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      current_user_uid = user.uid;
      await DatabaseService(uid: user.uid)
          .updateUserData(name, email);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }






  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }





}




