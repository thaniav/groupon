

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groupon/models/uid.dart';
import 'package:groupon/models/featured_item';


import 'package:groupon/models/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference profileCollection = Firestore.instance.collection('profiles');
  final CollectionReference recentlyViewedCollection = Firestore.instance.collection('recentlyViewed');



  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data["name"],
      emailID: snapshot.data["emailID"],
    );
  }

  List<Coupon> _recentlyViewedFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Coupon(
        name: doc.data["name"] ?? '',
        imagePath: doc.data["imagePath"] ?? '',
        ratings: doc.data["ratings"] ?? '',
        price: doc.data["price"] ?? '',
        discount: doc.data["discount"] ?? '',
        discount_percent: doc.data["discount_percent"]?? '',

      );
    }).toList();
  }


  Future updateUserData(String name, String emailID) async {
    return await profileCollection.document(uid).setData({
      'name': name,
      'emailID': emailID,

    });
  }

  Future updateRecentlyViewed(String name, String imagePath, int ratings, double price, double discount,double discount_percent) async {
    return await recentlyViewedCollection.document(current_user_uid).collection('saved').document().setData({
'name': name,
      'imagePath': imagePath,
      'ratings':ratings,
      'price': price,
      'discount': discount,
      'discount_percent': discount_percent,
    });
  }




  Stream<UserData> get userData{
    return profileCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

  Stream<List<Coupon>> get recentlyViewedData{
    return recentlyViewedCollection.document(uid).collection('saved').snapshots()
        .map(_recentlyViewedFromSnapshot);
  }



}