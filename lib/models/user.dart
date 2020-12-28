import 'package:cloud_firestore/cloud_firestore.dart';


class UserID{
  final String uid;
  UserID(this.uid);
}

class UserData{
  final String uid;
  final String name;
  final String emailID;

  UserData({ this.uid, this.name, this.emailID});


}