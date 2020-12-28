

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'package:groupon/models/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference profileCollection = Firestore.instance.collection('profiles');


  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data["name"],
      emailID: snapshot.data["emailID"],
    );
  }

  Future updateUserData(String name, String emailID) async {
    return await profileCollection.document(uid).setData({
      'name': name,
      'emailID': emailID,

    });
  }


  Stream<UserData> get userData{
    return profileCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }



}