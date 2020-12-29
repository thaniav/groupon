import 'package:flutter/material.dart';
import 'package:groupon/models/featured_item';
import 'package:groupon/models/uid.dart';
import 'package:groupon/services/database.dart';


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
    );
  }
}
